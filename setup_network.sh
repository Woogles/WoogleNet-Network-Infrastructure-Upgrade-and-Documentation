#!/bin/bash

# WoogleNet Sprint 0: Ubuntu VM network provisioning.
# Review every value below before running; defaults are examples, not a live config.
set -Eeuo pipefail

INTERFACE="ens18"
STATIC_IP="10.0.2.10/24"
GATEWAY="10.0.2.1"
DNS_SERVERS="1.1.1.1" # Replace with AdGuard's stable address after Sprint 1.
HOSTNAME="wooglenet-server"

# Optional NFS export. Keep empty to skip NAS setup until TrueNAS is configured.
NAS_IP=""
NFS_EXPORT=""
NFS_MOUNT="/mnt/nas/data"

if [[ ${EUID} -ne 0 ]]; then
    echo "Run with sudo: sudo ./setup_network.sh" >&2
    exit 1
fi

if ! command -v netplan >/dev/null 2>&1; then
    echo "Netplan is not installed; this script expects Ubuntu Server." >&2
    exit 1
fi

if ! ip link show "$INTERFACE" >/dev/null 2>&1; then
    echo "Network interface '$INTERFACE' was not found. Set INTERFACE at the top of this script." >&2
    ip -br link >&2
    exit 1
fi

if [[ -n "$NAS_IP" && -z "$NFS_EXPORT" ]] || [[ -z "$NAS_IP" && -n "$NFS_EXPORT" ]]; then
  echo "Set both NAS_IP and NFS_EXPORT, or leave both empty." >&2
  exit 1
fi

echo "Configuring $HOSTNAME on $INTERFACE with $STATIC_IP. Verify the example address first."
hostnamectl set-hostname "$HOSTNAME"

cat > /etc/netplan/99-wooglenet.yaml <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    $INTERFACE:
      dhcp4: false
      addresses: [$STATIC_IP]
      nameservers:
        addresses: [$DNS_SERVERS]
      routes:
        - to: default
          via: $GATEWAY
EOF
chmod 600 /etc/netplan/99-wooglenet.yaml

# Netplan reverts the proposed config unless it is confirmed before timeout.
netplan try --timeout 120
netplan generate

if [[ -n "$NAS_IP" || -n "$NFS_EXPORT" ]]; then
    apt-get update
    apt-get install -y nfs-common
    mkdir -p "$NFS_MOUNT"
    if ! grep -Fq " $NFS_MOUNT nfs " /etc/fstab; then
        printf '%s:%s %s nfs _netdev,nofail,x-systemd.automount 0 0\n' \
            "$NAS_IP" "$NFS_EXPORT" "$NFS_MOUNT" >> /etc/fstab
    fi
    mount "$NFS_MOUNT"
fi

echo "Sprint 0 VM provisioning complete. Verify routing and mounts before continuing."




