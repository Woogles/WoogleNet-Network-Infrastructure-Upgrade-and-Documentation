#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Configuration Library
#
# Purpose:
# Load and validate WoogleNet automation configuration.
#
# Used By:
#
# - validation scripts
# - deployment scripts
# - reporting scripts
# - backup scripts
# - recovery scripts
# - certification scripts
#
# Dependencies:
#
# automation/config/
#   environment.conf
#   hosts.conf
#   services.conf
#   backup.conf
#   monitoring.conf
#
# Version:
# 1.0
#
###############################################################################

###############################################################################
# Library Location
###############################################################################

LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

AUTOMATION_DIR="$(dirname "$LIB_DIR")"

CONFIG_DIR="${AUTOMATION_DIR}/config"

###############################################################################
# Configuration Files
###############################################################################

ENVIRONMENT_CONF="${CONFIG_DIR}/environment.conf"

HOSTS_CONF="${CONFIG_DIR}/hosts.conf"

SERVICES_CONF="${CONFIG_DIR}/services.conf"

BACKUP_CONF="${CONFIG_DIR}/backup.conf"

MONITORING_CONF="${CONFIG_DIR}/monitoring.conf"

###############################################################################
# Internal Configuration Loader
###############################################################################

_load_file() {

    local config_file="$1"

    if [[ ! -f "$config_file" ]]; then
        echo "[ERROR] Missing configuration file:"
        echo "        ${config_file}"
        return 1
    fi

    # shellcheck source=/dev/null
    source "$config_file"

    return 0
}

###############################################################################
# Load All Configuration
###############################################################################

load_config() {

    _load_file "$ENVIRONMENT_CONF" || return 1
    _load_file "$HOSTS_CONF" || return 1
    _load_file "$SERVICES_CONF" || return 1
    _load_file "$BACKUP_CONF" || return 1
    _load_file "$MONITORING_CONF" || return 1

    export CONFIG_LOADED="true"

    return 0
}

###############################################################################
# Validate Configuration Files
###############################################################################

validate_config() {

    local failed=0

    [[ -f "$ENVIRONMENT_CONF" ]] || {
        echo "[ERROR] Missing environment.conf"
        failed=1
    }

    [[ -f "$HOSTS_CONF" ]] || {
        echo "[ERROR] Missing hosts.conf"
        failed=1
    }

    [[ -f "$SERVICES_CONF" ]] || {
        echo "[ERROR] Missing services.conf"
        failed=1
    }

    [[ -f "$BACKUP_CONF" ]] || {
        echo "[ERROR] Missing backup.conf"
        failed=1
    }

    [[ -f "$MONITORING_CONF" ]] || {
        echo "[ERROR] Missing monitoring.conf"
        failed=1
    }

    return "$failed"
}

###############################################################################
# Validate Required Variables
###############################################################################

require_variable() {

    local variable_name="$1"

    if [[ -z "${!variable_name:-}" ]]; then
        echo "[ERROR] Required variable missing: ${variable_name}"
        return 1
    fi

    return 0
}

###############################################################################
# Environment Validation
###############################################################################

validate_environment() {

    require_variable WOOGLENET_ROOT || return 1
    require_variable SERVICES_DIR || return 1
    require_variable REPORT_DIR || return 1
    require_variable LOG_DIR || return 1

    return 0
}

###############################################################################
# Configuration Summary
###############################################################################

show_config_summary() {

    cat <<EOF

==================================================
WoogleNet Configuration Summary
==================================================

Environment : ${ENVIRONMENT_NAME:-UNKNOWN}
Type        : ${ENVIRONMENT_TYPE:-UNKNOWN}
Owner       : ${ENVIRONMENT_OWNER:-UNKNOWN}

Root Path   : ${WOOGLENET_ROOT:-UNKNOWN}

Services    : ${SERVICES_DIR:-UNKNOWN}
Reports     : ${REPORT_DIR:-UNKNOWN}
Logs        : ${LOG_DIR:-UNKNOWN}

Primary DNS : ${PRIMARY_DNS:-UNKNOWN}
Secondary   : ${SECONDARY_DNS:-UNKNOWN}

==================================================

EOF
}

###############################################################################
# Service Helpers
###############################################################################

service_exists() {

    local service_name="$1"

    [[ -d "${SERVICES_DIR}/${service_name}" ]]
}

get_service_directory() {

    local service_name="$1"

    echo "${SERVICES_DIR}/${service_name}"
}

get_service_compose_file() {

    local service_name="$1"

    echo "${SERVICES_DIR}/${service_name}/compose.yml"
}

###############################################################################
# End Of File
###############################################################################