# Backup Repository

## Purpose

This document defines the backup repository architecture for the WoogleNet environment.

The repository provides centralized backup storage for:

- Proxmox Hosts
- Virtual Machines
- LXC Containers
- Application Data
- Configuration Backups
- Database Dumps
- Restore Operations

The backup repository is hosted on:

```text
pax-omv
```

Reference:

```text
backup-standard.md
```

---

# Repository Information

## Repository Name

```text
pax-backups
```

---

## Platform

```text
OpenMediaVault
```

---

## Host

```text
pax-omv
```

---

## Classification

```text
Tier 1 Critical
```

---

# Repository Structure

## Root Path

```text
/storage/backups
```

---

## Layout

```text
/storage/backups
│
├── proxmox/
├── lxcs/
├── vms/
├── configs/
├── databases/
├── kopia/
├── restores/
└── exports/
```

---

# Proxmox Backups

## Path

```text
/storage/backups/proxmox
```

---

## Purpose

Stores:

```text
Host Configuration Exports

Cluster Information

Network Exports

Version Information
```

---

# LXC Backups

## Path

```text
/storage/backups/lxcs
```

---

## Purpose

Stores:

```text
Container Backups

Container Snapshots

Container Exports
```

---

## Planned Services

```text
dax-adguard

max-adguard

dax-homepage

dax-uptime

Future LXCs
```

---

# VM Backups

## Path

```text
/storage/backups/vms
```

---

## Purpose

Stores backups of:

```text
pax-omv

max-homeassistant

Future Virtual Machines
```

---

# Configuration Backups

## Path

```text
/storage/backups/configs
```

---

## Purpose

Stores:

```text
AdGuard Exports

Homepage Configuration

Uptime Kuma Configuration

OpenMediaVault Configuration

Docker Compose Files

Network Exports
```

---

# Database Backups

## Path

```text
/storage/backups/databases
```

---

## Purpose

Stores:

```text
Immich Database

Paperless Database

Vaultwarden Database

BookStack Database

Future Service Databases
```

---

# Kopia Repository

## Path

```text
/storage/backups/kopia
```

---

## Purpose

Primary backup repository.

---

## Repository Type

```text
Encrypted
```

---

## Encryption

Required:

```text
AES Encryption

Strong Repository Password
```

---

## Credentials

Store In:

```text
Vaultwarden
```

---

# Restore Workspace

## Path

```text
/storage/backups/restores
```

---

## Purpose

Temporary restore testing.

---

## Policy

```text
Not For Permanent Storage
```

---

# Export Repository

## Path

```text
/storage/backups/exports
```

---

## Purpose

Stores:

```text
Service Exports

Configuration Bundles

Migration Packages

Manual Archives
```

---

# Backup Schedule

## Tier 1 Services

Frequency:

```text
Daily
```

Examples:

```text
pax-omv

max-homeassistant

jax-vaultwarden

jax-immich

jax-paperless

jax-nextcloud
```

---

## Tier 2 Services

Frequency:

```text
Weekly
```

Examples:

```text
jax-plex

jax-audiobookshelf

jax-bookstack

jax-navidrome
```

---

## Tier 3 Services

Frequency:

```text
Weekly
```

Examples:

```text
dax-homepage

dax-uptime
```

---

# Retention Policy

## Daily Backups

Retention:

```text
30 Days
```

---

## Weekly Backups

Retention:

```text
12 Weeks
```

---

## Monthly Backups

Retention:

```text
12 Months
```

---

## Annual Backups

Retention:

```text
3 Years
```

---

# Offsite Replication

## Destination

```text
Microsoft OneDrive
```

---

## Scope

Replicate:

```text
Critical Backups

Configuration Exports

Database Dumps
```

---

## Schedule

```text
Daily
```

---

# Permissions

## Infrastructure Administrators

Access:

```text
Full Control
```

---

## Services

Access:

```text
Write Only
```

where practical.

---

## Guest Access

```text
Disabled
```

---

## Anonymous Access

```text
Disabled
```

---

# Capacity Planning

## Warning Threshold

```text
80%
```

---

## Critical Threshold

```text
90%
```

---

## Emergency Threshold

```text
95%
```

---

## Required Action

### 80%

```text
Review Capacity
```

---

### 90%

```text
Expansion Plan Required
```

---

### 95%

```text
Immediate Remediation
```

---

# Monitoring Requirements

Reference:

```text
monitoring-standard.md
```

---

## Monitor

- Repository Availability
- Repository Capacity
- Backup Success
- Backup Failures
- OneDrive Connectivity

---

## Alerts

Generate Alerts For:

- Failed Backups
- Repository Offline
- Capacity Warning
- Capacity Critical
- Offsite Replication Failure

---

# Restore Testing

## Frequency

```text
Quarterly
```

---

## Required Validation

Verify:

- Backup Available
- Restore Successful
- Service Starts
- Data Accessible

---

## Test Location

```text
/storage/backups/restores
```

---

# Security Requirements

Reference:

```text
service-hardening-standard.md
```

---

## Required

- Repository Encryption
- Strong Passwords
- Vaultwarden Storage
- Access Logging

---

# Backup Validation Checklist

## Repository

- [ ] Repository Created
- [ ] Encryption Enabled
- [ ] Capacity Verified

---

## Schedules

- [ ] Daily Jobs Configured
- [ ] Weekly Jobs Configured
- [ ] Retention Configured

---

## Offsite

- [ ] OneDrive Connected
- [ ] Replication Verified

---

## Monitoring

- [ ] Capacity Monitoring Enabled
- [ ] Failure Alerts Enabled

---

## Restore Testing

- [ ] Test Restore Completed
- [ ] Restore Documented

---

# Related Documents

- README.md
- storage-layout.md
- smb-shares.md
- pax-omv.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md
- ../standards/logging-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Backup Repository Design |