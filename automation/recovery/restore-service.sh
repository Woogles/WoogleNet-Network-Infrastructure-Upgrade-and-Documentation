#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Service Restore
#
# Purpose:
# Restore a service from backup and redeploy it.
#
# Workflow:
#
# 1. Load Configuration
# 2. Validate Restore Requirements
# 3. Locate Restore Source
# 4. Stop Existing Service
# 5. Restore Configuration
# 6. Rebuild Service Stack
# 7. Validate Service Health
# 8. Generate Restore Report
#
# Usage:
#
# restore-service.sh vaultwarden
# restore-service.sh immich
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

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

REPORT_FILE="${RECOVERY_REPORT_DIR}/restore-${SERVICE_NAME}-${TIMESTAMP}.txt"

###############################################################################
# Usage
###############################################################################

show_usage() {

cat <<EOF

Usage:

restore-service.sh <service>

Examples:

restore-service.sh vaultwarden
restore-service.sh immich
restore-service.sh paperless

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

    validate_service_exists "${SERVICE_NAME}" || {
        log_fail "Service not found: ${SERVICE_NAME}"
        exit 1
    }

    log_pass "Service validated"
}

###############################################################################

validate_restore_requirements() {

    log_info "Validating restore requirements"

    docker_available || {
        log_fail "Docker unavailable"
        exit 1
    }

    docker_running || {
        log_fail "Docker daemon unavailable"
        exit 1
    }

    compose_available || {
        log_fail "Docker Compose unavailable"
        exit 1
    }

    local backup

    backup="$(latest_backup "${SERVICE_NAME}")"

    if [[ -z "$backup" ]]; then

        log_fail "No backup available"

        exit 1
    fi

    log_pass "Restore requirements satisfied"
}

###############################################################################
# Backup Discovery
###############################################################################

discover_restore_source() {

    RESTORE_SOURCE="$(latest_backup "${SERVICE_NAME}")"

    if [[ -z "${RESTORE_SOURCE}" ]]; then

        log_fail "Unable to locate restore source"

        exit 1
    fi

    log_info "Restore source: ${RESTORE_SOURCE}"
}

###############################################################################
# Restore Functions
###############################################################################

stop_service() {

    log_info "Stopping service"

    stop_stack "${SERVICE_NAME}" || true

    log_pass "Service stopped"
}

###############################################################################

restore_configuration() {

    log_info "Restoring configuration"

    rollback_configuration "${SERVICE_NAME}" || {
        log_fail "Configuration restore failed"
        exit 1
    }

    log_pass "Configuration restored"
}

###############################################################################

redeploy_service() {

    log_info "Redeploying service"

    deploy_stack "${SERVICE_NAME}"

    sleep 15

    log_pass "Service redeployed"
}

###############################################################################
# Validation
###############################################################################

validate_restored_service() {

    log_info "Validating restored service"

    if stack_running "${SERVICE_NAME}"; then

        log_pass "Service running"

        return 0
    fi

    log_fail "Service validation failed"

    return 1
}

###############################################################################
# Reporting
###############################################################################

generate_restore_report() {

    create_report \
        "${REPORT_FILE}" \
        "Service Restore Report"

    report_key_value "Service" "${SERVICE_NAME}"
    report_key_value "Timestamp" "$(date)"
    report_key_value "Restore Source" "${RESTORE_SOURCE}"
    report_key_value "Operation" "RESTORE"

    report_footer
}

###############################################################################
# Main
###############################################################################

log_script_start

validate_input

validate_restore_requirements

if ! confirm_action \
    "Restore ${SERVICE_NAME} from latest backup?"; then

    log_warn "Restore cancelled"

    exit 0
fi

discover_restore_source

stop_service

restore_configuration

redeploy_service

if validate_restored_service; then

    generate_restore_report

    notify_info \
        "Restore Completed" \
        "${SERVICE_NAME} restored successfully"

    log_pass "Restore completed successfully"

    log_script_end

    exit 0

fi

notify_critical \
    "Restore Failure" \
    "${SERVICE_NAME} failed post-restore validation"

log_fail "Restore failed validation"

log_script_end

exit 1