# Tailscale Deployment

## Purpose

Deploy Tailscale to all infrastructure hosts to provide secure remote administration and service access.

Reference Documents:

- REMOTE-ACCESS.md
- SECURITY-BASELINE.md
- SERVICE-DEPENDENCIES.md

---

# Scope

This deployment applies to:

- DAX
- MAX
- PAX
- JAX

---

# Design Objectives

Tailscale provides:

- Secure Remote Access
- Administrative Access
- Infrastructure Management
- Service Access
- Recovery Access

Tailscale is the approved remote access platform for WoogleNet.

---

# Authentication Requirements

Required:

- MFA Enabled
- Approved Tailscale Account
- Administrator Approval

Reference:

SECURITY-BASELINE.md

---

# Installation

## Debian / Ubuntu

Install:

curl -fsSL https://tailscale.com/install.sh | sh

---

## Start Service

systemctl enable tailscaled

systemctl start tailscaled

---

## Join Tailnet

tailscale up

Authenticate using approved administrator account.

---

# Host Configuration

## DAX

Role:

Infrastructure Host

Required Access:

- Proxmox
- AdGuard Primary
- Homepage
- Uptime Kuma

---

## MAX

Role:

Infrastructure Host

Required Access:

- Proxmox
- AdGuard Secondary
- Home Assistant

---

## PAX

Role:

Storage Host

Required Access:

- Proxmox
- OpenMediaVault

---

## JAX

Role:

Application Host

Required Access:

- Plex
- Immich
- Vaultwarden
- ARR Stack
- Knowledge Platform

---

# Device Naming Standard

Format:

hostname

Examples:

dax
max
pax
jax

Avoid:

random Tailscale-generated names

---

# Access Policy

Administrative Access Allowed From:

- Trusted VLAN
- Tailscale

Administrative Access Denied From:

- Guest VLAN
- Internet

---

# Validation

Verify:

- Host joins Tailnet
- Host visible in Tailscale console
- Host reachable from administrator device
- DNS resolution functional
- SSH connectivity functional
- Web interfaces reachable

---

# Monitoring

Monitor:

- Tailscale Service
- Host Reachability
- Node Presence

Alert Level:

Critical

---

# Recovery Procedure

If node disconnects:

1. Verify Internet connectivity
2. Verify DNS resolution
3. Verify tailscaled service
4. Re-authenticate node if required
5. Validate host visibility

---

# Success Criteria

Deployment is complete when:

- DAX connected
- MAX connected
- PAX connected
- JAX connected
- MFA enabled
- Remote administration validated
- Documentation updated