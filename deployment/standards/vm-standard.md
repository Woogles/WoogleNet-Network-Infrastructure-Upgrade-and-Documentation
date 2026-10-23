
# VM Standard

## Purpose

This document defines the standard configuration for all Virtual Machines (VMs) deployed within the WoogleNet environment.

The goals of this standard are to:

- Standardize VM deployments
- Reduce configuration drift
- Improve security
- Simplify administration
- Improve recoverability
- Support repeatable infrastructure builds

All VMs must comply with this standard unless an approved exception is documented in:

```text
SERVICE-DECISIONS.md
```

---

# Scope

This standard applies to:

```text
OpenMediaVault

Home Assistant

Future Infrastructure VMs

Future Application VMs
```

This standard does not apply to:

```text
LXC Containers
```

Reference:

```text
lxc-standard.md
```

---

# VM Policy

## Preferred Deployment Model

Default:

```text
LXC
```

when technically appropriate.

---

## VM Usage

Use VMs when:

- Direct hardware access is required
- Appliance-style deployment is required
- Vendor recommendation requires a VM
- Isolation requirements exceed LXC capabilities

---

# Current VM Inventory

## OpenMediaVault

Host:

```text
PAX
```

Purpose:

```text
Storage Platform
```

---

## Home Assistant

Host:

```text
MAX
```

Purpose:

```text
Home Automation
```

---

# Naming Standard

## VM Name

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

## Hostname

Hostname should match VM name.

Examples:

```text
omv

homeassistant
```

---

# VM ID Standard

## Infrastructure VMs

Reserved:

```text
500-599
```

---

## Storage VMs

Reserved:

```text
600-699
```

---

## Application VMs

Reserved:

```text
700-799
```

---

## Future Expansion

Reserved:

```text
800-999
```

---

# Operating System Standard

## Linux VMs

Preferred:

```text
Debian 12
```

---

## Appliance VMs

Preferred:

```text
Vendor Supported Distribution
```

Examples:

```text
Home Assistant OS

OpenMediaVault
```

---

## Unsupported

```text
End-of-Life Operating Systems
```

---

# Resource Standards

## Small VM

| Resource | Value |
|-----------|-----------|
| vCPU | 2 |
| RAM | 4 GB |
| Storage | 32 GB |

---

## Medium VM

| Resource | Value |
|-----------|-----------|
| vCPU | 4 |
| RAM | 8 GB |
| Storage | 64 GB |

---

## Large VM

| Resource | Value |
|-----------|-----------|
| vCPU | 8+ |
| RAM | 16+ GB |
| Storage | Service Specific |

---

# OpenMediaVault Standard

## VM ID

```text
600
```

---

## Host

```text
PAX
```

---

## Recommended Resources

| Resource | Value |
|-----------|-----------|
| vCPU | 4 |
| Memory | 8 GB |
| Storage | Service Specific |

---

## Special Requirements

- Storage Access
- Backup Repository
- SMB Services

---

# Home Assistant Standard

## VM ID

```text
500
```

---

## Host

```text
MAX
```

---

## Recommended Resources

| Resource | Value |
|-----------|-----------|
| vCPU | 4 |
| Memory | 8 GB |
| Storage | 64 GB |

---

## Special Requirements

- Vendor Appliance
- Home Automation
- Snapshot Backups

---

# Networking Standard

## VLAN

Default:

```text
VLAN 10
Infrastructure
```

---

## Addressing

Required:

```text
Static IP
```

---

## DHCP

```text
Not Allowed
```

for Infrastructure VMs.

---

## Gateway

```text
10.0.10.1
```

---

# DNS Standard

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

## Validation

Verify:

```bash
nslookup google.com
```

Successful resolution required.

---

# Time Synchronization

## NTP

Required:

```text
Enabled
```

---

## Validation

```bash
timedatectl status
```

Expected:

```text
System Clock Synchronized
```

---

# Storage Standard

## System Disk

Purpose:

```text
Operating System
```

---

## Data Disk

Purpose:

```text
Application Data
```

where applicable.

---

## Growth Strategy

Expand data disks separately from system disks whenever practical.

---

# Security Standard

## Administrative Access

Allowed From:

```text
Infrastructure VLAN

Trusted VLAN

Tailscale
```

---

## Root Access

Allowed:

```text
Console Access
```

only when needed.

---

## Password Requirements

Minimum:

```text
16 Character Password
```

---

## Password Storage

Required:

```text
Vaultwarden
```

---

# SSH Standard

## Service

```text
Enabled
```

when required.

---

## Root SSH Login

```text
Disabled
```

---

## Administrative Account

Create:

```text
eric-admin
```

or approved equivalent.

---

# Update Standard

## Initial Deployment

Execute:

```bash
apt update
apt upgrade -y
```

for Linux-based systems.

---

## Appliance Updates

Follow:

```text
Vendor Recommended Process
```

---

## Validation

Verify:

- No Pending Critical Updates
- No Repository Errors

---

# Monitoring Standard

All VMs must be monitored by:

```text
Uptime Kuma
```

---

## Required Checks

- Ping
- HTTP/HTTPS
- Service Availability

---

## Optional Checks

- Resource Utilization
- Storage Capacity

---

# Backup Standard

## Tier Classification

### Tier 1

Critical

Examples:

```text
OpenMediaVault

Home Assistant
```

---

## Backup Frequency

Minimum:

```text
Weekly VM Backup
```

---

## Configuration Backup

Required:

```text
Yes
```

---

## Recovery Validation

Required:

```text
Annual Minimum

Quarterly Preferred
```

---

# Logging Standard

## Retention

Minimum:

```text
90 Days
```

---

## Security Logging

Capture:

- Login Attempts
- Administrative Changes
- Service Failures

---

# Documentation Standard

Each VM Must Have:

- Purpose
- Host Location
- IP Address
- Resource Allocation
- Backup Status
- Monitoring Status

---

# Validation Standard

Every VM Deployment Must Verify:

- [ ] VM Running
- [ ] Static IP Assigned
- [ ] DNS Functional
- [ ] NTP Functional
- [ ] Updates Applied
- [ ] Monitoring Enabled
- [ ] Backup Enabled
- [ ] Documentation Updated

---

# Compliance Checklist

Applicable To All VMs

- [ ] Standard Naming
- [ ] Static IP
- [ ] DNS Configured
- [ ] Time Synchronization Active
- [ ] Security Applied
- [ ] Monitoring Enabled
- [ ] Backup Enabled
- [ ] Evidence Collected

---

# Exceptions

All exceptions must be documented in:

```text
SERVICE-DECISIONS.md
```

Include:

- Reason
- Risk
- Mitigation
- Approval Date

---

# Related Standards

- proxmox-standard.md
- lxc-standard.md
- service-hardening-standard.md
- network-security-standard.md
- backup-standard.md
- monitoring-standard.md
- naming-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial VM Standard |