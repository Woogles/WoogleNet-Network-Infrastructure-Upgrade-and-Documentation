#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Validation Library
#
# Purpose:
# Shared validation functions for operational readiness,
# monitoring, backup verification, deployment validation,
# and certification workflows.
#
# Used By:
#
# - validate-environment.sh
# - validate-services.sh
# - validate-backups.sh
# - validate-monitoring.sh
# - validate-recovery.sh
# - deploy-service.sh
# - update-service.sh
#
# Version:
# 1.0
#
###############################################################################

###############################################################################
# DNS Validation
###############################################################################

check_dns() {

    local dns_server="$1"
    local domain="${2:-google.com}"

    nslookup "$domain" "$dns_server" >/dev/null 2>&1
}

###############################################################################
# Host Validation
###############################################################################

check_ping() {

    local host="$1"

    ping -c 1 -W 3 "$host" >/dev/null 2>&1
}

###############################################################################
# Port Validation
###############################################################################

check_port() {

    local host="$1"
    local port="$2"

    timeout 5 bash -c \
        "</dev/tcp/${host}/${port}" \
        >/dev/null 2>&1
}

###############################################################################
# HTTP Validation
###############################################################################

check_http() {

    local url="$1"

    curl \
        --silent \
        --fail \
        --location \
        --max-time 10 \
        "$url" \
        >/dev/null 2>&1
}

get_http_status() {

    local url="$1"

    curl \
        --silent \
        --location \
        --max-time 10 \
        --output /dev/null \
        --write-out "%{http_code}" \
        "$url"
}

###############################################################################
# Certificate Validation
###############################################################################

certificate_days_remaining() {

    local host="$1"

    local expiry_date
    local expiry_epoch
    local current_epoch

    expiry_date=$(
        echo | \
        openssl s_client \
        -servername "$host" \
        -connect "${host}:443" 2>/dev/null | \
        openssl x509 \
        -noout \
        -enddate 2>/dev/null | \
        cut -d= -f2
    )

    [[ -z "$expiry_date" ]] && return 1

    expiry_epoch=$(date -d "$expiry_date" +%s)
    current_epoch=$(date +%s)

    echo $(( (expiry_epoch - current_epoch) / 86400 ))
}

check_certificate() {

    local host="$1"
    local warning_days="${2:-30}"
    local critical_days="${3:-7}"

    local days_remaining

    days_remaining=$(certificate_days_remaining "$host") || return 3

    if [[ "$days_remaining" -le "$critical_days" ]]; then
        return 2
    fi

    if [[ "$days_remaining" -le "$warning_days" ]]; then
        return 1
    fi

    return 0
}

###############################################################################
# Storage Validation
###############################################################################

filesystem_usage() {

    local path="$1"

    df "$path" | awk 'NR==2 {print $5}' | tr -d '%'
}

check_storage() {

    local path="$1"
    local warning="${2:-80}"
    local critical="${3:-90}"

    local usage

    usage=$(filesystem_usage "$path")

    if [[ "$usage" -ge "$critical" ]]; then
        return 2
    fi

    if [[ "$usage" -ge "$warning" ]]; then
        return 1
    fi

    return 0
}

###############################################################################
# Docker Validation
###############################################################################

check_docker() {

    docker info >/dev/null 2>&1
}

check_compose() {

    docker compose version >/dev/null 2>&1
}

validate_compose_file() {

    local compose_file="$1"

    docker compose \
        -f "$compose_file" \
        config \
        >/dev/null 2>&1
}

###############################################################################
# Service Validation
###############################################################################

check_service_health() {

    local service_url="$1"

    local status

    status=$(get_http_status "$service_url")

    [[ "$status" =~ ^2|3 ]]
}

###############################################################################
# Backup Validation
###############################################################################

check_backup_repository() {

    kopia repository status >/dev/null 2>&1
}

check_snapshot_catalog() {

    kopia snapshot list >/dev/null 2>&1
}

check_backup_age() {

    local warning_days="${1:-1}"
    local critical_days="${2:-7}"

    local snapshot_date
    local snapshot_epoch
    local current_epoch
    local age_days

    snapshot_date=$(
        kopia snapshot list --json 2>/dev/null \
        | grep -o '"startTime":"[^"]*"' \
        | head -1 \
        | cut -d'"' -f4
    )

    [[ -z "$snapshot_date" ]] && return 3

    snapshot_epoch=$(date -d "$snapshot_date" +%s)
    current_epoch=$(date +%s)

    age_days=$(( (current_epoch - snapshot_epoch) / 86400 ))

    if [[ "$age_days" -ge "$critical_days" ]]; then
        return 2
    fi

    if [[ "$age_days" -ge "$warning_days" ]]; then
        return 1
    fi

    return 0
}

###############################################################################
# Monitoring Validation
###############################################################################

check_tailscale() {

    tailscale status >/dev/null 2>&1
}

###############################################################################
# Recovery Validation
###############################################################################

check_restore_catalog() {

    kopia snapshot list >/dev/null 2>&1
}

check_restore_target() {

    local path="$1"

    [[ -d "$path" ]]
}

###############################################################################
# Environment Validation
###############################################################################

check_required_directory() {

    local directory="$1"

    [[ -d "$directory" ]]
}

check_required_file() {

    local file="$1"

    [[ -f "$file" ]]
}

check_required_command() {

    command -v "$1" >/dev/null 2>&1
}

###############################################################################
# Service Structure Validation
###############################################################################

validate_service_structure() {

    local service_dir="$1"

    [[ -f "${service_dir}/compose.yml" ]] &&
    [[ -f "${service_dir}/README.md" ]] &&
    [[ -f "${service_dir}/.env.example" ]]
}

###############################################################################
# Overall Result Evaluation
###############################################################################

overall_status() {

    local fail_count="$1"
    local warn_count="$2"

    if [[ "$fail_count" -gt 0 ]]; then
        echo "FAIL"
        return 1
    fi

    if [[ "$warn_count" -gt 0 ]]; then
        echo "WARN"
        return 2
    fi

    echo "PASS"
    return 0
}

###############################################################################
# End Of File
###############################################################################