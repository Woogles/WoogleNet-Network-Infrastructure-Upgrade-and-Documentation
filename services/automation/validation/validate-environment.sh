#!/usr/bin/env bash

###############################################################################
#
# Purpose:
# Validate core WoogleNet infrastructure health.
#
# Checks:
# - DNS Resolution
# - Storage Availability
# - Docker Availability
# - Internet Connectivity
# - Tailscale Connectivity
# - Backup Storage
#
# Outputs:
# - PASS/WARN/FAIL Results
# - Summary Statistics
#
# Author:
# Eric Yacoub
#
# Version:
# 1.0
#
###############################################################################

set -uo pipefail

SCRIPT_VERSION="1.0"

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

DNS_PRIMARY="10.0.10.50"
DNS_SECONDARY="10.0.10.51"

STORAGE_PATH="/storage"
BACKUP_PATH="/storage/backups"

###############################################################################
# Logging
###############################################################################

log_info() {
    echo "[INFO] $1"
}

log_pass() {
    echo "[PASS] $1"
    ((PASS_COUNT++))
}

log_warn() {
    echo "[WARN] $1"
    ((WARN_COUNT++))
}

log_fail() {
    echo "[FAIL] $1"
    ((FAIL_COUNT++))
}

###############################################################################
# Validation Functions
###############################################################################

validate_dns() {

    log_info "Checking DNS Resolution"

    if nslookup google.com "$DNS_PRIMARY" >/dev/null 2>&1; then
        log_pass "Primary DNS reachable (${DNS_PRIMARY})"
    else
        log_fail "Primary DNS unavailable (${DNS_PRIMARY})"
    fi

    if nslookup google.com "$DNS_SECONDARY" >/dev/null 2>&1; then
        log_pass "Secondary DNS reachable (${DNS_SECONDARY})"
    else
        log_fail "Secondary DNS unavailable (${DNS_SECONDARY})"
    fi
}

###############################################################################

validate_internet() {

    log_info "Checking Internet Connectivity"

    if ping -c 2 8.8.8.8 >/dev/null 2>&1; then
        log_pass "Internet connectivity verified"
    else
        log_fail "Internet connectivity failed"
    fi
}

###############################################################################

validate_storage() {

    log_info "Checking Storage"

    if [[ -d "$STORAGE_PATH" ]]; then
        log_pass "Storage path exists ($STORAGE_PATH)"
    else
        log_fail "Storage path missing ($STORAGE_PATH)"
    fi

    if [[ -d "$BACKUP_PATH" ]]; then
        log_pass "Backup path exists ($BACKUP_PATH)"
    else
        log_fail "Backup path missing ($BACKUP_PATH)"
    fi
}

###############################################################################

validate_docker() {

    log_info "Checking Docker"

    if command -v docker >/dev/null 2>&1; then
        log_pass "Docker installed"
    else
        log_fail "Docker not installed"
        return
    fi

    if docker info >/dev/null 2>&1; then
        log_pass "Docker daemon operational"
    else
        log_fail "Docker daemon unavailable"
    fi
}

###############################################################################

validate_tailscale() {

    log_info "Checking Tailscale"

    if ! command -v tailscale >/dev/null 2>&1; then
        log_warn "Tailscale command not found"
        return
    fi

    if tailscale status >/dev/null 2>&1; then
        log_pass "Tailscale operational"
    else
        log_fail "Tailscale unavailable"
    fi
}

###############################################################################

validate_disk_capacity() {

    log_info "Checking Storage Capacity"

    if [[ ! -d "$STORAGE_PATH" ]]; then
        log_warn "Skipping capacity check"
        return
    fi

    USAGE=$(df "$STORAGE_PATH" | awk 'NR==2 {print $5}' | tr -d '%')

    if [[ "$USAGE" -lt 80 ]]; then
        log_pass "Storage utilization ${USAGE}%"
    elif [[ "$USAGE" -lt 90 ]]; then
        log_warn "Storage utilization warning ${USAGE}%"
    else
        log_fail "Storage utilization critical ${USAGE}%"
    fi
}

###############################################################################

print_summary() {

    echo
    echo "=================================================="
    echo "WoogleNet Environment Validation Summary"
    echo "=================================================="
    echo "Timestamp: $TIMESTAMP"
    echo "Version:   $SCRIPT_VERSION"
    echo
    echo "PASS : $PASS_COUNT"
    echo "WARN : $WARN_COUNT"
    echo "FAIL : $FAIL_COUNT"
    echo

    if [[ "$FAIL_COUNT" -gt 0 ]]; then
        echo "OVERALL STATUS: FAIL"
        exit 1
    elif [[ "$WARN_COUNT" -gt 0 ]]; then
        echo "OVERALL STATUS: WARN"
        exit 2
    else
        echo "OVERALL STATUS: PASS"
        exit 0
    fi
}

###############################################################################
# Main
###############################################################################

echo
echo "=================================================="
echo "WoogleNet Environment Validation"
echo "=================================================="
echo

validate_internet
validate_dns
validate_storage
validate_disk_capacity
validate_docker
validate_tailscale

print_summary