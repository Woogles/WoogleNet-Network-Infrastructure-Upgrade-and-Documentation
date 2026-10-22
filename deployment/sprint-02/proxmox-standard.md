# Proxmox Standard

## Purpose

This document defines the standard configuration for all Proxmox hosts within the WoogleNet environment.

The goals of this standard are to:

- Ensure consistency across hosts
- Reduce configuration drift
- Improve recoverability
- Improve security
- Simplify troubleshooting
- Support predictable deployments

All Proxmox hosts must conform to this standard unless an exception is documented in:

```text
SERVICE-DECISIONS.md
```

---

# Managed Hosts

## DAX

Purpose:

```text
Infrastructure Host
```

Management Address:

```text
10.0.10.30
```

---

## MAX

Purpose:

```text
Infrastructure Host
```

Management Address:

```text
10.0.10.31
```

---

## PAX

Purpose:

```text
Storage Host
```

Management Address:

```text
10.0.10.32
```

---

# Operating System

## Platform

```text
Proxmox VE
```

Current Version:

```text
Latest Stable Release
```

at deployment time.

---

## Installation Method

```text
Clean Install
```

No upgrades from previous versions.

---

# Host Naming Standard

## Required Format

```text
lowercase
single word
```

---

### Hostnames

| System | Hostname |
|----------|----------|
| DAX | dax |
| MAX | max |
| PAX | pax |

---

# Networking Standard

## Management VLAN

```text
VLAN 10
Infrastructure
```

---

## Management Bridge

```text
vmbr0
```

---

## Gateway

```text
10.0.10.1
```

---

## DNS

Primary:

```text
10.0.10.50
```

AdGuard Primary

---

Secondary:

```text
10.0.10.51
```

AdGuard Secondary

---

## Time Synchronization

Required:

```text
NTP Enabled
```

All hosts must maintain synchronized time.

---

# Storage Standard

## Local Storage

Purpose:

```text
Operating System

ISOs

Templates

Temporary Storage
```

---

## Shared Storage

Provided By:

```text
OpenMediaVault
```

after Sprint 04.

---

## Storage Naming

Recommended:

```text
local
local-lvm
omv-storage
```

---

# Security Standard

## Root Account

### Web Interface

```text
Allowed
```

during initial deployment.

---

### SSH

```text
Disabled
```

for direct root login.

---

## Administrative Accounts

Create:

```text
Named Administrative Account
```

Example:

```text
eric-admin
```

---

## Passwords

Minimum Length:

```text
16 Characters
```

---

## Password Storage

Store In:

```text
Vaultwarden
```

after Sprint 06.

Until then:

```text
Temporary Secure Storage
```

---

# Update Standard

## Initial Deployment

Immediately After Installation:

```text
apt update

apt full-upgrade
```

---

## Validation

Verify:

- Kernel Version
- Proxmox Version
- Package Status

---

# Repository Standard

## Subscription Repository

If No Subscription Exists:

Disable:

```text
Enterprise Repository
```

---

Enable:

```text
No-Subscription Repository
```

---

## Validation

Verify:

```text
Updates Available
```

without errors.

---

# SSH Standard

## Service

```text
Enabled
```

---

## Root Login

```text
Disabled
```

---

## Password Authentication

Initially:

```text
Allowed
```

---

Future Review:

```text
SSH Keys Preferred
```

---

# Tailscale Standard

## Installation Required

Install On:

- DAX
- MAX
- PAX

---

## Validation

Verify:

- Tailnet Membership
- Remote Connectivity
- Administrative Access

---

# VM Standard

## VM Naming

Format:

```text
service-name
```

Examples:

```text
omv
homeassistant
```

---

## Description Field

Every VM must contain:

```text
Purpose
Owner
Documentation Reference
```

---

# LXC Standard

## Container Naming

Format:

```text
service-name
```

Examples:

```text
adguard-primary
homepage
uptime-kuma
```

---

## Privilege Mode

Default:

```text
Unprivileged
```

---

## Privileged Containers

Only when technically required.

---

# Backup Standard

## Host Configuration

Export:

- Before Major Changes
- After Major Changes

---

## Export Location

```text
deployment/sprint-02/exports/
```

---

# Monitoring Standard

Beginning Sprint 03:

Monitor:

- Host Availability
- CPU Usage
- RAM Usage
- Disk Usage
- Storage Availability

---

# Documentation Standard

Every Host Must Have:

- Hardware Inventory
- IP Address
- Purpose
- Installed Services
- Backup Status

---

# Validation Checklist

## DAX

- [ ] Installed
- [ ] Updated
- [ ] DNS Functional
- [ ] Tailscale Functional

---

## MAX

- [ ] Installed
- [ ] Updated
- [ ] DNS Functional
- [ ] Tailscale Functional

---

## PAX

- [ ] Installed
- [ ] Updated
- [ ] DNS Functional
- [ ] Tailscale Functional

---

# Configuration Drift Prevention

Any deviation from this standard must be documented in:

```text
SERVICE-DECISIONS.md
```

and included in:

```text
deployment/sprint-02/evidence/
```

---

# Future Standards

To Be Added:

- Cluster Standards (if ever adopted)
- GPU Standards
- VM Backup Standards
- Host Metrics Standards

---

# Related Documents

- dax-build-sheet.md
- max-build-sheet.md
- pax-build-sheet.md
- validation-checklist.md
- HARDWARE-INVENTORY.md
- SECURITY-BASELINE.md
- REMOTE-ACCESS.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Proxmox Host Standard |