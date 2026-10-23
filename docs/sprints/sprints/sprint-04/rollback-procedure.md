# Sprint 04 Rollback Procedure

## Purpose

This document defines the rollback and recovery procedures for Sprint 04 Storage Platform.

The objective is to restore storage functionality if deployment or configuration changes result in:

- Storage outages
- SMB failures
- Backup repository failures
- Data access failures
- OpenMediaVault failures
- PAX host failures

This procedure applies to:

```text
pax-omv
```

and all storage services provided by it.

---

# Scope

## Included Components

### Storage Platform

```text
pax-omv
```

---

### SMB Services

```text
backups

media

documents

downloads

archives

shares
```

---

### Backup Repository

```text
/storage/backups
```

---

### Application Storage

```text
/storage/appdata
```

---

## Dependencies

Potentially Impacted:

```text
Immich

Paperless

Nextcloud

Vaultwarden

BookStack

Home Assistant

Plex

Audiobookshelf

Navidrome

ARR Stack
```

---

# Recovery Priorities

## Priority 1

Restore:

```text
Storage Availability
```

---

## Priority 2

Restore:

```text
Backup Repository
```

---

## Priority 3

Restore:

```text
SMB Access
```

---

## Priority 4

Restore:

```text
Application Storage
```

---

## Priority 5

Restore:

```text
Monitoring
```

---

# Emergency Access Methods

## Method 1

### Tailscale

Verify:

```text
PAX Reachable
```

---

## Method 2

### Proxmox Console

Host:

```text
PAX
```

Access:

```text
https://10.0.10.32:8006
```

---

## Method 3

### Physical Console

Reference:

```text
RACK-LAYOUT.md
```

---

# Backup Verification

Before recovery begins verify the following exist.

## Exports

```text
deployment/sprint-04/exports/
```

---

Verify:

```text
pax-omv

storage

smb
```

exist.

---

## Repository

Verify:

```text
/storage/backups
```

is accessible.

---

# Scenario 1

## OpenMediaVault Service Failure

### Symptoms

```text
Web UI Unavailable

Configuration Errors

Storage Management Unavailable
```

---

### Validation

Check:

```bash
systemctl status openmediavault-engined
```

---

### Recovery

Restart:

```bash
systemctl restart openmediavault-engined
```

---

### Validation

Verify:

- Web UI Accessible
- Configuration Loads
- Storage Visible

---

# Scenario 2

## SMB Service Failure

### Symptoms

```text
Shares Not Accessible

Authentication Failures

Network Paths Unavailable
```

---

### Validation

Check:

```bash
systemctl status smbd
```

---

### Recovery

Restart:

```bash
systemctl restart smbd
```

---

### Validation

Verify:

- Authentication Works
- Share Access Works
- SMB Service Running

---

# Scenario 3

## Share Access Failure

### Symptoms

```text
One Or More Shares Unavailable
```

---

### Validate

Check:

```text
Shared Folder Configuration

Permissions

Filesystem Availability
```

---

### Recovery

#### Step 1

Verify storage mounted.

---

#### Step 2

Verify share paths exist.

---

#### Step 3

Restore share configuration from export.

---

### Validation

Verify:

```text
backups

media

documents

downloads

archives

shares
```

accessible.

---

# Scenario 4

## Storage Mount Failure

### Symptoms

```text
Directories Missing

Storage Capacity Incorrect

Files Missing
```

---

### Validation

Verify mounted filesystem.

Execute:

```bash
lsblk

df -h
```

---

### Recovery

Identify:

```text
Unmounted Volume

Filesystem Error

Device Failure
```

---

### Validation

Verify:

```text
/storage
```

restored.

---

# Scenario 5

## Backup Repository Failure

### Symptoms

```text
Backup Jobs Fail

Repository Unavailable

Kopia Errors
```

---

### Validation

Verify:

```text
/storage/backups
```

exists.

---

### Recovery

Restore:

```text
Repository Configuration
```

from backups.

---

### Verify

- Repository Accessible
- Backups Visible
- Jobs Functional

---

# Scenario 6

## Repository Corruption

### Symptoms

```text
Repository Validation Failure

Restore Failure
```

---

### Recovery

#### Step 1

Stop Backup Jobs

---

#### Step 2

Validate Repository

---

#### Step 3

Restore Most Recent Known Good Copy

---

#### Step 4

Revalidate

---

### Validation

Perform:

```text
Test Restore
```

---

# Scenario 7

## Configuration Loss

### Symptoms

```text
Missing Shares

Missing Users

Missing Paths

Incorrect Settings
```

---

### Recovery

Restore:

```text
OMV Configuration Export
```

from:

```text
deployment/sprint-04/exports/pax-omv/
```

---

### Validation

Verify:

- Shares Present
- Users Present
- Services Functional

---

# Scenario 8

## Permission Errors

### Symptoms

```text
Access Denied

Application Failures

SMB Authentication Success But Access Failure
```

---

### Recovery

Verify:

```text
Filesystem Permissions

OMV Shared Folder Permissions

SMB Share Permissions
```

---

### Validation

Test:

```text
Administrator Access

Application Access
```

---

# Scenario 9

## PAX Host Failure

### Impact

Potential Loss Of:

```text
OpenMediaVault

SMB

Storage Services

Backup Repository
```

---

### Recovery

#### Step 1

Restore PAX Host

Reference:

```text
deployment/sprint-02/rollback-procedure.md
```

---

#### Step 2

Restore:

```text
pax-omv VM
```

---

#### Step 3

Restore Storage Mounts

---

#### Step 4

Restore Share Configuration

---

#### Step 5

Restore Monitoring

---

### Validation

Execute:

```text
deployment/sprint-04/validation-checklist.md
```

---

# Application Storage Validation

Verify:

```text
/storage/appdata
```

---

## Required Directories

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

# Media Storage Validation

Verify:

```text
/storage/media
```

---

Required:

- [ ] movies
- [ ] tv
- [ ] music
- [ ] audiobooks
- [ ] photos
- [ ] home-videos

---

# Post-Recovery Validation

Execute:

```text
deployment/sprint-04/validation-checklist.md
```

---

## Mandatory Checks

### Storage

- [ ] Mounted
- [ ] Capacity Correct

---

### SMB

- [ ] Accessible
- [ ] Authentication Functional

---

### Backup Repository

- [ ] Accessible
- [ ] Encrypted
- [ ] Backup Jobs Functional

---

### Monitoring

- [ ] pax-omv Online
- [ ] Alerts Functional

---

# Incident Record

## Date

```text
_____________________
```

---

## Component

```text
_____________________
```

---

## Issue

```text
_____________________
```

---

## Root Cause

```text
_____________________
```

---

## Recovery Actions

```text
_____________________
```

---

## Recovery Time

```text
_____________________
```

---

## Result

```text
PASS / FAIL
```

---

# Sprint Recovery Success Criteria

Recovery is successful when:

- Storage Restored
- SMB Restored
- Backup Repository Restored
- Monitoring Restored
- Validation Checklist Passed
- Documentation Updated

---

# Related Documents

- README.md
- pax-omv.md
- storage-layout.md
- smb-shares.md
- backup-repository.md
- validation-checklist.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md
- ../standards/network-security-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 04 Rollback Procedure |