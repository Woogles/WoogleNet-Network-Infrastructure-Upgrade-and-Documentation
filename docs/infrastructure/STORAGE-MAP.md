# Storage Map

## Purpose

This document maps storage locations, mount points, application paths, and backup classifications for all approved WoogleNet services.

The goals of this document are to:

- Standardize storage locations
- Simplify backup operations
- Support disaster recovery
- Support service migration
- Prevent path inconsistencies
- Support ARR hardlink requirements

This document should be updated whenever storage paths or service configurations are modified.

---

# Storage Overview

## OpenMediaVault Storage Root

```text
/storage
```

---

## Directory Structure

```text
/storage
│
├── appdata
├── backups
├── documents
├── downloads
├── media
├── photos
├── homeassistant
└── archive
```

---

# Backup Classification

| Classification | Description |
|----------|----------|
| Critical | Must be backed up and validated |
| Important | Backup recommended |
| Low | Backup optional |
| Disposable | No backup required |

---

# Infrastructure Services

## AdGuard Home Primary

| Property | Value |
|----------|----------|
| Host | DAX |
| Platform | LXC |
| Storage Path | /storage/appdata/adguard-primary |
| Backup Class | Important |
| Backup Required | Yes |

### Container Mapping

```text
/storage/appdata/adguard-primary
    →
/opt/adguardhome/work

/storage/appdata/adguard-primary/conf
    →
/opt/adguardhome/conf
```

---

## AdGuard Home Secondary

| Property | Value |
|----------|----------|
| Host | MAX |
| Platform | LXC |
| Storage Path | /storage/appdata/adguard-secondary |
| Backup Class | Important |
| Backup Required | Yes |

---

## Homepage

| Property | Value |
|----------|----------|
| Host | DAX |
| Platform | LXC |
| Storage Path | /storage/appdata/homepage |
| Backup Class | Low |
| Backup Required | Yes |

### Container Mapping

```text
/storage/appdata/homepage
    →
/app/config
```

---

## Uptime Kuma

| Property | Value |
|----------|----------|
| Host | DAX |
| Platform | LXC |
| Storage Path | /storage/appdata/uptime-kuma |
| Backup Class | Important |
| Backup Required | Yes |

### Container Mapping

```text
/storage/appdata/uptime-kuma
    →
/app/data
```

---

# Media Services

## Plex

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Config Path | /storage/appdata/plex |
| Media Path | /storage/media |
| Backup Class | Important |
| Backup Required | Yes |

### Container Mapping

```text
/storage/appdata/plex
    →
/config

/storage/media
    →
/media
```

---

## Audiobookshelf

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Config Path | /storage/appdata/audiobookshelf |
| Library Path | /storage/media/audiobooks |
| Backup Class | Important |
| Backup Required | Yes |

### Container Mapping

```text
/storage/appdata/audiobookshelf
    →
/config

/storage/media/audiobooks
    →
/audiobooks
```

---

## Navidrome

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Config Path | /storage/appdata/navidrome |
| Library Path | /storage/media/music |
| Backup Class | Important |
| Backup Required | Yes |

### Container Mapping

```text
/storage/appdata/navidrome
    →
/data

/storage/media/music
    →
/music
```

---

# Photo Services

## Immich

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Data Path | /storage/photos |
| Backup Class | Critical |
| Backup Required | Yes |

### Container Mapping

```text
/storage/photos
    →
/usr/src/app/upload
```

### Notes

```text
Critical Data

Family Photos
Phone Backups
Videos
```

Approved Users:

- Eric
- Beth
- Amara

---

# Document Services

## Paperless-ngx

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Data Path | /storage/documents/paperless |
| Backup Class | Critical |
| Backup Required | Yes |

### Container Mapping

```text
/storage/documents/paperless/data
    →
/usr/src/paperless/data

/storage/documents/paperless/media
    →
/usr/src/paperless/media

/storage/documents/paperless/export
    →
/usr/src/paperless/export

/storage/documents/paperless/consume
    →
/usr/src/paperless/consume
```

---

## Nextcloud

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Data Path | /storage/documents/nextcloud |
| Backup Class | Critical |
| Backup Required | Yes |

### Container Mapping

```text
/storage/documents/nextcloud
    →
/var/www/html/data
```

---

## BookStack

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Config Path | /storage/appdata/bookstack |
| Backup Class | Critical |
| Backup Required | Yes |

---

## Stirling-PDF

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Data Path | /storage/appdata/stirling-pdf |
| Backup Class | Low |
| Backup Required | Optional |

---

# Security Services

## Vaultwarden

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Data Path | /storage/appdata/vaultwarden |
| Backup Class | Critical |
| Backup Required | Yes |

### Container Mapping

```text
/storage/appdata/vaultwarden
    →
/data
```

### Notes

```text
Critical Family Data
```

Approved Users:

- Eric
- Beth
- Amara

---

# Home Automation

## Home Assistant

| Property | Value |
|----------|----------|
| Host | MAX |
| Platform | VM |
| Data Path | /storage/homeassistant |
| Backup Class | Critical |
| Backup Required | Yes |

---

# ARR Stack

## Shared Storage Requirement

All ARR services must use identical storage paths.

This is required for:

```text
Hardlinks
Atomic Moves
Import Automation
```

---

## Download Root

```text
/storage/downloads
```

### Structure

```text
/storage/downloads
│
├── incomplete
├── complete
└── watch
```

---

## Media Root

```text
/storage/media
```

### Structure

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

## qBittorrent

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Config Path | /storage/appdata/qbittorrent |
| Download Path | /storage/downloads |
| Backup Class | Important |
| Backup Required | Yes |

---

## Prowlarr

| Property | Value |
|----------|----------|
| Host | JAX |
| Storage Path | /storage/appdata/prowlarr |
| Backup Class | Important |

---

## Sonarr

| Property | Value |
|----------|----------|
| Host | JAX |
| Storage Path | /storage/appdata/sonarr |
| Media Path | /storage/media/tv |
| Backup Class | Important |

---

## Radarr

| Property | Value |
|----------|----------|
| Host | JAX |
| Storage Path | /storage/appdata/radarr |
| Media Path | /storage/media/movies |
| Backup Class | Important |

---

## Lidarr

| Property | Value |
|----------|----------|
| Host | JAX |
| Storage Path | /storage/appdata/lidarr |
| Media Path | /storage/media/music |
| Backup Class | Important |

---

## Readarr

| Property | Value |
|----------|----------|
| Host | JAX |
| Storage Path | /storage/appdata/readarr |
| Media Path | /storage/media/ebooks |
| Backup Class | Important |

---

## Bazarr

| Property | Value |
|----------|----------|
| Host | JAX |
| Storage Path | /storage/appdata/bazarr |
| Backup Class | Important |

---

## Overseerr

| Property | Value |
|----------|----------|
| Host | JAX |
| Storage Path | /storage/appdata/overseerr |
| Backup Class | Important |

---

# Backup Repository

## Primary Backup Location

```text
/storage/backups
```

### Structure

```text
/storage/backups
│
├── configs
├── databases
├── documents
├── photos
├── media-metadata
├── vm-backups
└── lxc-backups
```

---

## Backup Platform

| Item | Status |
|----------|----------|
| Backup Software | TBD |
| Retention Policy | TBD |
| Offsite Location | TBD |
| Restore Testing Schedule | TBD |

---

# AI Platform

## Repository

```text
External Project

My_Local_AI_Config
```

---

## Local Model Storage

```text
JAX Local SSD
```

### Notes

AI model storage is intentionally separate from NAS storage.

---

# Storage Allocation Summary

| Area | Class |
|----------|----------|
| Immich | Critical |
| Vaultwarden | Critical |
| Paperless | Critical |
| Nextcloud | Critical |
| Home Assistant | Critical |
| BookStack | Critical |
| Plex | Important |
| Audiobookshelf | Important |
| ARR Stack | Important |
| Homepage | Low |
| Uptime Kuma | Important |
| Stirling-PDF | Low |

---

# Open Decisions

| Decision | Status |
|----------|----------|
| RAID Layout | TBD |
| Filesystem | TBD |
| Backup Platform | TBD |
| Offsite Backup Target | TBD |
| Snapshot Strategy | TBD |
| AI Model Backup Strategy | TBD |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Storage Map |