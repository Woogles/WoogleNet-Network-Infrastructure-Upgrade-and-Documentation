# MAX Build Sheet

## Purpose

This document provides the detailed build procedure for MAX.

MAX is the secondary infrastructure host in the WoogleNet environment and provides service redundancy and home automation services.

MAX will host:

- AdGuard Secondary
- Home Assistant

MAX serves as the recovery counterpart to DAX and provides DNS redundancy for the entire environment.

---

# System Information

## Host Summary

| Property | Value |
|----------|----------|
| Hostname | max |
| Role | Infrastructure Host |
| Platform | Proxmox VE |
| Management IP | 10.0.10.31 |
| VLAN | 10 Infrastructure |
| Gateway | 10.0.10.1 |

---

## Planned Services

### Sprint 03

| Service | Type |
|----------|----------|
| AdGuard Secondary | LXC |

---

### Sprint 06

| Service | Type |
|----------|----------|
| Home Assistant | VM |

---

## Design Role

MAX provides:

- Infrastructure redundancy
- DNS redundancy
- Home automation platform
- Recovery capability during DAX outages

---

# Pre-Build Validation

## Hardware

Verify:

- [ ] CPU Confirmed
- [ ] RAM Confirmed
- [ ] Storage Confirmed
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

- [ ] Sprint 00 Completed
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
- [ ] Install Proxmox VE
- [ ] Configure Root Password
- [ ] Configure Networking
- [ ] Reboot Successfully

---

# Host Configuration

## Hostname

```text
max
```

---

## Management Address

```text
10.0.10.31/24
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

- [ ] Ping Gateway
- [ ] Ping Internet
- [ ] DNS Resolution Functional

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
- [ ] Successful Reboot
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

- [ ] Administrative Login Works
- [ ] Root Login Disabled
- [ ] SSH Functional

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
- [ ] Administrative Access

---

# Storage Validation

## Local Storage

Verify:

- [ ] local Present
- [ ] local-lvm Present

---

## Capacity Recording

### local

```text
________________
```

---

### local-lvm

```text
________________
```

---

# Proxmox Standard Compliance

Verify:

- [ ] Hostname Compliant
- [ ] Network Compliant
- [ ] DNS Compliant
- [ ] NTP Active
- [ ] SSH Hardened
- [ ] Tailscale Active

Reference:

```text
deployment/sprint-02/proxmox-standard.md
```

---

# Sprint 03 Preparation

## Planned Container

### AdGuard Secondary

Hostname:

```text
adguard-secondary
```

IP Address:

```text
10.0.10.51
```

Purpose:

```text
DNS Redundancy
```

---

# Sprint 06 Preparation

## Planned VM

### Home Assistant

Hostname:

```text
homeassistant
```

Purpose:

```text
Home Automation Platform
```

---

## Capacity Validation

Verify MAX has sufficient resources for:

- Home Assistant VM
- AdGuard Secondary LXC
- Future Growth

---

# Configuration Exports

Export:

- [ ] Host Configuration
- [ ] Version Information
- [ ] Network Configuration

---

## Storage Location

```text
deployment/sprint-02/exports/max/
```

---

# Evidence Collection

Capture:

- [ ] Installation Screenshots
- [ ] Networking Settings
- [ ] Update Status
- [ ] SSH Hardening
- [ ] Tailscale Enrollment
- [ ] Storage Summary

---

## Storage Location

```text
deployment/sprint-02/evidence/max/
```

---

# Validation Checklist

## Network

- [ ] Gateway Reachable
- [ ] DNS Working
- [ ] Internet Reachable

---

## Administration

- [ ] Web UI Functional
- [ ] SSH Functional
- [ ] Tailscale Functional

---

## Storage

- [ ] local Available
- [ ] local-lvm Available

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

MAX Build Complete When:

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
- CORE-INFRASTRUCTURE.md
- REMOTE-ACCESS.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial MAX Build Sheet |