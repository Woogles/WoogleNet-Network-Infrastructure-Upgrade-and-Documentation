# Storage Layout

## Purpose

This document defines the authoritative storage architecture for the WoogleNet environment.

The goals of this storage design are to:

- Standardize storage organization
- Separate application data from user data
- Simplify permissions management
- Support application deployments
- Support SMB sharing
- Support backup and recovery operations
- Support monitoring and capacity planning
- Minimize future migrations

All storage deployed through OpenMediaVault must comply with this document.

---

# Path Convention

All documentation shall reference the logical storage root:

```text
/storage
```

The actual OpenMediaVault mount point is implementation-specific and documented only in:

```text
pax-omv.md
```

All sprint documentation, deployment guides, monitoring, backup procedures, and standards documents must use logical storage paths.

---

# Storage Root

```text
/storage
```

---

# Authoritative Layout

```text
/storage
│
├── appdata/
├── backups/
├── media/
├── documents/
├── downloads/
├── archives/
├── shares/
└── staging/
```

---

# Full Directory Structure

```text
/storage
│
├── appdata
│   ├── immich
│   ├── paperless
│   ├── nextcloud
│   ├── vaultwarden
│   ├── bookstack
│   ├── homeassistant
│   ├── navidrome
│   ├── plex
│   ├── audiobookshelf
│   └── shared
│
├── backups
│   ├── proxmox
│   ├── lxcs
│   ├── vms
│   ├── configs
│   ├── databases
│   ├── kopia
│   ├── restores
│   └── exports
│
├── media
│   ├── movies
│   ├── tv
│   ├── music
│   ├── audiobooks
│   ├── photos
│   ├── home-videos
│   └── recordings
│
├── documents
│   ├── personal
│   ├── shared
│   ├── scans
│   └── exports
│
├── downloads
│   ├── incomplete
│   ├── complete
│   ├── imports
│   └── torrents
│
├── archives
│   ├── yearly
│   ├── exports
│   ├── retired-services
│   └── snapshots
│
├── shares
│   ├── family
│   ├── public
│   └── teams
│
└── staging
```

---

# Application Data Storage

## Root Path

```text
/storage/appdata
```

---

## Purpose

Stores persistent application data and service configuration.

Application data should never be directly exposed through SMB shares.

---

## Structure

| Directory | Service |
|------------|------------|
| /storage/appdata/immich | jax-immich |
| /storage/appdata/paperless | jax-paperless |
| /storage/appdata/nextcloud | jax-nextcloud |
| /storage/appdata/vaultwarden | jax-vaultwarden |
| /storage/appdata/bookstack | jax-bookstack |
| /storage/appdata/homeassistant | max-homeassistant |
| /storage/appdata/navidrome | jax-navidrome |
| /storage/appdata/plex | jax-plex |
| /storage/appdata/audiobookshelf | jax-audiobookshelf |
| /storage/appdata/shared | Shared Service Data |

---

# Backup Storage

## Root Path

```text
/storage/backups
```

---

## Purpose

Stores backup repositories and recovery assets.

---

## Structure

```text
/storage/backups
│
├── proxmox
├── lxcs
├── vms
├── configs
├── databases
├── kopia
├── restores
└── exports
```

---

## Classification

```text
Tier 1 Critical
```

---

## Consumers

```text
Proxmox

Kopia

Application Backup Jobs

Recovery Procedures
```

---

# Media Storage

## Root Path

```text
/storage/media
```

---

## Purpose

Stores primary media libraries.

---

## Structure

| Directory | Consumer |
|------------|------------|
| /storage/media/movies | jax-plex |
| /storage/media/tv | jax-plex |
| /storage/media/music | jax-navidrome, jax-plex |
| /storage/media/audiobooks | jax-audiobookshelf |
| /storage/media/photos | jax-immich |
| /storage/media/home-videos | jax-plex |
| /storage/media/recordings | Future Use |

---

# Documents Storage

## Root Path

```text
/storage/documents
```

---

## Purpose

Stores user-managed documents.

This storage is independent of application-specific data.

---

## Structure

```text
/storage/documents
│
├── personal
├── shared
├── scans
└── exports
```

---

## Consumers

```text
Users

Windows Clients

Mac Clients

Nextcloud
```

---

# Downloads Storage

## Root Path

```text
/storage/downloads
```

---

## Purpose

Temporary ARR stack workflow and content acquisition.

---

## Structure

```text
/storage/downloads
│
├── incomplete
├── complete
├── imports
└── torrents
```

---

## Consumers

```text
jax-qbittorrent

jax-sonarr

jax-radarr

jax-lidarr

jax-readarr
```

---

# Archive Storage

## Root Path

```text
/storage/archives
```

---

## Purpose

Long-term retained data and historical exports.

---

## Structure

```text
/storage/archives
│
├── yearly
├── exports
├── retired-services
└── snapshots
```

---

# Shared User Storage

## Root Path

```text
/storage/shares
```

---

## Purpose

Provides user-facing SMB shares.

Application data should never be exposed directly through SMB.

---

## Structure

```text
/storage/shares
│
├── family
├── public
└── teams
```

---

## Consumers

```text
Windows Clients

Mac Clients

Administrative Workstations
```

---

# Staging Storage

## Root Path

```text
/storage/staging
```

---

## Purpose

Temporary workspace for:

```text
Large Imports

Bulk Transfers

Restore Testing

Migration Projects
```

---

## Retention Policy

```text
Temporary Only
```

---

# Service Mapping

| Service | Primary Storage Path |
|------------|------------|
| pax-omv | /storage |
| jax-immich | /storage/media/photos |
| jax-paperless | /storage/appdata/paperless |
| jax-nextcloud | /storage/documents/shared |
| jax-vaultwarden | /storage/appdata/vaultwarden |
| jax-bookstack | /storage/appdata/bookstack |
| max-homeassistant | /storage/appdata/homeassistant |
| jax-navidrome | /storage/media/music |
| jax-audiobookshelf | /storage/media/audiobooks |
| jax-plex | /storage/media |

---
# Service Storage Mounts

## Purpose

This section defines the required storage mounts for each service.

Every service should have:

```text
Config/Data Storage

Content Storage (if applicable)

Read/Write Scope Limited To Required Paths
```

---

# jax-immich

## Config/Data

```text
/storage/appdata/immich
```

Access:

```text
Read/Write
```

---

## Photo Library

```text
/storage/media/photos
```

Access:

```text
Read/Write
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/immich:/config
  - /storage/media/photos:/photos
```

---

# jax-paperless

## Config/Data

```text
/storage/appdata/paperless
```

Access:

```text
Read/Write
```

---

## Document Ingest

```text
/storage/documents/scans
```

Access:

```text
Read/Write
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/paperless:/usr/src/paperless/data
  - /storage/documents/scans:/usr/src/paperless/consume
```

---

# jax-nextcloud

## Config/Data

```text
/storage/appdata/nextcloud
```

Access:

```text
Read/Write
```

---

## User Files

```text
/storage/shares
```

Access:

```text
Read/Write
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/nextcloud:/var/www/html
  - /storage/shares:/data
```

---

# jax-vaultwarden

## Config/Data

```text
/storage/appdata/vaultwarden
```

Access:

```text
Read/Write
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/vaultwarden:/data
```

---

# jax-bookstack

## Config/Data

```text
/storage/appdata/bookstack
```

Access:

```text
Read/Write
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/bookstack:/config
```

---

# max-homeassistant

## Config/Data

```text
/storage/appdata/homeassistant
```

Access:

```text
Read/Write
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/homeassistant:/config
```

---

# jax-navidrome

## Config/Data

```text
/storage/appdata/navidrome
```

Access:

```text
Read/Write
```

---

## Music Library

```text
/storage/media/music
```

Access:

```text
Read Only
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/navidrome:/data
  - /storage/media/music:/music:ro
```

---

# jax-audiobookshelf

## Config/Data

```text
/storage/appdata/audiobookshelf
```

Access:

```text
Read/Write
```

---

## Audiobook Library

```text
/storage/media/audiobooks
```

Access:

```text
Read Only
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/audiobookshelf:/config
  - /storage/media/audiobooks:/audiobooks:ro
```

---

# jax-plex

## Config/Data

```text
/storage/appdata/plex
```

Access:

```text
Read/Write
```

---

## Media Libraries

```text
/storage/media/movies
/storage/media/tv
/storage/media/music
/storage/media/audiobooks
/storage/media/photos
/storage/media/home-videos
```

Access:

```text
Read Only
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/plex:/config
  - /storage/media:/media:ro
```

---

# jax-qbittorrent

## Config/Data

```text
/storage/appdata/qbittorrent
```

Access:

```text
Read/Write
```

---

## Downloads

```text
/storage/downloads
```

Access:

```text
Read/Write
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/qbittorrent:/config
  - /storage/downloads:/downloads
```

---

# ARR Applications

## Services

```text
jax-sonarr
jax-radarr
jax-lidarr
jax-readarr
jax-prowlarr
```

---

## Config/Data

```text
/storage/appdata/<service>
```

Access:

```text
Read/Write
```

---

## Downloads

```text
/storage/downloads
```

Access:

```text
Read/Write
```

---

## Media Libraries

```text
/storage/media
```

Access:

```text
Read/Write
```

---

## Example Mounts

```yaml
volumes:
  - /storage/appdata/sonarr:/config
  - /storage/downloads:/downloads
  - /storage/media:/media
```

---

# Security Requirements

## Read Only Where Possible

Media consumers should receive:

```text
Read Only
```

access whenever they do not need write capability.

Examples:

```text
Plex

Navidrome

Audiobookshelf
```

---

## Read/Write Access

Only services that manage content should receive:

```text
Read/Write
```

Examples:

```text
Immich

Paperless

Nextcloud

Sonarr

Radarr

qBittorrent
```

---

# Validation Checklist

- [ ] Every Service Has Dedicated AppData
- [ ] Media Consumers Mounted Read Only
- [ ] Application Data Separated From Content
- [ ] Downloads Shared Only With ARR Stack
- [ ] Backup Paths Excluded From Service Mounts
- [ ] No Service Has Unnecessary Access

# Permissions Strategy

## Principle

```text
Least Privilege
```

---

## Example Access

### jax-immich

Allowed:

```text
/storage/media/photos
/storage/appdata/immich
```

Denied:

```text
/storage/backups
/storage/documents
```

---

### jax-paperless

Allowed:

```text
/storage/appdata/paperless
/storage/documents/scans
```

Denied:

```text
/storage/media
/storage/backups
```

---

### jax-vaultwarden

Allowed:

```text
/storage/appdata/vaultwarden
```

Denied:

```text
/storage/media
/storage/downloads
/storage/shares
```

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Required Protection

```text
/storage/appdata

/storage/documents

/storage/backups/configs

/storage/backups/databases
```

---

## Optional Protection

```text
/storage/media
```

Depending on media recovery strategy.

---

# Monitoring Requirements

Reference:

```text
monitoring-standard.md
```

Monitor:

- Storage Utilization
- Growth Trends
- Share Availability
- Repository Availability
- Backup Capacity

---

## Capacity Thresholds

### Warning

```text
80%
```

### Critical

```text
90%
```

### Emergency

```text
95%
```

---

# Future Expansion

Reserved Directories:

```text
/storage/ai

/storage/vms

/storage/lab
```

Create only when required.

---

# Validation Checklist

- [ ] Root Structure Created
- [ ] AppData Paths Created
- [ ] Backup Paths Created
- [ ] Media Paths Created
- [ ] Documents Paths Created
- [ ] Downloads Paths Created
- [ ] Archives Paths Created
- [ ] Share Paths Created
- [ ] Staging Path Created
- [ ] Permissions Applied
- [ ] Monitoring Configured
- [ ] Capacity Alerts Configured

---

# Related Documents

- README.md
- pax-omv.md
- smb-shares.md
- backup-repository.md
- ../standards/naming-standard.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md
- ../standards/network-security-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 3.0 | 2026-10-22 | Eric Yacoub | Refactored storage architecture to separate application data, shared user data, media, backups, and SMB-facing storage |