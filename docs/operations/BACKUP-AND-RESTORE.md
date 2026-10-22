# Backup and Restore

## Purpose

This document defines the backup strategy, retention policies, recovery priorities, and restore procedures for the WoogleNet environment.

The goals of this strategy are:

- Protect irreplaceable data
- Enable rapid service recovery
- Maintain historical backups
- Protect against accidental deletion
- Protect against hardware failure
- Maintain offsite copies of critical data

This document should be reviewed whenever new services or storage platforms are added.

---

# Backup Strategy

## Backup Platform

| Property | Value |
|-----------|----------|
| Backup Software | Kopia |
| Primary Repository | OpenMediaVault |
| Offsite Backup Target | OneDrive |
| Status | Planned |

---

# Backup Principles

## Rule 1

Critical data must exist in at least:

```text
3 Copies

Production Copy
+
Local Backup
+
Offsite Backup
```

---

## Rule 2

Services can be rebuilt.

Data cannot always be recreated.

Priority should always be:

```text
Data First
Applications Second
```

---

## Rule 3

Backup jobs are not considered valid until successful restoration has been tested.

---

# Data Classifications

## Critical

Data that causes significant loss if destroyed.

### Services

- Immich
- Vaultwarden
- Paperless-ngx
- Nextcloud
- Home Assistant
- BookStack

### Backup Required

```text
Mandatory
```

### Restore Priority

```text
Priority 1
```

---

## Important

Data that is valuable but can be recreated.

### Services

- Audiobookshelf
- Navidrome
- qBittorrent Configuration
- ARR Stack Configuration
- Uptime Kuma
- Homepage

### Backup Required

```text
Recommended
```

### Restore Priority

```text
Priority 2
```

---

## Low Priority

### Services

- AdGuard
- Plex Configuration
- Temporary Application Data

### Backup Required

```text
Optional
```

### Restore Priority

```text
Priority 3
```

---

## Disposable

### Examples

- Docker Images
- Application Caches
- Temporary Downloads
- Thumbnail Caches
- Transcode Caches

### Backup Required

```text
No
```

---

# Backup Schedule

## Critical Services

| Frequency | Retention |
|------------|------------|
| Daily | 30 Days |
| Weekly | 12 Weeks |
| Monthly | 12 Months |

---

## Important Services

| Frequency | Retention |
|------------|------------|
| Weekly | 12 Weeks |
| Monthly | 12 Months |

---

## Low Priority Services

| Frequency | Retention |
|------------|------------|
| Monthly | 12 Months |

---

# VM Backup Strategy

## Proxmox Virtual Machines

### Schedule

```text
Weekly Snapshot
+
Weekly Backup
```

---

### Included VMs

- OpenMediaVault
- Home Assistant
- Future Infrastructure VMs

---

### Storage Location

```text
OpenMediaVault Backup Repository
```

---

# LXC Backup Strategy

## Infrastructure Containers

### Included

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

### Schedule

```text
Weekly
```

---

# Docker Backup Strategy

## Configuration Data

Backup:

```text
Application Configuration
Databases
Persistent Volumes
```

Do Not Backup:

```text
Docker Images
Containers
Transient Data
```

---

# Critical Service Protection

## Immich

### Data Classification

```text
Critical
```

### Backup Requirements

- Daily Local Backup
- Daily Offsite Backup
- Monthly Restore Test

### Notes

Immich stores:

- Family Photos
- Family Videos
- Mobile Phone Backups

Loss of this data may be permanent.

---

## Vaultwarden

### Data Classification

```text
Critical
```

### Backup Requirements

- Daily Local Backup
- Daily Offsite Backup
- Quarterly Restore Test

### Protected Users

- Eric
- Beth
- Amara

---

## Paperless-ngx

### Data Classification

```text
Critical
```

### Backup Requirements

- Daily Local Backup
- Daily Offsite Backup

---

## Nextcloud

### Data Classification

```text
Critical
```

### Backup Requirements

- Daily Local Backup
- Daily Offsite Backup

---

## Home Assistant

### Data Classification

```text
Critical
```

### Backup Requirements

- Weekly VM Backup
- Configuration Backup
- Snapshot Backup

---

## BookStack

### Data Classification

```text
Critical
```

### Backup Requirements

- Daily Database Backup
- Weekly Full Backup

---

# Offsite Backup Strategy

## Destination

```text
OneDrive
```

---

## Eligible Data

### Upload to OneDrive

- Immich Backups
- Vaultwarden Backups
- Paperless Backups
- Nextcloud Backups
- Home Assistant Backups
- BookStack Backups

---

## Excluded Data

Do not upload:

- Plex Media
- Download Cache
- Docker Images
- ARR Media Files
- Temporary Content

---

# Repository Structure

## Local Repository

```text
/storage/backups
│
├── configs
├── databases
├── documents
├── photos
├── vm-backups
└── lxc-backups
```

---

## Offsite Repository

```text
OneDrive
│
├── Immich
├── Vaultwarden
├── Paperless
├── Nextcloud
├── HomeAssistant
└── BookStack
```

---

# Restore Testing

## Schedule

```text
Quarterly
```

---

## Validation Requirements

### Critical Services

Verify:

- Backup Exists
- Backup Integrity
- Restore Procedure
- Application Startup
- Data Availability

---

# Recovery Priority

| Priority | Services |
|----------|----------|
| Priority 1 | Immich |
| Priority 1 | Vaultwarden |
| Priority 1 | Paperless |
| Priority 1 | Nextcloud |
| Priority 1 | Home Assistant |
| Priority 1 | BookStack |
| Priority 2 | Audiobookshelf |
| Priority 2 | ARR Applications |
| Priority 2 | Homepage |
| Priority 2 | Uptime Kuma |
| Priority 3 | AdGuard |
| Priority 3 | Plex Configuration |

---

# Recovery Objectives

| Classification | Target |
|----------|----------|
| Critical | Same Day |
| Important | Within 72 Hours |
| Low | As Time Permits |

---

# Services Excluded From Backup

## Plex Metadata

Decision:

```text
Not Backed Up
```

Reason:

Can be rebuilt and rescanned.

---

## ARR Configurations

Decision:

```text
Not Backed Up
```

Reason:

Can be recreated.

---

# Restore Procedure Overview

## Step 1

Restore infrastructure:

```text
OpenMediaVault
Networking
DNS
```

---

## Step 2

Restore critical services:

```text
Vaultwarden
Immich
Paperless
Nextcloud
Home Assistant
BookStack
```

---

## Step 3

Restore important services:

```text
Audiobookshelf
Homepage
Uptime Kuma
```

---

## Step 4

Restore optional services:

```text
ARR Stack
Plex
```

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Kopia Repository Encryption Keys | TBD |
| Backup Verification Automation | TBD |
| Recovery Drill Automation | TBD |
| Long-Term Archive Strategy | TBD |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Backup and Restore Strategy |