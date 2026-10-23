#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Common Library
#
# Purpose:
# Shared utility functions used throughout the WoogleNet
# automation framework.
#
# Used By:
#
# - validation scripts
# - deployment scripts
# - backup scripts
# - recovery scripts
# - reporting scripts
# - certification scripts
#
# Version:
# 1.0
#
###############################################################################

###############################################################################
# Command Validation
###############################################################################

command_exists() {

    local command_name="$1"

    command -v "${command_name}" >/dev/null 2>&1
}

require_command() {

    local command_name="$1"

    if ! command_exists "${command_name}"; then
        echo "[ERROR] Required command missing: ${command_name}"
        return 1
    fi

    return 0
}

###############################################################################
# File Validation
###############################################################################

file_exists() {

    local file_path="$1"

    [[ -f "${file_path}" ]]
}

require_file() {

    local file_path="$1"

    if ! file_exists "${file_path}"; then
        echo "[ERROR] Required file missing: ${file_path}"
        return 1
    fi

    return 0
}

###############################################################################
# Directory Validation
###############################################################################

directory_exists() {

    local directory_path="$1"

    [[ -d "${directory_path}" ]]
}

require_directory() {

    local directory_path="$1"

    if ! directory_exists "${directory_path}"; then
        echo "[ERROR] Required directory missing: ${directory_path}"
        return 1
    fi

    return 0
}

ensure_directory() {

    local directory_path="$1"

    mkdir -p "${directory_path}"
}

###############################################################################
# User Validation
###############################################################################

is_root() {

    [[ "${EUID}" -eq 0 ]]
}

require_root() {

    if ! is_root; then
        echo "[ERROR] Root privileges required"
        return 1
    fi

    return 0
}

###############################################################################
# Network Validation
###############################################################################

is_online() {

    ping -c 1 -W 2 8.8.8.8 >/dev/null 2>&1
}

host_reachable() {

    local target="$1"

    ping -c 1 -W 2 "${target}" >/dev/null 2>&1
}

check_port() {

    local host="$1"
    local port="$2"

    timeout 5 bash -c \
        "</dev/tcp/${host}/${port}" \
        >/dev/null 2>&1
}

###############################################################################
# HTTP Validation
###############################################################################

http_available() {

    local url="$1"

    curl \
        --silent \
        --fail \
        --max-time 10 \
        "${url}" \
        >/dev/null 2>&1
}

http_status() {

    local url="$1"

    curl \
        --silent \
        --location \
        --max-time 10 \
        --output /dev/null \
        --write-out "%{http_code}" \
        "${url}"
}

###############################################################################
# Docker Helpers
###############################################################################

docker_available() {

    command_exists docker
}

docker_running() {

    docker info >/dev/null 2>&1
}

compose_available() {

    docker compose version >/dev/null 2>&1
}

###############################################################################
# Time Functions
###############################################################################

current_timestamp() {

    date '+%Y-%m-%d %H:%M:%S'
}

current_datestamp() {

    date '+%Y-%m-%d'
}

current_epoch() {

    date +%s
}

###############################################################################
# Backup Helpers
###############################################################################

backup_file() {

    local source_file="$1"

    local backup_directory="$2"

    ensure_directory "${backup_directory}"

    cp \
        "${source_file}" \
        "${backup_directory}/$(basename "${source_file}").$(date +%Y%m%d-%H%M%S)"
}

###############################################################################
# Compose Helpers
###############################################################################

compose_file_exists() {

    local service_directory="$1"

    [[ -f "${service_directory}/compose.yml" ]]
}

env_file_exists() {

    local service_directory="$1"

    [[ -f "${service_directory}/.env" ]]
}

readme_exists() {

    local service_directory="$1"

    [[ -f "${service_directory}/README.md" ]]
}

###############################################################################
# String Helpers
###############################################################################

to_lower() {

    echo "$1" | tr '[:upper:]' '[:lower:]'
}

to_upper() {

    echo "$1" | tr '[:lower:]' '[:upper:]'
}

###############################################################################
# Service Helpers
###############################################################################

service_directory() {

    local service="$1"

    echo "${SERVICES_DIR}/${service}"
}

compose_file() {

    local service="$1"

    echo "${SERVICES_DIR}/${service}/compose.yml"
}

env_file() {

    local service="$1"

    echo "${SERVICES_DIR}/${service}/.env"
}

###############################################################################
# Safety Controls
###############################################################################

confirm_action() {

    local prompt="$1"

    read -r -p "${prompt} [y/N]: " response

    [[ "${response}" =~ ^[Yy]$ ]]
}

###############################################################################
# End Of File
###############################################################################