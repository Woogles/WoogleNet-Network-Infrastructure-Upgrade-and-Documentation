# Sprint 04 Validation Checklist

## Purpose

This document provides the final validation checklist for Sprint 04 Storage Platform.

The goal is to verify that:

- pax-omv is operational
- Storage architecture is implemented
- SMB services are operational
- Backup repository is operational
- Monitoring is operational
- Security controls are applied
- Storage is ready for application deployment

Sprint 04 cannot be closed until all validation items pass.

---

# Validation Information

## Validator

```text
_____________________
```

---

## Date

```text
_____________________
```

---

## Sprint

```text
Sprint 04 - Storage Platform
```

---

# Service Validation

## Service Inventory

| Service | IP Address | Status |
|----------|----------|----------|
| pax-omv | 10.0.10.70 | [ ] |

---

# Virtual Machine Validation

## pax-omv

Verify:

- [ ] VM Running
- [ ] VM Boots Successfully
- [ ] Hostname Correct
- [ ] Static IP Assigned
- [ ] Network Functional
- [ ] DNS Functional
- [ ] Time Synchronization Functional

---

## Connectivity Tests

Execute:

```bash
ping 10.0.10.1
```

```bash
ping 10.0.10.50
```

```bash
nslookup github.com
```

---

Verify:

- [ ] Gateway Reachable
- [ ] DNS Reachable
- [ ] Internet Reachable

---

## Result

```text
PASS / FAIL
```

---

# Storage Structure Validation

Reference:

```text
storage-layout.md
```

---

## Root Structure

Verify:

```text
/storage
```

Exists.

---

## Directories

Verify:

- [ ] /storage/appdata
- [ ] /storage/backups
- [ ] /storage/media
- [ ] /storage/documents
- [ ] /storage/downloads
- [ ] /storage/archives
- [ ] /storage/shares
- [ ] /storage/staging

---

## AppData Directories

Verify:

- [ ] immich
- [ ] paperless
- [ ] nextcloud
- [ ] vaultwarden
- [ ] bookstack
- [ ] homeassistant
- [ ] navidrome
- [ ] plex
- [ ] audiobookshelf

---

## Result

```text
PASS / FAIL
```

---

# Storage Capacity Validation

## Verify Volumes

Verify:

- [ ] Storage Mounted
- [ ] Capacity Correct
- [ ] Available Space Correct

---

## Capacity Monitoring

Verify:

- [ ] Warning Threshold Configured (80%)
- [ ] Critical Threshold Configured (90%)
- [ ] Emergency Threshold Defined (95%)

---

## Result

```text
PASS / FAIL
```

---

# SMB Validation

Reference:

```text
smb-shares.md
```

---

## SMB Service

Verify:

- [ ] SMB Running
- [ ] SMB3 Enabled
- [ ] SMB1 Disabled

---

## Share Availability

Verify:

- [ ] backups
- [ ] media
- [ ] documents
- [ ] downloads
- [ ] archives
- [ ] shares

---

## Authentication

Verify:

- [ ] Anonymous Disabled
- [ ] Guest Access Disabled
- [ ] Authenticated Access Works

---

## Result

```text
PASS / FAIL
```

---

# Share Access Validation

## VLAN 10

Verify:

- [ ] Share Access Works

---

## VLAN 20

Verify:

- [ ] Share Access Works

---

## VLAN 30

Verify:

- [ ] Access Blocked

---

## VLAN 40

Verify:

- [ ] Access Blocked

---

## Result

```text
PASS / FAIL
```

---

# Backup Repository Validation

Reference:

```text
backup-repository.md
```

---

## Repository Structure

Verify:

- [ ] /storage/backups/proxmox
- [ ] /storage/backups/lxcs
- [ ] /storage/backups/vms
- [ ] /storage/backups/configs
- [ ] /storage/backups/databases
- [ ] /storage/backups/kopia
- [ ] /storage/backups/restores
- [ ] /storage/backups/exports

---

## Repository Configuration

Verify:

- [ ] Repository Created
- [ ] Repository Accessible
- [ ] Repository Encrypted

---

## Result

```text
PASS / FAIL
```

---

# Backup Validation

## Test Backup

Perform:

```text
Configuration Backup
```

---

Verify:

- [ ] Backup Successful
- [ ] Backup Logged
- [ ] Backup Stored

---

## Test Restore

Perform:

```text
Restore Test
```

---

Verify:

- [ ] Restore Successful
- [ ] Data Accessible
- [ ] Validation Successful

---

## Result

```text
PASS / FAIL
```

---

# Monitoring Validation

Reference:

```text
monitoring-standard.md
```

---

## Uptime Kuma

Verify Monitor Exists:

```text
pax-omv
```

---

## Monitor Types

Verify:

- [ ] Ping
- [ ] HTTPS
- [ ] SMB
- [ ] Capacity Monitoring

---

## Alerting

Verify:

- [ ] Warning Alert Functional
- [ ] Critical Alert Functional

---

## Result

```text
PASS / FAIL
```

---

# Security Validation

Reference:

```text
network-security-standard.md

service-hardening-standard.md
```

---

## Administrative Access

Verify:

- [ ] VLAN 10 Allowed
- [ ] VLAN 20 Allowed
- [ ] Tailscale Access Functional

---

## Restricted Access

Verify:

- [ ] VLAN 30 Blocked
- [ ] VLAN 40 Blocked

---

## SMB Security

Verify:

- [ ] SMB1 Disabled
- [ ] Guest Disabled
- [ ] Anonymous Disabled

---

## Result

```text
PASS / FAIL
```

---

# Logging Validation

Reference:

```text
logging-standard.md
```

---

Verify:

- [ ] System Logging Enabled
- [ ] SMB Logging Enabled
- [ ] Authentication Logging Enabled
- [ ] Configuration Changes Logged

---

## Result

```text
PASS / FAIL
```

---

# Evidence Validation

Verify Evidence Exists:

```text
deployment/sprint-04/evidence/
```

---

Required:

### pax-omv

- [ ] Dashboard
- [ ] Network Configuration
- [ ] Storage Volumes

---

### Storage

- [ ] Storage Layout
- [ ] Capacity Information

---

### SMB

- [ ] Shares
- [ ] Permissions
- [ ] Security Settings

---

### Backups

- [ ] Repository
- [ ] Backup Test
- [ ] Restore Test

---

## Result

```text
PASS / FAIL
```

---

# Export Validation

Verify Exports Exist:

```text
deployment/sprint-04/exports/
```

---

Required:

### pax-omv

- [ ] Configuration Export

---

### Storage

- [ ] Storage Export

---

### SMB

- [ ] SMB Configuration Export

---

## Result

```text
PASS / FAIL
```

---

# Sprint Acceptance Review

| Requirement | Status |
|-------------|---------|
| pax-omv Operational | [ ] |
| Storage Structure Created | [ ] |
| SMB Operational | [ ] |
| Backup Repository Operational | [ ] |
| Restore Testing Successful | [ ] |
| Monitoring Operational | [ ] |
| Security Applied | [ ] |
| Exports Collected | [ ] |
| Evidence Collected | [ ] |

---

# Final Sprint Result

## Validation Outcome

```text
PASS / FAIL
```

---

## Approved By

```text
_____________________
```

---

## Date

```text
_____________________
```

---

# Exit Criteria

Sprint 04 may only be closed when:

- [ ] All Validation Sections Pass
- [ ] Storage Structure Implemented
- [ ] SMB Operational
- [ ] Repository Operational
- [ ] Restore Testing Successful
- [ ] Monitoring Functional
- [ ] Documentation Updated
- [ ] Exports Stored
- [ ] Evidence Stored
- [ ] Sprint 05 Ready

---

# Next Sprint

```text
Sprint 05 - Media Platform
```

Deployment Targets:

```text
jax-plex

jax-audiobookshelf

jax-immich
```

Primary Objectives:

```text
Deploy Media Services

Connect Shared Storage

Validate Media Workflows

Implement Photo Management
```

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 04 Validation Checklist |