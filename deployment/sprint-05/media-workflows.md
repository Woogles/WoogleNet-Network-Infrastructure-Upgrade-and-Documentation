# Media Workflows

## Purpose

This document defines the media acquisition, organization, storage, and consumption workflows for the WoogleNet media platform.

The objectives are to:

- Standardize media management
- Eliminate duplicate storage
- Define authoritative storage locations
- Ensure proper application ownership
- Support future ARR integration
- Support backup and recovery procedures

Reference:

- storage-layout.md
- storage-integration.md
- backup-standard.md

---

# Media Architecture

## Media Services

```text
jax-plex
jax-audiobookshelf
jax-immich
```

---

## Future Services

```text
jax-sonarr
jax-radarr
jax-lidarr
jax-readarr
jax-prowlarr
jax-qbittorrent
```

---

## Storage Platform

```text
pax-omv
```

---

# Authoritative Storage Locations

## Movies

```text
/storage/media/movies
```

Owner:

```text
Radarr
```

Consumer:

```text
Plex
```

---

## Television Shows

```text
/storage/media/tv
```

Owner:

```text
Sonarr
```

Consumer:

```text
Plex
```

---

## Music

```text
/storage/media/music
```

Owner:

```text
Lidarr
```

Consumers:

```text
Navidrome
Plex
```

---

## Audiobooks

```text
/storage/media/audiobooks
```

Owner:

```text
Manual Import
```

Consumers:

```text
Audiobookshelf
```

---

## Photos

```text
/storage/media/photos
```

Owner:

```text
Immich
```

Consumer:

```text
Immich
```

---

## Home Videos

```text
/storage/media/home-videos
```

Owner:

```text
Manual Import
```

Consumer:

```text
Plex
```

---

# Movie Workflow

## Source

```text
qBittorrent
```

---

## Download Location

```text
/storage/downloads/complete
```

---

## Processing

```text
Radarr
```

---

## Destination

```text
/storage/media/movies
```

---

## Consumption

```text
Plex
```

---

## Workflow

```text
Request

→ Download

→ Process

→ Organize

→ Library Scan

→ Stream
```

---

# TV Workflow

## Source

```text
qBittorrent
```

---

## Download Location

```text
/storage/downloads/complete
```

---

## Processing

```text
Sonarr
```

---

## Destination

```text
/storage/media/tv
```

---

## Consumption

```text
Plex
```

---

## Workflow

```text
Request

→ Download

→ Process

→ Organize

→ Library Scan

→ Stream
```

---

# Music Workflow

## Source

```text
Manual Import

Future Lidarr Workflow
```

---

## Destination

```text
/storage/media/music
```

---

## Consumers

```text
Navidrome

Plex
```

---

## Workflow

```text
Import

→ Metadata

→ Library Scan

→ Playback
```

---

# Audiobook Workflow

## Import

```text
Manual
```

---

## Destination

```text
/storage/media/audiobooks
```

---

## Consumer

```text
Audiobookshelf
```

---

## Workflow

```text
Import

→ Metadata Scan

→ Library Build

→ Streaming
```

---

# Photo Workflow

## Source

```text
Mobile Devices

Web Uploads
```

---

## Destination

```text
/storage/media/photos
```

---

## Owner

```text
Immich
```

---

## Workflow

```text
Upload

→ Index

→ AI Processing

→ Search

→ Viewing

→ Backup
```

---

# Home Video Workflow

## Source

```text
Mobile Devices

Video Cameras

Manual Imports
```

---

## Destination

```text
/storage/media/home-videos
```

---

## Consumer

```text
Plex
```

---

## Workflow

```text
Import

→ Organize

→ Metadata

→ Library Scan

→ Playback
```

---

# Download Workflow

## Temporary Storage

```text
/storage/downloads
```

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

## Ownership

```text
qBittorrent
```

---

## Data Retention

```text
Temporary
```

Media should be moved into final libraries after processing.

---

# Plex Workflow

## Configuration

```text
/storage/appdata/plex
```

---

## Library Access

```text
/storage/media
```

Access:

```text
Read Only
```

---

## Responsibilities

```text
Metadata

Transcoding

Library Organization

Streaming
```

---

# Audiobookshelf Workflow

## Configuration

```text
/storage/appdata/audiobookshelf
```

---

## Library Access

```text
/storage/media/audiobooks
```

Access:

```text
Read Only
```

---

## Responsibilities

```text
Metadata

Progress Tracking

Streaming

Collections
```

---

# Immich Workflow

## Configuration

```text
/storage/appdata/immich
```

---

## Library Access

```text
/storage/media/photos
```

Access:

```text
Read/Write
```

---

## Responsibilities

```text
Photo Uploads

Indexing

Thumbnails

Face Recognition

Search

Albums
```

---

# Storage Ownership Rules

## Rule 1

Only one service owns write access to content.

---

## Rule 2

Consumers receive read-only access whenever possible.

---

## Rule 3

Application data must remain in:

```text
/storage/appdata
```

---

## Rule 4

Media files must remain in:

```text
/storage/media
```

---

## Rule 5

Downloads remain in:

```text
/storage/downloads
```

until processing completes.

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Required

```text
/storage/appdata
```

---

## Required

```text
Immich Database

Audiobookshelf Metadata

Plex Configuration
```

---

## Optional

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

- Plex Availability
- Audiobookshelf Availability
- Immich Availability
- Media Capacity
- Photo Capacity
- Download Capacity

---

# Validation Checklist

## Movies

- [ ] Download Workflow Functional
- [ ] Plex Detects Movies

---

## TV

- [ ] Download Workflow Functional
- [ ] Plex Detects Shows

---

## Music

- [ ] Navidrome Detects Music
- [ ] Plex Detects Music

---

## Audiobooks

- [ ] Audiobookshelf Detects Library
- [ ] Playback Functional

---

## Photos

- [ ] Immich Upload Functional
- [ ] Search Functional
- [ ] Library Accessible

---

## Storage

- [ ] Read-Only Access Applied
- [ ] Read/Write Access Applied
- [ ] No Duplicate Libraries

---

# ARR Integration Architecture

## Purpose

This document defines the integration architecture for the ARR stack within the WoogleNet environment.

The goals are to:

- Automate media acquisition
- Standardize media processing
- Eliminate duplicate storage
- Maintain clean library structures
- Support Plex integration
- Support future automation

This architecture applies to:

```text
jax-qbittorrent
jax-prowlarr
jax-sonarr
jax-radarr
jax-lidarr
jax-readarr
jax-overseerr
```

---

# Architecture Overview

```text
Overseerr
    │
    ▼
Prowlarr
    │
    ▼
Indexers
    │
    ▼
Sonarr / Radarr / Lidarr / Readarr
    │
    ▼
qBittorrent
    │
    ▼
/storage/downloads
    │
    ▼
Media Processing
    │
    ▼
/storage/media
    │
    ▼
Plex
```

---

# Service Roles

## jax-overseerr

Purpose:

```text
Request Management
```

Responsibilities:

- User Requests
- Request Approval
- Plex Integration
- ARR Integration

---

## jax-prowlarr

Purpose:

```text
Indexer Management
```

Responsibilities:

- Indexer Definitions
- ARR Synchronization
- Search Aggregation

---

## jax-qbittorrent

Purpose:

```text
Download Client
```

Responsibilities:

- Torrent Downloads
- Download Queue
- Download Storage

---

## jax-sonarr

Purpose:

```text
TV Management
```

Responsibilities:

- TV Library Management
- Episode Monitoring
- Import Automation

---

## jax-radarr

Purpose:

```text
Movie Management
```

Responsibilities:

- Movie Monitoring
- Import Automation
- Quality Management

---

## jax-lidarr

Purpose:

```text
Music Management
```

Responsibilities:

- Music Monitoring
- Metadata Management
- Library Automation

---

## jax-readarr

Purpose:

```text
Book Management
```

Responsibilities:

- Book Monitoring
- Acquisition Automation
```

---

# Storage Mapping

## qBittorrent

### Config

```text
/storage/appdata/qbittorrent
```

---

### Downloads

```text
/storage/downloads
```

---

### Mounts

```yaml
volumes:
  - /storage/appdata/qbittorrent:/config
  - /storage/downloads:/downloads
```

---

# Sonarr

## Config

```text
/storage/appdata/sonarr
```

---

## Downloads

```text
/storage/downloads
```

---

## Media

```text
/storage/media/tv
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/sonarr:/config
  - /storage/downloads:/downloads
  - /storage/media/tv:/tv
```

---

# Radarr

## Config

```text
/storage/appdata/radarr
```

---

## Downloads

```text
/storage/downloads
```

---

## Media

```text
/storage/media/movies
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/radarr:/config
  - /storage/downloads:/downloads
  - /storage/media/movies:/movies
```

---

# Lidarr

## Config

```text
/storage/appdata/lidarr
```

---

## Downloads

```text
/storage/downloads
```

---

## Media

```text
/storage/media/music
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/lidarr:/config
  - /storage/downloads:/downloads
  - /storage/media/music:/music
```

---

# Readarr

## Config

```text
/storage/appdata/readarr
```

---

## Downloads

```text
/storage/downloads
```

---

## Books

```text
/storage/media/books
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/readarr:/config
  - /storage/downloads:/downloads
  - /storage/media/books:/books
```

---

# Prowlarr

## Config

```text
/storage/appdata/prowlarr
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/prowlarr:/config
```

---

# Overseerr

## Config

```text
/storage/appdata/overseerr
```

---

## Mounts

```yaml
volumes:
  - /storage/appdata/overseerr:/config
```

---

# Download Workflow

## Temporary Storage

```text
/storage/downloads
```

Structure:

```text
/storage/downloads
│
├── incomplete
├── complete
├── imports
└── torrents
```

---

## Ownership

```text
jax-qbittorrent
```

---

## Retention

Files should remain only until imported by the appropriate ARR service.

---

# Hardlink Configuration

## Required

Enable hardlinks within:

```text
/storage
```

Benefits:

- Instant imports
- Reduced disk usage
- No copy operations
- Faster library updates

---

## Requirement

Downloads and media libraries must exist on the same filesystem.

---

# Library Ownership

| Path | Owner |
|----------|----------|
| /storage/media/movies | jax-radarr |
| /storage/media/tv | jax-sonarr |
| /storage/media/music | jax-lidarr |
| /storage/media/books | jax-readarr |
| /storage/media/photos | jax-immich |
| /storage/media/audiobooks | Manual Import |

---

# Plex Integration

## Read-Only Access

Plex receives:

```text
Read Only Access
```

---

## Media Paths

```text
/storage/media/movies
/storage/media/tv
/storage/media/music
/storage/media/photos
/storage/media/home-videos
```

---

## Plex Responsibilities

```text
Metadata

Streaming

Transcoding

Collections
```

---

# Overseerr Workflow

```text
User Request
     │
     ▼
Overseerr
     │
     ▼
Radarr/Sonarr
     │
     ▼
qBittorrent
     │
     ▼
Import
     │
     ▼
Plex
```

---

# Security Model

## Read/Write Access

```text
qBittorrent
Sonarr
Radarr
Lidarr
Readarr
Immich
```

---

## Read-Only Access

```text
Plex
Navidrome
Audiobookshelf
```

---

## No Access

```text
/storage/backups
```

must never be mounted into ARR containers.

---

# Monitoring Requirements

Monitor:

```text
jax-qbittorrent
jax-prowlarr
jax-sonarr
jax-radarr
jax-lidarr
jax-readarr
jax-overseerr
```

Checks:

- Ping
- HTTP/HTTPS
- Download Queue Health
- Disk Utilization

---

# Backup Requirements

Required:

```text
/storage/appdata/qbittorrent
/storage/appdata/prowlarr
/storage/appdata/sonarr
/storage/appdata/radarr
/storage/appdata/lidarr
/storage/appdata/readarr
/storage/appdata/overseerr
```

---

Optional:

```text
/media
```

depending on media recovery strategy.

---

# Required Storage Layout Update

Add:

```text
/storage/media/books
```

to:

```text
storage-layout.md
```

for Readarr support.

---

# Success Criteria

ARR integration is complete when:

- Requests flow through Overseerr
- Indexers are managed by Prowlarr
- Downloads complete successfully
- Hardlinks function correctly
- Media imports automatically
- Plex detects new content
- Monitoring is operational
- Backups are configured

# Success Criteria

Media workflows are complete when:

- All media paths exist
- Media ownership is defined
- Consumers access the correct paths
- Monitoring is configured
- Backup requirements are defined
- Validation tests pass

---

# Related Documents

- README.md
- storage-integration.md
- jax-plex.md
- jax-audiobookshelf.md
- jax-immich.md
- ../sprint-04/storage-layout.md
- ../sprint-04/pax-omv.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Media Workflow Architecture |