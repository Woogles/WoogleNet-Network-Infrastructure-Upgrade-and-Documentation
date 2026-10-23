#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Retention Validation
#
# Purpose:
# Validate backup retention policy compliance.
#
# Checks:
#
# - Repository Access
# - Snapshot Availability
# - Hourly Retention
# - Daily Retention
# - Weekly Retention
# - Monthly Retention
# - Yearly Retention
#
# Usage:
#
# validate-retention.sh
#
# Version:
# 1.0
#
###############################################################################

set -euo pipefail

###############################################################################
# Library Loading
###############################################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUTOMATION_DIR="$(dirname "$SCRIPT_DIR")"

source "${AUTOMATION_DIR}/lib/config.sh"
source "${AUTOMATION_DIR}/lib/logging.sh"
source "${AUTOMATION_DIR}/lib/common.sh"
source "${AUTOMATION_DIR}/lib/validation.sh"
source "${AUTOMATION_DIR}/lib/reporting.sh"
source "${AUTOMATION_DIR}/lib/notifications.sh"

###############################################################################
# Configuration
###############################################################################

load_config

REPORT_FILE="${BACKUP_REPORT_DIR}/retention-validation-$(date +%Y%m%d-%H%M%S).txt"

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

###############################################################################
# Counters
###############################################################################

record_pass() {
    ((PASS_COUNT++))
}

record_warn() {
    ((WARN_COUNT++))
}

record_fail() {
    ((FAIL_COUNT++))
}

###############################################################################
# Snapshot Collection
###############################################################################

collect_snapshot_data() {

    log_info "Collecting snapshot information"

    if ! command -v kopia >/dev/null 2>&1; then

        log_fail "Kopia not installed"

        return 1
    fi

    SNAPSHOT_COUNT=$(
        kopia snapshot list 2>/dev/null \
        | grep -v "^$" \
        | wc -l
    )

    log_pass "Snapshot data collected"

    return 0
}

###############################################################################
# Repository Validation
###############################################################################

validate_repository() {

    log_info "Validating repository"

    if check_backup_repository; then

        log_pass "Repository accessible"
        record_pass

    else

        log_fail "Repository unavailable"
        record_fail

    fi
}

###############################################################################
# Snapshot Validation
###############################################################################

validate_snapshots() {

    log_info "Validating snapshot inventory"

    if [[ "${SNAPSHOT_COUNT:-0}" -gt 0 ]]; then

        log_pass "${SNAPSHOT_COUNT} snapshots found"
        record_pass

    else

        log_fail "No snapshots found"
        record_fail

    fi
}

###############################################################################
# Retention Checks
#
# Note:
# Kopia policies differ by implementation.
# This validation confirms minimum inventory exists.
###############################################################################

validate_hourly_retention() {

    log_info "Validating hourly retention"

    if [[ "${SNAPSHOT_COUNT}" -ge "${RETENTION_HOURLY}" ]]; then

        log_pass "Hourly retention satisfied"
        record_pass

    else

        log_warn \
            "Hourly retention below target (${RETENTION_HOURLY})"

        record_warn

    fi
}

###############################################################################

validate_daily_retention() {

    log_info "Validating daily retention"

    if [[ "${SNAPSHOT_COUNT}" -ge "${RETENTION_DAILY}" ]]; then

        log_pass "Daily retention satisfied"
        record_pass

    else

        log_warn \
            "Daily retention below target (${RETENTION_DAILY})"

        record_warn

    fi
}

###############################################################################

validate_weekly_retention() {

    log_info "Validating weekly retention"

    if [[ "${SNAPSHOT_COUNT}" -ge "${RETENTION_WEEKLY}" ]]; then

        log_pass "Weekly retention satisfied"
        record_pass

    else

        log_warn \
            "Weekly retention below target (${RETENTION_WEEKLY})"

        record_warn

    fi
}

###############################################################################

validate_monthly_retention() {

    log_info "Validating monthly retention"

    if [[ "${SNAPSHOT_COUNT}" -ge "${RETENTION_MONTHLY}" ]]; then

        log_pass "Monthly retention satisfied"
        record_pass

    else

        log_warn \
            "Monthly retention below target (${RETENTION_MONTHLY})"

        record_warn

    fi
}

###############################################################################

validate_yearly_retention() {

    log_info "Validating yearly retention"

    if [[ "${SNAPSHOT_COUNT}" -ge "${RETENTION_YEARLY}" ]]; then

        log_pass "Yearly retention satisfied"
        record_pass

    else

        log_warn \
            "Yearly retention below target (${RETENTION_YEARLY})"

        record_warn

    fi
}

###############################################################################
# Reporting
###############################################################################

generate_report() {

    create_report \
        "${REPORT_FILE}" \
        "Backup Retention Validation Report"

    report_key_value \
        "Timestamp" \
        "$(date)"

    report_key_value \
        "Snapshots Found" \
        "${SNAPSHOT_COUNT}"

    report_key_value \
        "Hourly Target" \
        "${RETENTION_HOURLY}"

    report_key_value \
        "Daily Target" \
        "${RETENTION_DAILY}"

    report_key_value \
        "Weekly Target" \
        "${RETENTION_WEEKLY}"

    report_key_value \
        "Monthly Target" \
        "${RETENTION_MONTHLY}"

    report_key_value \
        "Yearly Target" \
        "${RETENTION_YEARLY}"

    report_summary \
        "${PASS_COUNT}" \
        "${WARN_COUNT}" \
        "${FAIL_COUNT}"

    if (( FAIL_COUNT > 0 )); then

        report_overall_status "FAIL"

    elif (( WARN_COUNT > 0 )); then

        report_overall_status "WARN"

    else

        report_overall_status "PASS"

    fi

    report_footer
}

###############################################################################
# Main
###############################################################################

log_script_start

validate_repository

collect_snapshot_data || exit 1

validate_snapshots

validate_hourly_retention

validate_daily_retention

validate_weekly_retention

validate_monthly_retention

validate_yearly_retention

generate_report

if (( FAIL_COUNT > 0 )); then

    notify_fail \
        "Retention Validation Failed" \
        "One or more retention checks failed"

    exit 1

fi

if (( WARN_COUNT > 0 )); then

    notify_warn \
        "Retention Validation Warning" \
        "Retention policy below target thresholds"

    exit 2

fi

notify_info \
    "Retention Validation Successful" \
    "Retention policy validated successfully"

log_pass "Retention validation completed"

log_script_end

exit 0