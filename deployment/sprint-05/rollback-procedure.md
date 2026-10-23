# Sprint 05 Rollback Procedure

## Purpose

This document defines the rollback and recovery procedures for Sprint 05 Media Platform services.

The objective is to restore media services if deployment or configuration changes result in:

- Plex failures
- Audiobookshelf failures
- Immich failures
- Database failures
- Storage integration failures
- Container corruption
- JAX host failures

This procedure applies to:

```text
jax-plex
jax-audiobookshelf
jax-immich
```

---

# Scope

## Included Services

### Media Server

```text
jax-plex
```

---

### Audiobook Platform

```text
jax-audiobookshelf
```

---

### Photo Platform

```text
jax-immich
```

---

## Dependencies

Potentially Impacted:

```text
pax-omv

Storage Mounts

Media Libraries

Photo Libraries

Monitoring

Backups
```

---

# Recovery Priorities

## Priority 1

Restore:

```text
Storage Connectivity
```

---

## Priority 2

Restore:

```text
Immich
```

Reason:

```text
User-generated content
```

---

## Priority 3

Restore:

```text
Audiobookshelf
```

---

## Priority 4

Restore:

```text
Plex
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
JAX Reachable
```

---

## Method 2

### Proxmox Console

Host:

```text
JAX
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

Before beginning recovery verify:

```text
deployment/sprint-05/exports/
```

contains:

```text
jax-plex

jax-audiobookshelf

jax-immich
```

---

## Verify Storage

Validate:

```text
/storage/appdata

/storage/media
```

available.

---

# Scenario 1

## Plex Failure

### Symptoms

```text
Service Offline

Playback Fails

Web Interface Unavailable
```

---

### Validation

```bash
docker ps
```

Verify:

```text
jax-plex
```

status.

---

### Recovery

```bash
docker restart jax-plex
```

---

### Escalation

```bash
docker compose down

docker compose pull

docker compose up -d
```

---

### Validation

Verify:

- Plex Accessible
- Libraries Available
- Playback Functional

---

# Scenario 2

## Audiobookshelf Failure

### Symptoms

```text
Service Offline

Library Missing

Playback Fails
```

---

### Recovery

```bash
docker restart jax-audiobookshelf
```

---

### Escalation

```bash
docker compose down

docker compose pull

docker compose up -d
```

---

### Validation

Verify:

- UI Accessible
- Library Present
- Playback Functional
- Progress Tracking Functional

---

# Scenario 3

## Immich Application Failure

### Symptoms

```text
Login Failure

UI Offline

Uploads Fail
```

---

### Recovery

Restart:

```bash
docker restart jax-immich-server
```

---

### Validation

Verify:

- Login Works
- Photos Accessible
- Uploads Functional

---

# Scenario 4

## Immich Database Failure

### Symptoms

```text
Server Starts

Database Errors

Users Missing

Search Fails
```

---

### Validation

```bash
docker ps
```

Verify:

```text
jax-immich-postgres
```

running.

---

### Recovery

Restart:

```bash
docker restart jax-immich-postgres
```

---

### Escalation

Restore database backup.

Reference:

```text
backup-standard.md
```

---

### Validation

Verify:

- Users Present
- Albums Present
- Search Functional

---

# Scenario 5

## Redis Failure

### Symptoms

```text
Performance Issues

Queue Issues

Thumbnail Processing Stops
```

---

### Recovery

```bash
docker restart jax-immich-redis
```

---

### Validation

Verify:

- Background Jobs Running
- Processing Resumed

---

# Scenario 6

## Storage Mount Failure

### Symptoms

```text
Libraries Missing

Containers Running

Media Unavailable
```

---

### Validation

Verify:

```bash
mount
```

and

```bash
df -h
```

---

### Recovery

Restore:

```text
NFS Mounts

SMB Mounts
```

as defined in:

```text
storage-integration.md
```

---

### Validation

Verify:

```text
/storage/media

/storage/appdata
```

accessible.

---

# Scenario 7

## Media Library Corruption

### Symptoms

```text
Incorrect Metadata

Missing Files

Broken Libraries
```

---

### Recovery

#### Plex

Refresh Libraries.

---

#### Audiobookshelf

Rescan Library.

---

#### Immich

Run:

```text
Library Scan
```

and

```text
Metadata Refresh
```

---

### Validation

Verify:

- Libraries Restored
- Metadata Correct

---

# Scenario 8

## Configuration Loss

### Symptoms

```text
Settings Missing

Users Missing

Libraries Missing
```

---

### Recovery

Restore:

```text
/storage/appdata/plex

/storage/appdata/audiobookshelf

/storage/appdata/immich
```

from backups.

---

### Validation

Verify:

- Configuration Restored
- Users Present
- Libraries Present

---

# Scenario 9

## JAX Host Failure

### Impact

Potential Loss Of:

```text
jax-plex

jax-audiobookshelf

jax-immich
```

---

### Recovery Order

#### Step 1

Restore:

```text
JAX Host
```

Reference:

```text
deployment/sprint-02/rollback-procedure.md
```

---

#### Step 2

Restore Storage Connectivity

Validate:

```text
pax-omv Reachable
```

---

#### Step 3

Restore:

```text
jax-immich
```

---

#### Step 4

Restore:

```text
jax-audiobookshelf
```

---

#### Step 5

Restore:

```text
jax-plex
```

---

### Validation

Execute:

```text
deployment/sprint-05/validation-checklist.md
```

---

# Storage Validation

Verify:

```text
/storage/appdata
```

contains:

- [ ] immich
- [ ] audiobookshelf
- [ ] plex

---

Verify:

```text
/storage/media
```

contains:

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
deployment/sprint-05/validation-checklist.md
```

---

## Mandatory Checks

### Plex

- [ ] Functional
- [ ] Libraries Present
- [ ] Playback Functional

---

### Audiobookshelf

- [ ] Functional
- [ ] Library Present
- [ ] Playback Functional

---

### Immich

- [ ] Functional
- [ ] Login Functional
- [ ] Upload Functional

---

### Storage

- [ ] Mounts Functional
- [ ] Capacity Normal

---

### Monitoring

- [ ] Uptime Kuma Updated
- [ ] Monitoring Passing

---

# Incident Record

## Date

```text
_____________________
```

---

## Service

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

- Media Services Restored
- Storage Connectivity Restored
- Libraries Restored
- Monitoring Restored
- Validation Checklist Passed
- Documentation Updated

---

# Related Documents

- README.md
- storage-integration.md
- media-workflows.md
- jax-plex.md
- jax-audiobookshelf.md
- jax-immich.md
- validation-checklist.md
- ../sprint-04/storage-layout.md
- ../sprint-04/pax-omv.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 05 Rollback Procedure |