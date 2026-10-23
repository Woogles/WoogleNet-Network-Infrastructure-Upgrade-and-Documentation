#!/usr/bin/env bash

###############################################################################
#
# Purpose:
# Validate WoogleNet production service availability.
#
# Checks:
# - Tier 1 Services
# - Tier 2 Services
# - Web Endpoint Availability
#
# Outputs:
# - PASS/WARN/FAIL Results
# - Service Availability Summary
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
# Service Definitions
#
# Replace URLs with your actual service URLs.
###############################################################################

declare -A SERVICES=(
    ["AdGuard Primary"]="https://adguard-primary.local"
    ["AdGuard Secondary"]="https://adguard-secondary.local"
    ["Vaultwarden"]="https://vaultwarden.local"
    ["Home Assistant"]="https://homeassistant.local"
    ["Immich"]="https://immich.local"
    ["Paperless-ngx"]="https://paperless.local"
    ["Nextcloud"]="https://nextcloud.local"
    ["BookStack"]="https://bookstack.local"

    ["Homepage"]="https://homepage.local"
    ["Uptime Kuma"]="https://uptime-kuma.local"
    ["Audiobookshelf"]="https://audiobookshelf.local"
    ["Navidrome"]="https://navidrome.local"
    ["Syncthing"]="https://syncthing.local"
)

###############################################################################
# Helper Functions
###############################################################################

check_http_service() {

    local service_name="$1"
    local service_url="$2"

    local http_code

    http_code=$(curl \
        --silent \
        --location \
        --max-time 10 \
        --output /dev/null \
        --write-out "%{http_code}" \
        "$service_url" 2>/dev/null || echo "000")

    if [[ "$http_code" =~ ^2|3 ]]; then
        log_pass "${service_name} (${http_code})"
    elif [[ "$http_code" =~ ^4 ]]; then
        log_warn "${service_name} returned ${http_code}"
    else
        log_fail "${service_name} unavailable (${http_code})"
    fi
}

###############################################################################
# Validation
###############################################################################

validate_services() {

    log_info "Validating Production Services"

    echo

    for service in "${!SERVICES[@]}"
    do
        check_http_service \
            "$service" \
            "${SERVICES[$service]}"
    done
}

###############################################################################
# Summary
###############################################################################

print_summary() {

    echo
    echo "=================================================="
    echo "WoogleNet Service Validation Summary"
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
# Main
###############################################################################

echo
echo "=================================================="
echo "WoogleNet Service Validation"
echo "=================================================="
echo

validate_services
print_summary