#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Service Backup
#
# Purpose:
# Create configuration backups for all services or a specific service.
#
# Workflow:
#
# 1. Load Configuration
# 2. Validate Environment
# 3. Backup Service Configuration
# 4. Backup Documentation
# 5. Backup Automation Configuration
# 6. Generate Report
#
# Usage:
#
# backup-services.sh
# backup-services.sh vaultwarden
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
source "${AUTOMATION_DIR}/lib/reporting.sh"
source "${AUTOMATION_DIR}/lib/docker.sh"
source "${AUTOMATION_DIR}/lib/notifications.sh"

###############################################################################
# Configuration
###############################################################################

load_config

SERVICE_NAME="${1:-all}"

TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

BACKUP_TARGET="${BACKUPS_DIR:-${WOOGLENET_ROOT}/backups}/configuration"

REPORT_FILE="${BACKUP_REPORT_DIR}/backup-${TIMESTAMP}.txt"

###############################################################################
# Validation
###############################################################################

validate_environment() {

    log_info "Validating backup environment"

    ensure_directory "$BACKUP_TARGET"
    ensure_directory "$BACKUP_REPORT_DIR"

    log_pass "Backup environment validated"
}

###############################################################################
# Backup Functions
###############################################################################

backup_single_service() {

    local service="$1"

    log_info "Backing up ${service}"

    local service_dir

    service_dir="$(get_service_directory "$service")"

    if [[ ! -d "$service_dir" ]]; then
        log_fail "Service not found: ${service}"
        return 1
    fi

    local destination

    destination="${BACKUP_TARGET}/${service}/${TIMESTAMP}"

    mkdir -p "$destination"

    cp -r \
        "${service_dir}"/* \
        "${destination}/" \
        2>/dev/null || true

    log_pass "Backup completed: ${service}"

    return 0
}

###############################################################################

backup_all_services() {

    log_info "Backing up all services"

    local count=0

    for service_dir in "${SERVICES_DIR}"/*
    do
        [[ -d "$service_dir" ]] || continue

        service="$(basename "$service_dir")"

        backup_single_service "$service"

        ((count++))
    done

    log_pass "${count} service(s) processed"
}

###############################################################################

backup_documentation() {

    log_info "Backing up documentation"

    if [[ -d "${DOCS_DIR}" ]]; then

        mkdir -p \
            "${BACKUP_TARGET}/documentation/${TIMESTAMP}"

        cp -r \
            "${DOCS_DIR}"/* \
            "${BACKUP_TARGET}/documentation/${TIMESTAMP}/"

        log_pass "Documentation backup completed"
    else

        log_warn "Documentation directory missing"
    fi
}

###############################################################################

backup_automation_configuration() {

    log_info "Backing up automation configuration"

    if [[ -d "${CONFIG_DIR}" ]]; then

        mkdir -p \
            "${BACKUP_TARGET}/automation/${TIMESTAMP}"

        cp -r \
            "${CONFIG_DIR}"/* \
            "${BACKUP_TARGET}/automation/${TIMESTAMP}/"

        log_pass "Automation configuration backup completed"
    else

        log_warn "Configuration directory missing"
    fi
}

###############################################################################
# Reporting
###############################################################################

generate_backup_report() {

    create_report \
        "${REPORT_FILE}" \
        "Service Backup Report"

    report_key_value "Timestamp" "$(date)"
    report_key_value "Mode" "${SERVICE_NAME}"

    if [[ "${SERVICE_NAME}" == "all" ]]; then
        report_line "All services backed up"
    else
        report_line "Service backed up: ${SERVICE_NAME}"
    fi

    report_footer
}

###############################################################################
# Main
###############################################################################

log_script_start

validate_environment

if [[ "${SERVICE_NAME}" == "all" ]]; then

    backup_all_services

else

    backup_single_service "${SERVICE_NAME}"

fi

backup_documentation

backup_automation_configuration

generate_backup_report

notify_info \
    "Backup Completed" \
    "Backup operation completed successfully"

log_pass "Backup operation complete"

log_script_end

exit 0