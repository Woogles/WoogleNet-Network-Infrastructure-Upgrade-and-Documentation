#!/usr/bin/env bash

###############################################################################
#
# Purpose:
# Validate WoogleNet backup health and recovery readiness.
#
# Checks:
# - Kopia installed
# - Repository accessible
# - Latest snapshot age
# - Backup storage path
# - Repository status
#
# Outputs:
# - PASS/WARN/FAIL Results
# - Backup Readiness Summary
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

BACKUP_PATH="/storage/backups"

###############################################################################
# Logging Functions
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

validate_backup_storage() {

    log_info "Checking backup storage"

    if [[ -d "$BACKUP_PATH" ]]; then
        log_pass "Backup path exists ($BACKUP_PATH)"
    else
        log_fail "Backup path missing ($BACKUP_PATH)"
    fi
}

###############################################################################

validate_kopia_installation() {

    log_info "Checking Kopia installation"

    if command -v kopia >/dev/null 2>&1; then
        log_pass "Kopia installed"
    else
        log_fail "Kopia not installed"
    fi
}

###############################################################################

validate_repository() {

    log_info "Checking repository accessibility"

    if kopia repository status >/dev/null 2>&1; then
        log_pass "Repository accessible"
    else
        log_fail "Repository unavailable"
    fi
}

###############################################################################

validate_repository_health() {

    log_info "Validating repository health"

    if kopia repository status >/dev/null 2>&1; then
        log_pass "Repository health check passed"
    else
        log_fail "Repository health validation failed"
    fi
}

###############################################################################

validate_snapshots() {

    log_info "Checking backup snapshots"

    local snapshot_info
    local snapshot_date
    local snapshot_epoch
    local current_epoch
    local age_days

    snapshot_info=$(kopia snapshot list --json 2>/dev/null)

    if [[ -z "$snapshot_info" || "$snapshot_info" == "[]" ]]; then
        log_fail "No snapshots found"
        return
    fi

    snapshot_date=$(echo "$snapshot_info" \
        | grep -o '"startTime":"[^"]*"' \
        | head -1 \
        | cut -d'"' -f4)

    if [[ -z "$snapshot_date" ]]; then
        log_warn "Unable to determine latest snapshot age"
        return
    fi

    snapshot_epoch=$(date -d "$snapshot_date" +%s 2>/dev/null)
    current_epoch=$(date +%s)

    age_days=$(( (current_epoch - snapshot_epoch) / 86400 ))

    if [[ "$age_days" -le 1 ]]; then
        log_pass "Latest snapshot ${age_days} day(s) old"
    elif [[ "$age_days" -le 7 ]]; then
        log_warn "Latest snapshot ${age_days} day(s) old"
    else
        log_fail "Latest snapshot ${age_days} day(s) old"
    fi
}

###############################################################################

validate_restore_capability() {

    log_info "Validating restore readiness"

    if kopia snapshot list >/dev/null 2>&1; then
        log_pass "Recovery catalog accessible"
    else
        log_fail "Recovery catalog unavailable"
    fi
}

###############################################################################
# Summary
###############################################################################

print_summary() {

    echo
    echo "=================================================="
    echo "WoogleNet Backup Validation Summary"
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
echo "WoogleNet Backup Validation"
echo "=================================================="
echo

validate_backup_storage
validate_kopia_installation
validate_repository
validate_repository_health
validate_snapshots
validate_restore_capability

print_summary
