#!/usr/bin/env bash

###############################################################################
#
# WoogleNet Notification Library
#
# Purpose:
# Shared notification functions for monitoring,
# deployment, backup, recovery, validation,
# and certification automation.
#
# Version:
# 1.0
#
###############################################################################

###############################################################################
# Notification Configuration
###############################################################################

NOTIFICATION_ENABLED="${NOTIFICATION_ENABLED:-true}"

EMAIL_ENABLED="${EMAIL_NOTIFICATIONS_ENABLED:-false}"

MOBILE_ENABLED="${MOBILE_NOTIFICATIONS_ENABLED:-false}"

###############################################################################
# Message Formatting
###############################################################################

notification_timestamp() {
    date '+%Y-%m-%d %H:%M:%S'
}

build_message() {

    local severity="$1"
    local title="$2"
    local message="$3"

    cat <<EOF
[$severity]

$title

$message

Generated:
$(notification_timestamp)
EOF
}

###############################################################################
# Email Notification
###############################################################################

send_email() {

    local subject="$1"
    local message="$2"

    if [[ "$EMAIL_ENABLED" != "true" ]]; then
        return 0
    fi

    if command -v mail >/dev/null 2>&1; then

        echo "$message" | mail \
            -s "$subject" \
            "${NOTIFICATION_EMAIL:-admin@example.com}"

        return $?
    fi

    return 1
}

###############################################################################
# Webhook Notification
###############################################################################

send_webhook() {

    local url="$1"
    local message="$2"

    curl \
        --silent \
        --show-error \
        --fail \
        --header "Content-Type: application/json" \
        --data "{\"text\":\"${message}\"}" \
        "$url" \
        >/dev/null 2>&1
}

###############################################################################
# ntfy Support
###############################################################################

send_ntfy() {

    local topic="$1"
    local title="$2"
    local message="$3"

    curl \
        --silent \
        --show-error \
        --fail \
        -H "Title: ${title}" \
        -d "${message}" \
        "https://ntfy.sh/${topic}" \
        >/dev/null 2>&1
}

###############################################################################
# Discord Support
###############################################################################

send_discord() {

    local webhook_url="$1"
    local message="$2"

    curl \
        --silent \
        --show-error \
        --fail \
        -H "Content-Type: application/json" \
        -d "{\"content\":\"${message}\"}" \
        "$webhook_url" \
        >/dev/null 2>&1
}

###############################################################################
# Notification Levels
###############################################################################

notify_info() {

    local title="$1"
    local message="$2"

    local payload

    payload=$(build_message "INFO" "$title" "$message")

    send_email "$title" "$payload"
}

notify_warn() {

    local title="$1"
    local message="$2"

    local payload

    payload=$(build_message "WARN" "$title" "$message")

    send_email "$title" "$payload"
}

notify_fail() {

    local title="$1"
    local message="$2"

    local payload

    payload=$(build_message "FAIL" "$title" "$message")

    send_email "$title" "$payload"
}

notify_critical() {

    local title="$1"
    local message="$2"

    local payload

    payload=$(build_message "CRITICAL" "$title" "$message")

    send_email "$title" "$payload"

    if [[ -n "${NTFY_TOPIC:-}" ]]; then
        send_ntfy \
            "$NTFY_TOPIC" \
            "$title" \
            "$message"
    fi
}

###############################################################################
# Validation Notifications
###############################################################################

notify_validation_failure() {

    local component="$1"

    notify_fail \
        "Validation Failure" \
        "${component} validation failed"
}

###############################################################################
# Backup Notifications
###############################################################################

notify_backup_failure() {

    local component="$1"

    notify_critical \
        "Backup Failure" \
        "${component} backup validation failed"
}

###############################################################################
# Recovery Notifications
###############################################################################

notify_recovery_failure() {

    local component="$1"

    notify_critical \
        "Recovery Failure" \
        "${component} recovery validation failed"
}

###############################################################################
# Deployment Notifications
###############################################################################

notify_deployment_success() {

    local service="$1"

    notify_info \
        "Deployment Successful" \
        "${service} deployment completed successfully"
}

notify_deployment_failure() {

    local service="$1"

    notify_critical \
        "Deployment Failure" \
        "${service} deployment failed"
}

###############################################################################
# End Of File
###############################################################################