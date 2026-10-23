#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Service Deployment
#
# Purpose:
# Deploy a WoogleNet service stack.
#
# Workflow:
#
# 1. Load Configuration
# 2. Validate Service Structure
# 3. Validate Compose Configuration
# 4. Backup Existing Configuration
# 5. Pull Images
# 6. Deploy Stack
# 7. Validate Deployment
# 8. Generate Report
#
# Usage:
#
# deploy-service.sh vaultwarden
# deploy-service.sh immich
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
# Initialization
###############################################################################

load_config

SERVICE_NAME="${1:-}"

REPORT_FILE="${SERVICE_REPORT_DIR}/deploy-${SERVICE_NAME}-$(date +%Y%m%d-%H%M%S).txt"

###############################################################################
# Functions
###############################################################################

show_usage() {

    cat <<EOF

Usage:

deploy-service.sh <service>

Examples:

deploy-service.sh vaultwarden
deploy-service.sh immich
deploy-service.sh nextcloud

EOF

    exit 1
}

validate_input() {

    if [[ -z "${SERVICE_NAME}" ]]; then
        log_fail "No service specified"
        show_usage
    fi

    if ! validate_service_exists "${SERVICE_NAME}"; then
        log_fail "Service not found: ${SERVICE_NAME}"
        exit 1
    fi

    log_pass "Service located: ${SERVICE_NAME}"
}

validate_prerequisites() {

    log_info "Validating deployment prerequisites"

    if ! docker_available; then
        log_fail "Docker unavailable"
        exit 1
    fi

    if ! docker_running; then
        log_fail "Docker daemon unavailable"
        exit 1
    fi

    if ! compose_available; then
        log_fail "Docker Compose unavailable"
        exit 1
    fi

    log_pass "Docker environment healthy"
}

validate_service_configuration() {

    log_info "Validating service configuration"

    if ! validate_service_structure "${SERVICE_NAME}"; then
        log_fail "Invalid service structure"
        exit 1
    fi

    if ! validate_compose "${SERVICE_NAME}"; then
        log_fail "Compose validation failed"
        exit 1
    fi

    log_pass "Service configuration valid"
}

create_deployment_backup() {

    log_info "Creating deployment backup"

    backup_service_configuration "${SERVICE_NAME}"

    log_pass "Deployment backup created"
}

pull_service_images() {

    log_info "Pulling service images"

    pull_images "${SERVICE_NAME}"

    log_pass "Images updated"
}

deploy_service_stack() {

    log_info "Deploying service"

    deploy_stack "${SERVICE_NAME}"

    sleep 10

    log_pass "Deployment completed"
}

validate_deployment() {

    log_info "Validating deployment"

    if stack_running "${SERVICE_NAME}"; then

        log_pass "Service is running"

    else

        log_fail "Service failed validation"

        notify_deployment_failure "${SERVICE_NAME}"

        exit 1
    fi
}

generate_deployment_report() {

    create_report \
        "${REPORT_FILE}" \
        "Service Deployment Report"

    report_key_value "Service" "${SERVICE_NAME}"
    report_key_value "Timestamp" "$(date)"
    report_key_value "Result" "SUCCESS"

    report_footer
}

###############################################################################
# Main
###############################################################################

log_script_start

validate_input

validate_prerequisites

validate_service_configuration

create_deployment_backup

pull_service_images

deploy_service_stack

validate_deployment

generate_deployment_report

notify_deployment_success "${SERVICE_NAME}"

log_pass "Deployment successful"

log_script_end

exit 0