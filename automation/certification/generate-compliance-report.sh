#!/usr/bin/env bash

###############################################################################
#
# Purpose:
# Generate WoogleNet standards compliance report.
#
# Validates:
# - Service Documentation
# - Compose Files
# - Environment Files
# - Monitoring Definitions
# - Recovery Documentation
# - Backup Coverage
#
# Outputs:
# - Compliance Report
# - PASS/WARN/FAIL Summary
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
DATESTAMP=$(date '+%Y-%m-%d')
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

###############################################################################
# PATHS
###############################################################################

ROOT_DIR="/opt/wooglenet"

SERVICES_DIR="${ROOT_DIR}/services"
DOCS_DIR="${ROOT_DIR}/docs"
REPORT_DIR="${ROOT_DIR}/reports"

REPORT_FILE="${REPORT_DIR}/compliance-report-${DATESTAMP}.txt"

###############################################################################
# COUNTERS
###############################################################################

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

###############################################################################
# LOGGING
###############################################################################

log_pass() {
    echo "[PASS] $1" | tee -a "$REPORT_FILE"
    ((PASS_COUNT++))
}

log_warn() {
    echo "[WARN] $1" | tee -a "$REPORT_FILE"
    ((WARN_COUNT++))
}

log_fail() {
    echo "[FAIL] $1" | tee -a "$REPORT_FILE"
    ((FAIL_COUNT++))
}

###############################################################################
# REPORT HEADER
###############################################################################

initialize_report() {

    mkdir -p "$REPORT_DIR"

    cat > "$REPORT_FILE" <<EOF
====================================================================
WoogleNet Standards Compliance Report
====================================================================

Generated : ${TIMESTAMP}
Version   : ${VERSION}

====================================================================

EOF
}

###############################################################################
# REQUIRED DOCUMENTS
###############################################################################

REQUIRED_DOCUMENTS=(
    "ARCHITECTURE.md"
    "SERVICE-INVENTORY.md"
    "SERVICE-DEPENDENCIES.md"
    "OPERATIONS-RUNBOOK.md"
    "DISASTER-RECOVERY.md"
    "BACKUP-AND-RESTORE.md"
    "MONITORING-AND-ALERTING.md"
    "ENVIRONMENT-CERTIFICATION.md"
)

###############################################################################
# DOCUMENT VALIDATION
###############################################################################

validate_documents() {

    echo ""
    echo "DOCUMENTATION REVIEW" >> "$REPORT_FILE"
    echo "--------------------" >> "$REPORT_FILE"

    for doc in "${REQUIRED_DOCUMENTS[@]}"
    do
        if [[ -f "${DOCS_DIR}/${doc}" ]]; then
            log_pass "Document exists: ${doc}"
        else
            log_fail "Missing document: ${doc}"
        fi
    done
}

###############################################################################
# SERVICE VALIDATION
###############################################################################

validate_service() {

    local service="$1"
    local service_dir="${SERVICES_DIR}/${service}"

    echo "" >> "$REPORT_FILE"
    echo "SERVICE: ${service}" >> "$REPORT_FILE"

    ###########################################################################
    # Compose File
    ###########################################################################

    if [[ -f "${service_dir}/compose.yml" ]]; then
        log_pass "${service} compose.yml"
    else
        log_fail "${service} compose.yml missing"
    fi

    ###########################################################################
    # .env.example
    ###########################################################################

    if [[ -f "${service_dir}/.env.example" ]]; then
        log_pass "${service} .env.example"
    else
        log_fail "${service} .env.example missing"
    fi

    ###########################################################################
    # README
    ###########################################################################

    if [[ -f "${service_dir}/README.md" ]]; then
        log_pass "${service} README.md"
    else
        log_fail "${service} README.md missing"
    fi
}

###############################################################################
# SERVICE DISCOVERY
###############################################################################

validate_services() {

    echo ""
    echo "SERVICE REVIEW" >> "$REPORT_FILE"
    echo "--------------" >> "$REPORT_FILE"

    if [[ ! -d "$SERVICES_DIR" ]]; then
        log_fail "Services directory missing"
        return
    fi

    for service in "$SERVICES_DIR"/*
    do
        [[ -d "$service" ]] || continue

        validate_service "$(basename "$service")"
    done
}

###############################################################################
# MONITORING DOCUMENT CHECK
###############################################################################

validate_monitoring_document() {

    local monitoring_doc

    monitoring_doc="${DOCS_DIR}/MONITORING-AND-ALERTING.md"

    if [[ -f "$monitoring_doc" ]]; then
        log_pass "Monitoring standard exists"
    else
        log_fail "Monitoring standard missing"
    fi
}

###############################################################################
# BACKUP DOCUMENT CHECK
###############################################################################

validate_backup_document() {

    local backup_doc

    backup_doc="${DOCS_DIR}/BACKUP-AND-RESTORE.md"

    if [[ -f "$backup_doc" ]]; then
        log_pass "Backup standard exists"
    else
        log_fail "Backup standard missing"
    fi
}

###############################################################################
# SUMMARY
###############################################################################

generate_summary() {

    cat >> "$REPORT_FILE" <<EOF

====================================================================
SUMMARY
====================================================================

PASS : ${PASS_COUNT}
WARN : ${WARN_COUNT}
FAIL : ${FAIL_COUNT}

EOF

    if [[ "$FAIL_COUNT" -gt 0 ]]; then

        echo "OVERALL STATUS: FAIL" >> "$REPORT_FILE"

    elif [[ "$WARN_COUNT" -gt 0 ]]; then

        echo "OVERALL STATUS: WARN" >> "$REPORT_FILE"

    else

        echo "OVERALL STATUS: PASS" >> "$REPORT_FILE"

    fi
}

###############################################################################
# MAIN
###############################################################################

initialize_report

validate_documents
validate_services
validate_monitoring_document
validate_backup_document

generate_summary

echo
echo "Compliance report generated:"
echo "$REPORT_FILE"
echo