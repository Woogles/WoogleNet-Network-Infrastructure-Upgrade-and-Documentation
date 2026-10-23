#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Service Update
#
# Purpose:
# Safely update an existing service stack.
#
# Workflow:
#
# 1. Load Configuration
# 2. Validate Service
# 3. Backup Current Configuration
# 4. Pull Updated Images
# 5. Update Stack
# 6. Validate Service Health
# 7. Rollback (Optional)
# 8. Generate Report
#
# Usage:
#
# update-service.sh vaultwarden
# update-service.sh immich
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

REPORT_FILE="${SERVICE_REPORT_DIR}/update-${SERVICE_NAME}-$(date +%Y%m%d-%H%M%S).txt"

###############################################################################
# Usage
###############################################################################

show_usage() {

cat <<EOF

Usage:

update-service.sh <service>

Examples:

update-service.sh vaultwarden
update-service.sh immich
update-service.sh nextcloud

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

validate_environment() {

    log_info "Validating environment"

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

    validate_service_structure "${SERVICE_NAME}" || {
        log_fail "Invalid service structure"
        exit 1
    }

    validate_compose "${SERVICE_NAME}" || {
        log_fail "Compose validation failed"
        exit 1
    }

    log_pass "Environment validation complete"
}

###############################################################################
# Backup
###############################################################################

create_backup() {

    log_info "Creating rollback backup"

    backup_service_configuration "${SERVICE_NAME}"

    log_pass "Backup complete"
}

###############################################################################
# Update
###############################################################################

update_images() {

    log_info "Pulling latest images"

    pull_images "${SERVICE_NAME}"

    log_pass "Images updated"
}

deploy_update() {

    log_info "Deploying updated service"

    update_stack "${SERVICE_NAME}"

    sleep 15

    log_pass "Update deployment completed"
}

###############################################################################
# Validation
###############################################################################

validate_update() {

    log_info "Validating updated service"

    if stack_running "${SERVICE_NAME}"; then

        log_pass "Service running after update"

        return 0
    fi

    return 1
}

###############################################################################
# Rollback
###############################################################################

rollback_if_enabled() {

    if [[ "${AUTO_ROLLBACK_ON_FAILURE:-false}" != "true" ]]; then
        log_warn "Automatic rollback disabled"
        return 1
    fi

    log_warn "Starting automatic rollback"

    if rollback_configuration "${SERVICE_NAME}"; then

        deploy_stack "${SERVICE_NAME}"

        notify_warn \
            "Rollback Executed" \
            "${SERVICE_NAME} rolled back after failed update"

        return 0
    fi

    return 1
}

###############################################################################
# Reporting
###############################################################################

generate_update_report() {

    local result="$1"

    create_report \
        "${REPORT_FILE}" \
        "Service Update Report"

    report_key_value "Service" "${SERVICE_NAME}"
    report_key_value "Timestamp" "$(date)"
    report_key_value "Operation" "UPDATE"
    report_key_value "Result" "${result}"

    report_footer
}

###############################################################################
# Main
###############################################################################

log_script_start

validate_input

validate_environment

create_backup

update_images

deploy_update

if validate_update; then

    generate_update_report "SUCCESS"

    notify_deployment_success "${SERVICE_NAME}"

    log_pass "Update completed successfully"

    log_script_end

    exit 0

fi

log_fail "Update validation failed"

rollback_if_enabled || true

generate_update_report "FAILED"

notify_deployment_failure "${SERVICE_NAME}"

log_script_end

exit 1