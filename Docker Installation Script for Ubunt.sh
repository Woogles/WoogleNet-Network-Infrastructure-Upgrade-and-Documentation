#!/usr/bin/env bash

# Install Docker Engine and Compose on Ubuntu. Run with sudo from a login account.
set -Eeuo pipefail

if [[ ${EUID} -ne 0 ]]; then
  echo "Run this script with sudo from your normal login account." >&2
  exit 1
fi

if [[ -z "${SUDO_USER:-}" || "$SUDO_USER" == "root" ]] || ! id "$SUDO_USER" >/dev/null 2>&1; then
  echo "Could not identify the invoking login user. Do not run this script from a root shell." >&2
  exit 1
fi

if [[ ! -r /etc/os-release ]] || ! . /etc/os-release || [[ "${ID:-}" != "ubuntu" ]]; then
  echo "This installer supports Ubuntu only." >&2
  exit 1
fi

echo "Installing Docker for Ubuntu ${VERSION_CODENAME:-unknown}..."
apt-get update
apt-get install -y ca-certificates curl gnupg

install -m 0755 -d /etc/apt/keyrings
key_tmp=$(mktemp)
trap 'rm -f "$key_tmp"' EXIT
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor --yes --output "$key_tmp"
install -m 0644 "$key_tmp" /etc/apt/keyrings/docker.gpg

architecture=$(dpkg --print-architecture)
codename=${VERSION_CODENAME:?Ubuntu release codename is unavailable}
printf 'deb [arch=%s signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu %s stable\n' \
  "$architecture" "$codename" > /etc/apt/sources.list.d/docker.list
chmod 0644 /etc/apt/sources.list.d/docker.list

apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable --now docker
usermod -aG docker "$SUDO_USER"

echo "Docker installation complete. Log out and back in before using Docker as $SUDO_USER."
docker --version
docker compose version