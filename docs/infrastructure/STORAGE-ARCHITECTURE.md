# Storage Architecture

## Purpose

This document defines the storage architecture, storage responsibilities, data classifications, storage locations, and storage strategy for the WoogleNet environment.

The goals of the storage architecture are:

- Centralize persistent storage
- Protect critical data
- Support media services
- Support backup operations
- Simplify recovery procedures
- Minimize storage-related service interruptions

This document should be reviewed before modifying storage layouts, creating new datasets, or deploying storage-dependent services.

---

# Architecture Overview

## Design Principles

1. Critical data must be recoverable.
2. Services should be separated from their data.
3. Rebuildable components should not consume backup resources.
4. Application data should reside on centralized storage whenever practical.
5. Media services should share a common storage structure.
6. Future storage growth should not require architectural redesign.
7. Unknown storage decisions should remain documented as TBD.

---

# Storage Platform

## Primary Storage Platform

| Property | Value |
|-----------|----------|
| Platform | OpenMediaVault |
| Deployment Type | Virtual Machine |
| Host Platform | Proxmox |
| Planned Host | PAX |
| Status | Planned |

---

## Storage Backend

| Property | Value |
|-----------|----------|
| Physical Host | PAX |
| RAID Controller | PERC H700 |
| Disk Count | 12 |
| RAID Layout | TBD |
| Storage Pools | TBD |
| Usable Capacity | TBD |
| Expansion Strategy | TBD |

---

# Storage Tiers

## Tier 1 - Critical Data

Data that would be difficult or impossible to replace.

### Services

- Immich
- Vaultwarden
- Paperless-ngx
- Nextcloud
- BookStack
- Home Assistant

### Backup Requirement

```text
Required
```

### Recovery Priority

```text
Highest
```

---

## Tier 2 - Important Data

Data that is valuable but can be recreated.

### Services

- Audiobookshelf
- Navidrome
- ARR Applications
- Uptime Kuma
- Homepage

### Backup Requirement

```text
Recommended
```

### Recovery Priority

```text
Medium
```

---

## Tier 3 - Rebuildable Data

Services that can be redeployed from source configuration.

### Services

- AdGuard Home
- Docker Containers
- qBittorrent
- Plex Configuration

### Backup Requirement

```text
Recommended
```

### Recovery Priority

```text
Low
```

---

## Tier 4 - Disposable Data

Temporary content that does not require backup.

### Examples

- Docker Images
- Temporary Downloads
- Cache Data
- Thumbnail Caches
- Application Scratch Space

### Backup Requirement

```text
Not Required
```

---

# Storage Layout

## Root Structure

```text
/storage
│
├── appdata
├── backups
├── documents
├── media
├── photos
├── downloads
├── books
├── music
├── homeassistant
└── ai
```

---

# Application Storage

## AppData

Purpose:

```text
Application Configurations
Databases
Persistent Volumes
```

Path:

```text
/storage/appdata
```

---

## Structure

```text
/storage/appdata
│
├── adguard
├── uptime-kuma
├── homepage
├── vaultwarden
├── paperless
├── nextcloud
├── bookstack
├── audiobookshelf
├── navidrome
├── plex
├── sonarr
├── radarr
├── lidarr
├── readarr
├── bazarr
├── prowlarr
├── qbittorrent
└── overseerr
```

---

# Media Storage

## Root

```text
/storage/media
```

Purpose:

- Movies
- Television
- Music
- Audiobooks
- Books

---

## Structure

```text
/storage/media
│
├── movies
├── tv
├── music
├── audiobooks
└── ebooks
```

---

# Downloads

## Root

```text
/storage/downloads
```

Purpose:

ARR stack download processing.

---

## Structure

```text
/storage/downloads
│
├── incomplete
├── complete
└── watch
```

---

## Requirement

All ARR services and qBittorrent must reference a common storage location to support hardlinks.

---

# Photo Storage

## Immich

Path:

```text
/storage/photos
```

Classification:

```text
Critical Data
```

Purpose:

- Mobile backups
- Family photos
- Family videos

---

## Approved Users

- Eric
- Beth
- Amara

---

## Notes

Loss of this data may result in permanent loss of family photographs.

---

# Document Storage

## Paperless-ngx

Path:

```text
/storage/documents
```

Contents:

- Scanned Documents
- PDFs
- Receipts
- Records
- Archive Documents

---

Classification:

```text
Critical Data
```

---

# Backup Storage

## Repository Location

Path:

```text
/storage/backups
```

Purpose:

- Backup Storage
- Restore Testing
- Export Archives

---

## Backup Platform

| Property | Value |
|----------|----------|
| Platform | TBD |
| Repository Size | TBD |
| Retention Policy | TBD |
| Offsite Destination | TBD |

---

# AI Storage

## Local Model Storage

Location:

```text
JAX Local SSD
```

Purpose:

- Ollama Models
- AI Runtime Data
- AI Service Configuration

---

## Long-Term Strategy

| Item | Status |
|----------|----------|
| Model Backup Strategy | TBD |
| Shared AI Storage | TBD |
| Future Expansion | TBD |

---

# Service Storage Assignments

| Service | Storage Location |
|----------|----------|
| AdGuard Home | AppData |
| Homepage | AppData |
| Uptime Kuma | AppData |
| Immich | Photos |
| Audiobookshelf | Media |
| Plex | Media |
| qBittorrent | Downloads |
| Sonarr | Media + Downloads |
| Radarr | Media + Downloads |
| Lidarr | Media + Downloads |
| Readarr | Media + Downloads |
| Bazarr | Media |
| Overseerr | AppData |
| Vaultwarden | AppData |
| Home Assistant | HomeAssistant |
| BookStack | Documents + AppData |
| Paperless-ngx | Documents |
| Nextcloud | Documents |

---

# Storage Growth Strategy

## Current State

| Item | Status |
|----------|----------|
| Final RAID Layout | TBD |
| Final Capacity | TBD |
| Pool Design | TBD |

---

## Planned Growth Areas

- Media Libraries
- Family Photos
- AI Models
- Document Archives
- Backups

---

# Recovery Priorities

| Priority | Services |
|----------|----------|
| Priority 1 | Vaultwarden, Immich, Paperless |
| Priority 2 | Nextcloud, Home Assistant, BookStack |
| Priority 3 | Plex, Audiobookshelf, ARR Stack |
| Priority 4 | Homepage, Uptime Kuma |
| Priority 5 | Rebuildable Services |

---

# Open Decisions

| Decision | Status |
|----------|----------|
| RAID Layout | TBD |
| Storage Pool Layout | TBD |
| Filesystem Selection | TBD |
| Backup Platform | TBD |
| Backup Retention Policy | TBD |
| Offsite Backup Destination | TBD |
| Snapshot Strategy | TBD |
| AI Model Backup Strategy | TBD |

---

# Design Constraints

| Constraint | Notes |
|----------|----------|
| Immich Data | Critical |
| Vaultwarden Data | Critical |
| Home Assistant VM | Requires Backup |
| ARR Hardlinks | Requires Shared Filesystem |
| AI Models | Stored Locally on JAX |
| No Shared Proxmox Storage | Confirmed Design |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Storage Architecture |