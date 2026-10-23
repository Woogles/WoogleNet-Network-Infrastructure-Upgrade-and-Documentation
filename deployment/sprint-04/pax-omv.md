# PAX OpenMediaVault Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational requirements for the WoogleNet storage platform.

Service Name:

```text
pax-omv
```

Role:

```text
Central Storage Platform

SMB Services

NFS Services

Backup Repository

Application Storage

Media Storage
```

This service provides centralized storage to all future WoogleNet services.

---

# Service Information

## Service Summary

| Property | Value |
|-----------|-----------|
| Service Name | pax-omv |
| Platform | OpenMediaVault |
| Host | PAX |
| VM ID | 600 |
| Type | Virtual Machine |
| Hostname | pax-omv |
| IP Address | 10.0.10.70 |
| VLAN | 10 Infrastructure |
| Tier | Tier 1 Critical |

---

# Standards Compliance

This deployment must comply with:

- naming-standard.md
- vm-standard.md
- service-hardening-standard.md
- network-security-standard.md
- backup-standard.md
- monitoring-standard.md
- logging-standard.md

---

# Dependencies

Required Before Deployment:

- [ ] Sprint 01 Complete
- [ ] Sprint 02 Complete
- [ ] Sprint 03 Complete
- [ ] PAX Operational
- [ ] Storage Layout Approved
- [ ] Backup Repository Design Approved

---

# Storage References

Authoritative References:

```text
storage-layout.md

smb-shares.md

backup-repository.md
```

---

# Virtual Machine Specification

## VM Information

| Property | Value |
|-----------|----------|
| VM ID | 600 |
| Name | pax-omv |
| Host | PAX |
| Type | VM |

---

## Resources

| Resource | Allocation |
|-----------|----------|
| vCPU | 4 |
| Memory | 8 GB |
| Storage | OS + Data Volumes |
| Network | VirtIO |

---

## Operating System

```text
OpenMediaVault 7.x
```

---

# Network Configuration

## Hostname

```text
pax-omv
```

---

## IPv4 Address

```text
10.0.10.70/24
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

Secondary:

```text
10.0.10.51
```

---

# Virtual Machine Creation

## VM Name

```text
pax-omv
```

---

## VM ID

```text
600
```

---

## Disk Controller

```text
VirtIO SCSI
```

---

## Network Adapter

```text
VirtIO
```

---

## Validation

Verify:

- [ ] VM Created
- [ ] VM Boots Successfully
- [ ] Static IP Assigned
- [ ] Network Functional

---

# OpenMediaVault Installation

## Install

Deploy OpenMediaVault using the approved installation media.

---

## Initial Configuration

Configure:

```text
Hostname

Static IP

DNS

Gateway

Time Zone
```

---

## Update System

Execute:

```bash
apt update
apt upgrade -y
```

---

## Validation

Verify:

- [ ] Updates Installed
- [ ] No Package Errors
- [ ] Reboot Successful

---

# Storage Configuration

Reference:

```text
storage-layout.md
```

---

## Logical Root

```text
/storage
```

---

## Directory Structure

Required:

```text
/storage
├── appdata
├── archives
├── backups
├── documents
├── downloads
├── media
├── shares
└── staging
```

---

## Validation

Verify:

- [ ] Structure Created
- [ ] Ownership Applied
- [ ] Permissions Applied

---

# SMB Configuration

Reference:

```text
smb-shares.md
```

---

## SMB Version

Minimum:

```text
SMB3
```

---

## SMB1

```text
Disabled
```

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

## Validation

Verify:

- [ ] SMB Running
- [ ] SMB3 Enabled
- [ ] SMB1 Disabled

---

# Share Creation

Create:

```text
backups

media

documents

downloads

archives

shares
```

---

## Validation

Verify:

- [ ] Share Accessible
- [ ] Permissions Correct
- [ ] Authentication Required

---

# Backup Repository Deployment

Reference:

```text
backup-repository.md
```

---

## Repository Root

```text
/storage/backups
```

---

## Required Paths

```text
/storage/backups/proxmox
/storage/backups/lxcs
/storage/backups/vms
/storage/backups/configs
/storage/backups/databases
/storage/backups/kopia
/storage/backups/restores
/storage/backups/exports
```

---

## Validation

Verify:

- [ ] Repository Created
- [ ] Capacity Verified
- [ ] Access Verified

---

# Service Storage Allocation

## jax-immich

```text
/storage/appdata/immich
/storage/media/photos
```

---

## jax-paperless

```text
/storage/appdata/paperless
/storage/documents/scans
```

---

## jax-nextcloud

```text
/storage/appdata/nextcloud
/storage/shares
```

---

## jax-vaultwarden

```text
/storage/appdata/vaultwarden
```

---

## max-homeassistant

```text
/storage/appdata/homeassistant
```

---

## jax-plex

```text
/storage/appdata/plex
/storage/media
```

---

# Security Hardening

Reference:

```text
service-hardening-standard.md
```

---

## Administrative Access

Allow:

```text
Infrastructure VLAN

Trusted VLAN

Tailscale
```

---

## Deny

```text
Guest VLAN

IoT VLAN
```

---

## Web Interface

Access Restricted To:

```text
Administrative Networks
```

---

# Monitoring Configuration

Reference:

```text
monitoring-standard.md
```

---

## Uptime Kuma

Create Monitors:

### Ping

```text
pax-omv
```

---

### HTTPS

```text
pax-omv
```

---

### SMB

```text
SMB Availability
```

---

### Capacity

```text
Storage Capacity
```

---

## Alert Thresholds

Warning:

```text
80%
```

Critical:

```text
90%
```

Emergency:

```text
95%
```

---

# Backup Protection

Reference:

```text
backup-standard.md
```

---

## Protect

Backup:

```text
OMV Configuration

Share Definitions

User Accounts

Permissions

Repository Configuration
```

---

## Export Location

```text
deployment/sprint-04/exports/pax-omv/
```

---

# Logging

Reference:

```text
logging-standard.md
```

---

Capture:

```text
Authentication Events

Share Changes

Configuration Changes

Disk Errors

RAID Events

Service Restarts
```

---

# Evidence Collection

Store In:

```text
deployment/sprint-04/evidence/pax-omv/
```

---

## Capture

- [ ] Dashboard
- [ ] Storage Volumes
- [ ] Shared Folders
- [ ] SMB Configuration
- [ ] User Accounts
- [ ] Backup Repository
- [ ] Capacity Dashboard

---

# Validation Checklist

## Virtual Machine

- [ ] Running
- [ ] Updated
- [ ] Network Functional

---

## Storage

- [ ] Directory Structure Created
- [ ] Shares Created
- [ ] Permissions Applied

---

## SMB

- [ ] SMB Running
- [ ] SMB3 Enabled
- [ ] Client Access Verified

---

## Backup Repository

- [ ] Repository Created
- [ ] Capacity Verified

---

## Monitoring

- [ ] Added To dax-uptime
- [ ] Alerts Configured

---

## Security

- [ ] Guest Access Disabled
- [ ] Anonymous Access Disabled
- [ ] Administrative Access Restricted

---

# Completion Record

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

pax-omv is complete when:

- [ ] VM Operational
- [ ] Storage Structure Created
- [ ] SMB Operational
- [ ] Backup Repository Operational
- [ ] Monitoring Configured
- [ ] Security Applied
- [ ] Exports Completed
- [ ] Evidence Collected

---

# Related Documents

- README.md
- storage-layout.md
- smb-shares.md
- backup-repository.md
- validation-checklist.md
- rollback-procedure.md
- ../standards/vm-standard.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial OpenMediaVault Deployment Guide |