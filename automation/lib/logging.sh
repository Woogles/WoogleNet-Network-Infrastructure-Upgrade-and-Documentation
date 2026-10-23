#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Reporting Library
#
# Purpose:
# Shared reporting functions for all WoogleNet automation.
#
# Used By:
#
# - generate-service-report.sh
# - generate-capacity-report.sh
# - generate-compliance-report.sh
# - generate-certification-package.sh
# - validation scripts
# - recovery scripts
#
# Dependencies:
#
# - config.sh
# - logging.sh
#
# Version:
# 1.0
#
###############################################################################

###############################################################################
# Report State
###############################################################################

REPORT_FILE=""
REPORT_TITLE=""
REPORT_STARTED=""

###############################################################################
# Timestamp Helpers
###############################################################################

report_timestamp() {

    date '+%Y-%m-%d %H:%M:%S'
}

report_datestamp() {

    date '+%Y-%m-%d'
}

###############################################################################
# Report Initialization
###############################################################################

create_report() {

    local report_path="$1"
    local report_title="$2"

    REPORT_FILE="$report_path"
    REPORT_TITLE="$report_title"
    REPORT_STARTED="$(report_timestamp)"

    mkdir -p "$(dirname "$REPORT_FILE")"

    cat > "$REPORT_FILE" <<EOF
===============================================================================
${REPORT_TITLE}
===============================================================================

Generated: ${REPORT_STARTED}

EOF
}

###############################################################################
# Markdown Report Initialization
###############################################################################

create_markdown_report() {

    local report_path="$1"
    local report_title="$2"

    REPORT_FILE="$report_path"
    REPORT_TITLE="$report_title"
    REPORT_STARTED="$(report_timestamp)"

    mkdir -p "$(dirname "$REPORT_FILE")"

    cat > "$REPORT_FILE" <<EOF
# ${REPORT_TITLE}

Generated: ${REPORT_STARTED}

EOF
}

###############################################################################
# Section Management
###############################################################################

report_section() {

    local title="$1"

    cat >> "$REPORT_FILE" <<EOF

===============================================================================
${title}
===============================================================================

EOF
}

report_markdown_section() {

    local title="$1"

    cat >> "$REPORT_FILE" <<EOF

## ${title}

EOF
}

###############################################################################
# Content Writers
###############################################################################

report_line() {

    echo "$1" >> "$REPORT_FILE"
}

report_blank_line() {

    echo "" >> "$REPORT_FILE"
}

report_key_value() {

    local key="$1"
    local value="$2"

    printf "%-35s %s\n" "${key}:" "${value}" >> "$REPORT_FILE"
}

###############################################################################
# Status Writers
###############################################################################

report_pass() {

    local message="$1"

    echo "[PASS] ${message}" >> "$REPORT_FILE"
}

report_warn() {

    local message="$1"

    echo "[WARN] ${message}" >> "$REPORT_FILE"
}

report_fail() {

    local message="$1"

    echo "[FAIL] ${message}" >> "$REPORT_FILE"
}

###############################################################################
# Markdown Status Writers
###############################################################################

report_md_pass() {

    echo "- ✅ $1" >> "$REPORT_FILE"
}

report_md_warn() {

    echo "- ⚠️ $1" >> "$REPORT_FILE"
}

report_md_fail() {

    echo "- ❌ $1" >> "$REPORT_FILE"
}

###############################################################################
# Table Helpers
###############################################################################

report_table_header() {

    local header="$1"

    echo "$header" >> "$REPORT_FILE"
}

report_table_separator() {

    local separator="$1"

    echo "$separator" >> "$REPORT_FILE"
}

report_table_row() {

    local row="$1"

    echo "$row" >> "$REPORT_FILE"
}

###############################################################################
# Markdown Table Helpers
###############################################################################

markdown_table_header() {

    echo "$1" >> "$REPORT_FILE"
}

markdown_table_separator() {

    echo "$1" >> "$REPORT_FILE"
}

markdown_table_row() {

    echo "$1" >> "$REPORT_FILE"
}

###############################################################################
# Summary Writers
###############################################################################

report_summary() {

    local pass="$1"
    local warn="$2"
    local fail="$3"

    cat >> "$REPORT_FILE" <<EOF

===============================================================================
SUMMARY
===============================================================================

PASS : ${pass}
WARN : ${warn}
FAIL : ${fail}

EOF
}

###############################################################################
# Compliance Summary
###############################################################################

report_compliance_summary() {

    local compliant="$1"
    local warning="$2"
    local failed="$3"

    cat >> "$REPORT_FILE" <<EOF

===============================================================================
COMPLIANCE SUMMARY
===============================================================================

COMPLIANT : ${compliant}
WARNING   : ${warning}
FAILED    : ${failed}

EOF
}

###############################################################################
# Overall Status
###############################################################################

report_overall_status() {

    local status="$1"

    cat >> "$REPORT_FILE" <<EOF

===============================================================================
OVERALL STATUS
===============================================================================

${status}

EOF
}

###############################################################################
# Footer
###############################################################################

report_footer() {

    cat >> "$REPORT_FILE" <<EOF

-------------------------------------------------------------------------------
Generated By WoogleNet Automation Framework
Generated: $(report_timestamp)
-------------------------------------------------------------------------------

EOF
}

###############################################################################
# Report Archive Helper
###############################################################################

archive_report() {

    local report_file="$1"
    local archive_directory="$2"

    mkdir -p "$archive_directory"

    cp "$report_file" "$archive_directory/"
}

###############################################################################
# Certification Helper
###############################################################################

write_certification_header() {

    cat >> "$REPORT_FILE" <<EOF

Certification Scope

- Governance
- Operations
- Security
- Recovery
- Monitoring
- Compliance
- Automation

EOF
}

###############################################################################
# Service Reporting
###############################################################################

report_service_status() {

    local service="$1"
    local host="$2"
    local tier="$3"
    local status="$4"

    printf "%-25s %-10s %-8s %-10s\n" \
        "$service" \
        "$host" \
        "$tier" \
        "$status" \
        >> "$REPORT_FILE"
}

###############################################################################
# Capacity Reporting
###############################################################################

report_capacity() {

    local filesystem="$1"
    local size="$2"
    local used="$3"
    local available="$4"
    local percent="$5"

    printf "%-20s %-10s %-10s %-10s %-8s\n" \
        "$filesystem" \
        "$size" \
        "$used" \
        "$available" \
        "$percent" \
        >> "$REPORT_FILE"
}

###############################################################################
# End Of File
###############################################################################