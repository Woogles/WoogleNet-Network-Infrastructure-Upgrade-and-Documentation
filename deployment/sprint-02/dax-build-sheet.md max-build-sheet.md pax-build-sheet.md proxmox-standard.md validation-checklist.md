# DAX Build Sheet

## Purpose

This document provides the detailed build procedure for DAX.

DAX is the primary infrastructure host in the WoogleNet environment and will host:

- AdGuard Primary
- Homepage
- Uptime Kuma

DAX is the first Proxmox host deployed and serves as the foundation for Sprint 03.

---

# System Information

## Host Summary

| Property | Value |
|----------|----------|
| Hostname | dax |
| Role | Infrastructure Host |
| Platform | Proxmox VE |
| Management IP | 10.0.10.30 |
| VLAN | 10 Infrastructure |
| Gateway | 10.0.10.1 |

---

## Planned Services

### Sprint 03

| Service | Type |
|----------|----------|
| AdGuard Primary | LXC |
| Homepage | LXC |
| Uptime Kuma | LXC |

---

## Future Services

Additional infrastructure services may be deployed as required.

---

# Pre-Build Validation

## Hardware

Verify:

- [ ] CPU Confirmed
- [ ] RAM Confirmed
- [ ] Disk Configuration Confirmed
- [ ] RAID Status Healthy
- [ ] NICs Verified

---

## Firmware

Verify:

- [ ] BIOS Current
- [ ] RAID Firmware Current
- [ ] NIC Firmware Current

---

## Documentation

Verify:

- [ ] Sprint 00 Complete
- [ ] Hardware Inventory Updated

---

# Installation

## Installation Media

Version:

```text
Proxmox VE
Latest Stable Release
```

---

## Install Method

```text
Clean Install
```

---

## Installation Tasks

- [ ] Boot Installation Media
- [ ] Install Proxmox
- [ ] Configure Root Password
- [ ] Configure Network Interface
- [ ] Reboot Successfully

---

# Host Configuration

## Hostname

```text
dax
```

---

## Management Address

```text
10.0.10.30/24
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

## Time Zone

```text
America/New_York
```

---

# Initial Network Validation

## Verify

- [ ] Ping Gateway
- [ ] Ping Public IP
- [ ] DNS Resolution Working

---

### Test Commands

```bash
ping 10.0.10.1
```

```bash
ping 1.1.1.1
```

```bash
nslookup google.com
```

---

# Repository Configuration

## Enterprise Repository

If No Subscription:

```text
Disable
```

---

## Community Repository

Enable:

```text
pve-no-subscription
```

---

## Validation

Run:

```bash
apt update
```

Expected:

```text
No Repository Errors
```

---

# System Updates

## Update Sequence

```bash
apt update
apt full-upgrade -y
```

---

## Validation

Verify:

- [ ] Packages Updated
- [ ] Reboot Successful
- [ ] Host Operational

---

# SSH Hardening

## Enable SSH

Verify:

```text
SSH Running
```

---

## Root Login

Set:

```text
PermitRootLogin no
```

---

## Administrative Account

Create:

```text
eric-admin
```

---

## Validation

- [ ] SSH Operational
- [ ] Root Login Disabled
- [ ] Administrative Login Successful

---

# Tailscale Deployment

## Installation

Execute:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
```

---

## Enrollment

- [ ] Join Tailnet
- [ ] Authenticate Device

---

## Validation

Verify:

- [ ] Appears In Tailnet
- [ ] Reachable Remotely

---

# Storage Validation

## Local Storage

Verify:

- [ ] local Present
- [ ] local-lvm Present

---

## Capacity

Record:

### Local

```text
________________
```

---

### Local-LVM

```text
________________
```

---

# Proxmox Standard Compliance

Verify:

- [ ] Hostname Correct
- [ ] Networking Correct
- [ ] DNS Correct
- [ ] Time Sync Active
- [ ] SSH Hardened
- [ ] Tailscale Active

Reference:

```text
proxmox-standard.md
```

---

# Sprint 03 Preparation

## Containers To Create

### AdGuard Primary

Hostname:

```text
adguard-primary
```

IP:

```text
10.0.10.50
```

---

### Homepage

Hostname:

```text
homepage
```

IP:

```text
10.0.10.60
```

---

### Uptime Kuma

Hostname:

```text
uptime-kuma
```

IP:

```text
10.0.10.61
```

---

# Configuration Exports

Export:

- [ ] Host Configuration
- [ ] Network Configuration
- [ ] Installed Version Information

---

## Storage Location

```text
deployment/sprint-02/exports/dax/
```

---

# Evidence Collection

Capture:

- [ ] Installation Screenshots
- [ ] Network Settings
- [ ] Repository Settings
- [ ] Update Status
- [ ] SSH Configuration
- [ ] Tailscale Enrollment

---

## Storage Location

```text
deployment/sprint-02/evidence/dax/
```

---

# Validation Checklist

## Network

- [ ] Gateway Reachable
- [ ] DNS Functional
- [ ] Internet Reachable

---

## Administration

- [ ] Web UI Operational
- [ ] SSH Operational
- [ ] Tailscale Operational

---

## Storage

- [ ] Local Available
- [ ] Local-LVM Available

---

# Build Completion

## Completed By

```text
_____________________
```

---

## Date

```text
_____________________
```

---

## Result

```text
PASS / FAIL
```

---

# Exit Criteria

DAX Build Complete When:

- [ ] Proxmox Installed
- [ ] Updated
- [ ] Network Operational
- [ ] DNS Operational
- [ ] SSH Hardened
- [ ] Tailscale Operational
- [ ] Exports Collected
- [ ] Evidence Collected

---

# Related Documents

- deployment/sprint-02/README.md
- deployment/sprint-02/proxmox-standard.md
- deployment/sprint-02/validation-checklist.md
- HARDWARE-INVENTORY.md
- CORE-INFRASTRUCTURE.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial DAX Build Sheet |