#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Service Rollback
#
# Purpose:
# Roll back a service to the most recent backup.
#
# Workflow:
#
# 1. Load Configuration
# 2. Validate Service
# 3. Locate Latest Backup
# 4. Stop Current Stack
# 5. Restore Configuration
# 6. Redeploy Service
# 7. Validate Service Health
# 8. Generate Report
#
# Usage:
#
# rollback-service.sh vaultwarden
# rollback-service.sh immich
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
source "${AUTOMATION_DIR}/lib/docker.sh"
source "${AUTOMATION_DIR}/lib/reporting.sh"
source "${AUTOMATION_DIR}/lib/notifications.sh"

###############################################################################
# Configuration
###############################################################################

load_config

SERVICE_NAME="${1:-}"

REPORT_FILE="${SERVICE_REPORT_DIR}/rollback-${SERVICE_NAME}-$(date +%Y%m%d-%H%M%S).txt"

###############################################################################
# Usage
###############################################################################

show_usage() {

cat <<EOF

Usage:

rollback-service.sh <service>

Examples:

rollback-service.sh vaultwarden
rollback-service.sh immich
rollback-service.sh nextcloud

EOF

exit 1

}

###############################################################################
# Validation
###############################################################################

validate_input() {

    [[ -z "${SERVICE_NAME}" ]] && {
        log_fail "No service specified"
        show_usage
    }

    if ! validate_service_exists "${SERVICE_NAME}"; then
        log_fail "Service not found: ${SERVICE_NAME}"
        exit 1
    fi

    log_pass "Service located: ${SERVICE_NAME}"
}

validate_rollback_requirements() {

    log_info "Validating rollback requirements"

    docker_available || {
        log_fail "Docker unavailable"
        exit 1
    }

    docker_running || {
        log_fail "Docker daemon unavailable"
        exit 1
    }

    local backup

    backup="$(latest_backup "${SERVICE_NAME}")"

    if [[ -z "${backup}" ]]; then
        log_fail "No rollback backup found"
        exit 1
    fi

    log_pass "Rollback backup available"
}

###############################################################################
# Rollback Execution
###############################################################################

stop_current_service() {

    log_info "Stopping current service"

    stop_stack "${SERVICE_NAME}" || true

    log_pass "Service stopped"
}

restore_backup() {

    log_info "Restoring configuration"

    rollback_configuration "${SERVICE_NAME}" || {
        log_fail "Restore failed"
        exit 1
    }

    log_pass "Configuration restored"
}

redeploy_service() {

    log_info "Redeploying restored service"

    deploy_stack "${SERVICE_NAME}"

    sleep 15

    log_pass "Redeployment completed"
}

###############################################################################
# Validation
###############################################################################

validate_rollback() {

    log_info "Validating rollback"

    if stack_running "${SERVICE_NAME}"; then

        log_pass "Rollback validation succeeded"

        return 0
    fi

    return 1
}

###############################################################################
# Reporting
###############################################################################

generate_rollback_report() {

    local result="$1"

    create_report \
        "${REPORT_FILE}" \
        "Service Rollback Report"

    report_key_value "Service" "${SERVICE_NAME}"
    report_key_value "Timestamp" "$(date)"
    report_key_value "Operation" "ROLLBACK"
    report_key_value "Result" "${result}"

    report_footer
}

###############################################################################
# Main
###############################################################################

log_script_start

validate_input

validate_rollback_requirements

if ! confirm_action \
    "Rollback service '${SERVICE_NAME}' using most recent backup?"; then

    log_warn "Rollback cancelled by user"
    exit 0

fi

stop_current_service

restore_backup

redeploy_service

if validate_rollback; then

    generate_rollback_report "SUCCESS"

    notify_warn \
        "Rollback Completed" \
        "${SERVICE_NAME} successfully rolled back"

    log_pass "Rollback completed successfully"

    log_script_end

    exit 0

fi

generate_rollback_report "FAILED"

notify_critical \
    "Rollback Failure" \
    "${SERVICE_NAME} rollback failed validation"

log_fail "Rollback validation failed"

log_script_end

exit 1
