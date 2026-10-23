# Storage Integration

## Purpose

This document defines how Sprint 05 media services integrate with the centralized storage platform provided by:

```text
pax-omv
```

The goals of storage integration are to:

- Provide centralized media storage
- Separate application data from content
- Minimize duplicate data
- Support future growth
- Support backup and recovery
- Maintain least-privilege access

Reference:

- storage-layout.md
- smb-shares.md
- pax-omv.md

---

# Architecture Overview

## Storage Platform

Provider:

```text
pax-omv
```

---

## Consumer Hosts

```text
jax
```

Provides:

```text
jax-plex

jax-audiobookshelf

jax-immich
```

---

## Access Method

Preferred:

```text
NFS
```

---

## Alternative

```text
SMB
```

For platforms that require it.

---

# Integration Principles

## Principle 1

Application configuration and content must be separated.

---

## Principle 2

Media consumers should receive read-only access whenever possible.

---

## Principle 3

Each service receives only the storage it requires.

---

## Principle 4

Media files exist in only one location.

---

# Storage Allocation

## jax-plex

### Application Data

```text
/storage/appdata/plex
```

Access:

```text
Read/Write
```

---

### Media Libraries

```text
/storage/media
```

Access:

```text
Read Only
```

---

### Mounts

```yaml
volumes:
  - /storage/appdata/plex:/config
  - /storage/media:/media:ro
```

---

# jax-audiobookshelf

## Application Data

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

# jax-immich

## Application Data

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

# Future Service Integrations

## jax-navidrome

### Application Data

```text
/storage/appdata/navidrome
```

---

### Library

```text
/storage/media/music
```

---

### Access

```text
Read Only
```

---

## ARR Stack

### Application Data

```text
/storage/appdata/<service>
```

---

### Downloads

```text
/storage/downloads
```

---

### Media Libraries

```text
/storage/media
```

---

### Access

```text
Read/Write
```

---

# NFS Exports

## Media Export

Path:

```text
/storage/media
```

Purpose:

```text
Media Consumption
```

Consumers:

```text
jax-plex
```

---

## Audiobooks Export

Path:

```text
/storage/media/audiobooks
```

Consumers:

```text
jax-audiobookshelf
```

---

## Photos Export

Path:

```text
/storage/media/photos
```

Consumers:

```text
jax-immich
```

---

## AppData Export

Path:

```text
/storage/appdata
```

Consumers:

```text
Authorized Services Only
```

---

# Permission Model

## Read Only

Applies To:

```text
jax-plex

jax-audiobookshelf

jax-navidrome
```

---

## Read/Write

Applies To:

```text
jax-immich

jax-sonarr

jax-radarr

jax-lidarr

jax-readarr

jax-qbittorrent
```

---

# Capacity Planning

## Media

Monitor:

```text
/storage/media
```

---

## Photos

Monitor:

```text
/storage/media/photos
```

---

## AppData

Monitor:

```text
/storage/appdata
```

---

## Thresholds

Warning:

```text
80%
```

---

Critical:

```text
90%
```

---

Emergency:

```text
95%
```

---

# Monitoring Integration

Reference:

```text
monitoring-standard.md
```

---

Monitor:

- Storage Availability
- NFS Availability
- Capacity Utilization
- Growth Trends

---

# Backup Integration

Reference:

```text
backup-standard.md
```

---

## Required Backup

```text
/storage/appdata
```

---

## Required Backup

```text
/storage/backups/configs
```

---

## Optional Backup

```text
/storage/media
```

Based on media recovery strategy.

---

# Validation Checklist

## Storage Access

- [ ] jax-plex Accesses Media
- [ ] jax-audiobookshelf Accesses Audiobooks
- [ ] jax-immich Accesses Photos

---

## Permissions

- [ ] Read-Only Access Applied
- [ ] Read/Write Access Applied
- [ ] Least Privilege Enforced

---

## Mounts

- [ ] Application Data Mounted
- [ ] Content Data Mounted
- [ ] No Cross-Service Access

---

## Monitoring

- [ ] Capacity Monitoring Enabled
- [ ] Availability Monitoring Enabled

---

## Backups

- [ ] AppData Included
- [ ] Repository Included

---

# Success Criteria

Storage integration is complete when:

- All services mount required storage
- Permissions are correct
- Monitoring is configured
- Backup policies are applied
- Validation tests pass

---

# Related Documents

- README.md
- storage-layout.md
- smb-shares.md
- backup-repository.md
- jax-plex.md
- jax-audiobookshelf.md
- jax-immich.md
- ../sprint-04/pax-omv.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Storage Integration Design |