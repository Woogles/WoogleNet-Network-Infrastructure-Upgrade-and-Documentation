#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Docker Library
#
# Purpose:
# Shared Docker and Docker Compose functions used throughout
# the WoogleNet automation framework.
#
# Used By:
#
# - deploy-service.sh
# - update-service.sh
# - rollback-service.sh
# - validate-services.sh
# - validate-recovery.sh
#
# Dependencies:
#
# - logging.sh
# - config.sh
# - common.sh
#
# Version:
# 1.0
#
###############################################################################

###############################################################################
# Service Location Helpers
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
# Validation Functions
###############################################################################

validate_service_exists() {

    local service="$1"

    [[ -d "$(service_directory "$service")" ]]
}

validate_compose_exists() {

    local service="$1"

    [[ -f "$(compose_file "$service")" ]]
}

validate_env_exists() {

    local service="$1"

    [[ -f "$(env_file "$service")" ]]
}

validate_service_structure() {

    local service="$1"

    validate_service_exists "$service" &&
    validate_compose_exists "$service" &&
    validate_env_exists "$service"
}

###############################################################################
# Docker Environment
###############################################################################

docker_available() {

    docker version >/dev/null 2>&1
}

compose_available() {

    docker compose version >/dev/null 2>&1
}

docker_running() {

    docker info >/dev/null 2>&1
}

###############################################################################
# Compose Validation
###############################################################################

validate_compose() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        config \
        >/dev/null 2>&1
}

###############################################################################
# Image Management
###############################################################################

pull_images() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        pull
}

###############################################################################
# Deployment Functions
###############################################################################

deploy_stack() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        up -d
}

update_stack() {

    local service="$1"

    pull_images "$service"

    docker compose \
        -f "$(compose_file "$service")" \
        up -d
}

restart_stack() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        restart
}

stop_stack() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        stop
}

remove_stack() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        down
}

###############################################################################
# Container Status
###############################################################################

stack_running() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        ps \
        --status running \
        2>/dev/null \
        | grep -q .
}

stack_healthy() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        ps \
        >/dev/null 2>&1
}

###############################################################################
# Configuration Backup
###############################################################################

backup_service_configuration() {

    local service="$1"

    local service_dir
    local backup_dir
    local timestamp

    timestamp=$(date '+%Y%m%d-%H%M%S')

    service_dir=$(service_directory "$service")

    backup_dir="${BACKUPS_DIR:-./backups}/configuration/${service}"

    mkdir -p "$backup_dir"

    cp \
        -r \
        "$service_dir" \
        "${backup_dir}/${timestamp}"
}

###############################################################################
# Rollback Support
###############################################################################

latest_backup() {

    local service="$1"

    local backup_dir

    backup_dir="${BACKUPS_DIR:-./backups}/configuration/${service}"

    ls -1dt "${backup_dir}"/* 2>/dev/null | head -1
}

rollback_configuration() {

    local service="$1"

    local source_backup
    local service_dir

    source_backup=$(latest_backup "$service")

    service_dir=$(service_directory "$service")

    [[ -z "$source_backup" ]] && return 1

    rm -rf "${service_dir}"

    cp \
        -r \
        "${source_backup}" \
        "${service_dir}"

    return 0
}

###############################################################################
# Logs
###############################################################################

stack_logs() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        logs --tail 100
}

###############################################################################
# Cleanup
###############################################################################

remove_unused_images() {

    docker image prune -f
}

remove_unused_volumes() {

    docker volume prune -f
}

remove_unused_networks() {

    docker network prune -f
}

###############################################################################
# Information
###############################################################################

stack_status() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        ps
}

stack_images() {

    local service="$1"

    docker compose \
        -f "$(compose_file "$service")" \
        images
}

###############################################################################
# End Of File
###############################################################################