#!/usr/bin/env bash

###############################################################################
#
# Purpose:
# Validate WoogleNet monitoring infrastructure.
#
# Checks:
# - Homepage Availability
# - Uptime Kuma Availability
# - AdGuard Primary
# - AdGuard Secondary
# - Tailscale Connectivity
# - DNS Resolution
# - Certificate Expiration
#
# Outputs:
# - PASS/WARN/FAIL Results
# - Monitoring Readiness Summary
#
# Author:
# Eric Yacoub
#
# Version:
# 1.0
#
###############################################################################

set -uo pipefail

VERSION="1.0"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

###############################################################################
# CONFIGURATION
###############################################################################

# Replace with production endpoints

HOMEPAGE_URL="https://homepage.local"
UPTIMEKUMA_URL="https://uptime-kuma.local"

ADGUARD_PRIMARY="10.0.10.50"
ADGUARD_SECONDARY="10.0.10.51"

CERT_WARNING_DAYS=30
CERT_CRITICAL_DAYS=7

###############################################################################
# LOGGING
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
# HTTP VALIDATION
###############################################################################

check_http_service() {

    local name="$1"
    local url="$2"

    local http_code

    http_code=$(curl \
        --silent \
        --location \
        --max-time 10 \
        --output /dev/null \
        --write-out "%{http_code}" \
        "$url" 2>/dev/null || echo "000")

    if [[ "$http_code" =~ ^2|3 ]]; then
        log_pass "$name available (${http_code})"
    elif [[ "$http_code" =~ ^4 ]]; then
        log_warn "$name responding (${http_code})"
    else
        log_fail "$name unavailable (${http_code})"
    fi
}

###############################################################################
# DNS VALIDATION
###############################################################################

validate_dns() {

    log_info "Checking DNS infrastructure"

    if nslookup google.com "$ADGUARD_PRIMARY" >/dev/null 2>&1; then
        log_pass "AdGuard Primary resolving DNS"
    else
        log_fail "AdGuard Primary failed DNS lookup"
    fi

    if nslookup google.com "$ADGUARD_SECONDARY" >/dev/null 2>&1; then
        log_pass "AdGuard Secondary resolving DNS"
    else
        log_fail "AdGuard Secondary failed DNS lookup"
    fi
}

###############################################################################
# TAILSCALE VALIDATION
###############################################################################

validate_tailscale() {

    log_info "Checking Tailscale"

    if ! command -v tailscale >/dev/null 2>&1; then
        log_warn "Tailscale not installed"
        return
    fi

    if tailscale status >/dev/null 2>&1; then
        log_pass "Tailscale operational"
    else
        log_fail "Tailscale unavailable"
    fi
}

###############################################################################
# CERTIFICATE VALIDATION
###############################################################################

check_certificate() {

    local name="$1"
    local host="$2"

    local expiry_date
    local expiry_epoch
    local current_epoch
    local days_remaining

    expiry_date=$(
        echo | \
        openssl s_client \
        -servername "$host" \
        -connect "${host}:443" 2>/dev/null | \
        openssl x509 -noout -enddate 2>/dev/null | \
        cut -d= -f2
    )

    if [[ -z "$expiry_date" ]]; then
        log_warn "$name certificate unavailable"
        return
    fi

    expiry_epoch=$(date -d "$expiry_date" +%s 2>/dev/null)
    current_epoch=$(date +%s)

    days_remaining=$(( (expiry_epoch - current_epoch) / 86400 ))

    if [[ "$days_remaining" -le "$CERT_CRITICAL_DAYS" ]]; then
        log_fail "$name certificate expires in ${days_remaining} days"
    elif [[ "$days_remaining" -le "$CERT_WARNING_DAYS" ]]; then
        log_warn "$name certificate expires in ${days_remaining} days"
    else
        log_pass "$name certificate valid (${days_remaining} days)"
    fi
}

###############################################################################
# MONITORING SERVICES
###############################################################################

validate_monitoring_services() {

    log_info "Checking monitoring services"

    check_http_service \
        "Homepage" \
        "$HOMEPAGE_URL"

    check_http_service \
        "Uptime Kuma" \
        "$UPTIMEKUMA_URL"
}

###############################################################################
# CERTIFICATE CHECKS
###############################################################################

validate_certificates() {

    log_info "Checking certificate expiration"

    local homepage_host
    local uptime_host

    homepage_host=$(echo "$HOMEPAGE_URL" \
        | sed -E 's#https?://([^/]+).*#\1#')

    uptime_host=$(echo "$UPTIMEKUMA_URL" \
        | sed -E 's#https?://([^/]+).*#\1#')

    check_certificate \
        "Homepage" \
        "$homepage_host"

    check_certificate \
        "Uptime Kuma" \
        "$uptime_host"
}

###############################################################################
# SUMMARY
###############################################################################

print_summary() {

    echo
    echo "=================================================="
    echo "WoogleNet Monitoring Validation Summary"
    echo "=================================================="
    echo "Timestamp : $TIMESTAMP"
    echo "Version   : $VERSION"
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
# MAIN
###############################################################################

echo
echo "=================================================="
echo "WoogleNet Monitoring Validation"
echo "=================================================="
echo

validate_monitoring_services
validate_dns
validate_tailscale
validate_certificates

print_summary