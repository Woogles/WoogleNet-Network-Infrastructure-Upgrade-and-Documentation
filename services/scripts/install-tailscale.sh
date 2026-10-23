#!/usr/bin/env bash

set -Eeuo pipefail

if [[ ${EUID} -ne 0 ]]; then
    echo "Run with sudo: sudo bash scripts/install-tailscale.sh" >&2
    exit 1
fi

if [[ ! -r /etc/os-release ]] || ! . /etc/os-release || [[ "${ID:-}" != "ubuntu" ]]; then
    echo "This installer supports Ubuntu only." >&2
    exit 1
fi

if ! command -v tailscale >/dev/null 2>&1; then
    if ! command -v curl >/dev/null 2>&1; then
        apt-get update
        apt-get install -y ca-certificates curl
    fi
    curl -fsSL https://tailscale.com/install.sh | sh
fi

systemctl enable --now tailscaled
tailscale version
echo "Tailscale is installed. Authorize this host with: sudo tailscale up"