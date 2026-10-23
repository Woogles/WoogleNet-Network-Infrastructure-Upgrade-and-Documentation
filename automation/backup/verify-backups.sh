#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Backup Verification
#
# Purpose:
# Verify backup health, repository access, backup artifacts,
# and recovery readiness.
#
# Workflow:
#
# 1. Load Configuration
# 2. Verify Backup Repository
# 3. Verify Snapshots
# 4. Verify Service Backups
# 5. Verify Documentation Backups
# 6. Verify Automation Backups
# 7. Generate Report
#
# Usage:
#
# verify-backups.sh
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

REPORT_FILE="${BACKUP_REPORT_DIR}/backup-verification-$(date +%Y%m%d-%H%M%S).txt"

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

###############################################################################
# Result Helpers
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
# Repository Validation
###############################################################################

verify_repository() {

    log_info "Verifying backup repository"

    if check_backup_repository; then

        log_pass "Kopia repository reachable"
        record_pass

    else

        log_fail "Kopia repository unavailable"
        record_fail

    fi
}

###############################################################################
# Snapshot Validation
###############################################################################

verify_snapshots() {

    log_info "Verifying snapshots"

    if check_snapshot_catalog; then

        log_pass "Snapshot catalog available"
        record_pass

    else

        log_fail "Snapshot catalog unavailable"
        record_fail

    fi
}

###############################################################################
# Backup Age Validation
###############################################################################

verify_snapshot_age() {

    log_info "Checking snapshot age"

    if check_backup_age \
        "${SNAPSHOT_WARNING_DAYS:-1}" \
        "${SNAPSHOT_CRITICAL_DAYS:-7}"
    then

        log_pass "Snapshot age within policy"
        record_pass

    else

        case $? in

            1)
                log_warn "Snapshot approaching warning threshold"
                record_warn
                ;;

            2)
                log_fail "Snapshot exceeds retention threshold"
                record_fail
                ;;

            *)
                log_fail "Unable to validate snapshot age"
                record_fail
                ;;
        esac
    fi
}

###############################################################################
# Service Backup Validation
###############################################################################

verify_service_backups() {

    log_info "Verifying service backup artifacts"

    local backup_root
    local count=0

    backup_root="${BACKUPS_DIR:-${WOOGLENET_ROOT}/backups}/configuration"

    if [[ ! -d "$backup_root" ]]; then

        log_fail "Backup directory missing"
        record_fail

        return
    fi

    for service_dir in "${SERVICES_DIR}"/*
    do
        [[ -d "$service_dir" ]] || continue

        local service
        service=$(basename "$service_dir")

        if [[ -d "${backup_root}/${service}" ]]; then

            log_pass "${service} backup exists"
            record_pass

        else

            log_warn "${service} backup missing"
            record_warn

        fi

        ((count++))
    done

    log_info "${count} service(s) validated"
}

###############################################################################
# Documentation Validation
###############################################################################

verify_documentation_backup() {

    log_info "Verifying documentation backups"

    local backup_root

    backup_root="${BACKUPS_DIR:-${WOOGLENET_ROOT}/backups}/configuration/documentation"

    if [[ -d "$backup_root" ]]; then

        log_pass "Documentation backups exist"
        record_pass

    else

        log_warn "Documentation backups missing"
        record_warn

    fi
}

###############################################################################
# Automation Configuration Validation
###############################################################################

verify_automation_backup() {

    log_info "Verifying automation backups"

    local backup_root

    backup_root="${BACKUPS_DIR:-${WOOGLENET_ROOT}/backups}/configuration/automation"

    if [[ -d "$backup_root" ]]; then

        log_pass "Automation backups exist"
        record_pass

    else

        log_warn "Automation backups missing"
        record_warn

    fi
}

###############################################################################
# Reporting
###############################################################################

generate_report() {

    create_report \
        "${REPORT_FILE}" \
        "Backup Verification Report"

    report_key_value "Timestamp" "$(date)"
    report_key_value "Repository" "${BACKUP_REPOSITORY_NAME:-Unknown}"

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

verify_repository

verify_snapshots

verify_snapshot_age

verify_service_backups

verify_documentation_backup

verify_automation_backup

generate_report

if (( FAIL_COUNT > 0 )); then

    notify_fail \
        "Backup Verification Failed" \
        "${FAIL_COUNT} backup verification failure(s) detected"

    exit 1

fi

if (( WARN_COUNT > 0 )); then

    notify_warn \
        "Backup Verification Warning" \
        "${WARN_COUNT} warning(s) detected"

    exit 2

fi

notify_info \
    "Backup Verification Successful" \
    "All backup verification checks passed"

log_pass "Backup verification completed successfully"

log_script_end

exit 0