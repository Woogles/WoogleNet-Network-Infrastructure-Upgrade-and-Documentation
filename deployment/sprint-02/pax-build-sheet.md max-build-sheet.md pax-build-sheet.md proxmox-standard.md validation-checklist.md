# PAX Build Sheet

## Purpose

This document provides the detailed build procedure for PAX.

PAX is the dedicated storage host in the WoogleNet environment and serves as the foundation for centralized storage.

PAX will host:

- OpenMediaVault (Sprint 04)
- Backup Repository Storage
- Shared Service Storage
- Media Storage
- Document Storage

PAX is considered one of the most critical systems in the environment because many future services depend on its storage platform.

---

# System Information

## Host Summary

| Property | Value |
|----------|----------|
| Hostname | pax |
| Role | Storage Host |
| Platform | Proxmox VE |
| Management IP | 10.0.10.32 |
| VLAN | 10 Infrastructure |
| Gateway | 10.0.10.1 |

---

## Planned Services

### Sprint 04

| Service | Type |
|----------|----------|
| OpenMediaVault | VM |

---

## Future Responsibilities

### Storage

- Shared Storage
- Application Data
- Backup Storage
- Media Storage
- Document Storage

### Backup

- Kopia Repository
- Configuration Archives
- VM Backups
- LXC Backups

---

# Pre-Build Validation

## Hardware

Verify:

- [ ] CPU Confirmed
- [ ] RAM Confirmed
- [ ] Disk Inventory Confirmed
- [ ] RAID Configuration Confirmed
- [ ] NICs Verified

---

## RAID Controller

Verify:

- [ ] PERC H700 Installed
- [ ] Controller Functional
- [ ] Cache Battery Healthy
- [ ] No Storage Errors

---

## Drive Validation

Record:

| Slot | Model | Capacity | Type |
|--------|--------|--------|--------|
| | | | |
| | | | |
| | | | |
| | | | |

---

## Documentation

Verify:

- [ ] Sprint 00 Complete
- [ ] Hardware Inventory Updated
- [ ] Disk Inventory Verified

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
- [ ] Install Proxmox VE
- [ ] Configure Root Password
- [ ] Configure Networking
- [ ] Reboot Successfully

---

# Host Configuration

## Hostname

```text
pax
```

---

## Management Address

```text
10.0.10.32/24
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

---

Secondary:

```text
10.0.10.51
```

---

## Time Zone

```text
America/New_York
```

---

# Initial Network Validation

Verify:

- [ ] Gateway Reachable
- [ ] Internet Reachable
- [ ] DNS Functional

---

## Test Commands

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

If no subscription exists:

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

```bash
apt update
```

Expected:

```text
No Repository Errors
```

---

# System Updates

## Update Procedure

```bash
apt update
apt full-upgrade -y
```

---

## Validation

Verify:

- [ ] Updates Installed
- [ ] Reboot Successful
- [ ] No Package Errors

---

# SSH Hardening

## SSH Service

Verify:

```text
Running
```

---

## Disable Root Login

Configure:

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

- [ ] SSH Functional
- [ ] Root Login Disabled
- [ ] Administrative Login Functional

---

# Tailscale Deployment

## Installation

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

- [ ] Tailnet Membership
- [ ] Remote Connectivity
- [ ] Administrative Connectivity

---

# Storage Validation

## RAID Status

Verify:

- [ ] Healthy
- [ ] No Degraded Arrays
- [ ] No Failed Disks

---

## Controller Status

Verify:

- [ ] PERC H700 Healthy
- [ ] Battery Healthy
- [ ] Cache Active

---

## Capacity Recording

### Raw Capacity

```text
_____________________
```

---

### Usable Capacity

```text
_____________________
```

---

### RAID Level

```text
_____________________
```

---

# Proxmox Standard Compliance

Verify:

- [ ] Hostname Correct
- [ ] Networking Correct
- [ ] DNS Correct
- [ ] NTP Active
- [ ] SSH Hardened
- [ ] Tailscale Active

Reference:

```text
deployment/sprint-02/proxmox-standard.md
```

---

# Sprint 04 Preparation

## Planned VM

### OpenMediaVault

Hostname:

```text
omv
```

Purpose:

```text
Centralized Storage Platform
```

---

## Resource Planning

Record Planned Allocation:

### vCPU

```text
________
```

---

### Memory

```text
________
```

---

### Storage

```text
________
```

---

# Backup Repository Preparation

## Planned Location

```text
/storage/backups
```

---

## Verify Capacity

The platform must support:

- VM Backups
- LXC Backups
- Service Backups
- Offsite Synchronization

---

## Capacity Validation

Verify sufficient space exists for:

- [ ] Backups
- [ ] Media
- [ ] Documents
- [ ] Photos
- [ ] Future Growth

---

# Configuration Exports

Export:

- [ ] Host Configuration
- [ ] Network Configuration
- [ ] RAID Configuration
- [ ] Version Information

---

## Storage Location

```text
deployment/sprint-02/exports/pax/
```

---

# Evidence Collection

Capture:

- [ ] Installation Screenshots
- [ ] Networking Settings
- [ ] RAID Screenshots
- [ ] Controller Information
- [ ] Storage Summary
- [ ] Tailscale Enrollment

---

## Storage Location

```text
deployment/sprint-02/evidence/pax/
```

---

# Validation Checklist

## Network

- [ ] Gateway Reachable
- [ ] DNS Functional
- [ ] Internet Functional

---

## Administration

- [ ] Web UI Functional
- [ ] SSH Functional
- [ ] Tailscale Functional

---

## Storage

- [ ] RAID Healthy
- [ ] Storage Capacity Verified
- [ ] No Disk Errors

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

PAX Build Complete When:

- [ ] Proxmox Installed
- [ ] Updated
- [ ] Network Operational
- [ ] DNS Operational
- [ ] SSH Hardened
- [ ] Tailscale Operational
- [ ] RAID Healthy
- [ ] Storage Verified
- [ ] Exports Collected
- [ ] Evidence Collected

---

# Special Notes

PAX is considered a Tier-1 Critical System.

Failure of PAX may impact:

- Immich
- Vaultwarden
- Paperless
- Nextcloud
- BookStack
- Plex
- Audiobookshelf
- ARR Stack
- Backup Platform

Special care should be taken with:

- Storage Changes
- RAID Modifications
- OpenMediaVault Upgrades

---

# Related Documents

- deployment/sprint-02/README.md
- deployment/sprint-02/proxmox-standard.md
- deployment/sprint-04/README.md
- STORAGE-ARCHITECTURE.md
- STORAGE-MAP.md
- BACKUP-AND-RESTORE.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial PAX Build Sheet |