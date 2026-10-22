# Media Services

## Purpose

This document defines the media platform architecture used within the WoogleNet environment.

The goals of the media platform are:

- Centralize media management
- Support family media consumption
- Automate media acquisition
- Manage music libraries
- Manage audiobook libraries
- Simplify media discovery
- Minimize ongoing maintenance

This document focuses specifically on media-related services and their relationships.

---

# Media Platform Overview

## Architecture

```text
Users
   │
   ▼
Overseerr
   │
   ▼
ARR Stack
   │
   ▼
qBittorrent
   │
   ▼
Downloads
   │
   ▼
Media Libraries
   │
   ▼
Plex
Audiobookshelf
Navidrome
```

---

# Platform Objectives

## Primary Goals

- Family Media Access
- Audiobook Access
- Music Library Access
- Automated Library Management
- Centralized Metadata Management

---

## Secondary Goals

- Self-Service Requests
- Multi-User Support
- Future Media Expansion

---

# Hosting Strategy

## Primary Host

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Storage Location | OpenMediaVault |
| Status | Planned |

---

## Supporting Infrastructure

| Service | Host |
|----------|----------|
| OpenMediaVault | PAX |
| AdGuard | DAX / MAX |
| Tailscale | All Hosts |
| Uptime Kuma | DAX |

---

# Media Services

## Plex

### Purpose

Primary family media platform.

### Functions

- Movie Streaming
- TV Streaming
- Metadata Management
- Remote Streaming
- User Libraries

### Criticality

```text
Important
```

### Deployment Phase

```text
Day 1
```

### Storage Paths

```text
/storage/media/movies

/storage/media/tv
```

---

### Approved Users

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

### Access Methods

| Method | Supported |
|----------|----------|
| Local Network | Yes |
| Tailscale | Yes |
| Internet | Yes |

---

## Audiobookshelf

### Purpose

Audiobook and podcast platform.

### Functions

- Audiobook Streaming
- Podcast Management
- User Progress Tracking

### Criticality

```text
Important
```

### Deployment Phase

```text
Day 1
```

### Storage Path

```text
/storage/media/audiobooks
```

---

### Approved Users

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

### Access Methods

| Method | Supported |
|----------|----------|
| Local Network | Yes |
| Tailscale | Yes |
| Internet | No |

---

## Navidrome

### Purpose

Music streaming platform.

### Functions

- Music Library
- Playlist Management
- Mobile Streaming

### Criticality

```text
Important
```

### Deployment Phase

```text
Day 2
```

### Storage Path

```text
/storage/media/music
```

---

## Tautulli

### Purpose

Plex analytics and monitoring.

### Functions

- User Statistics
- Playback Analytics
- Historical Reporting

### Criticality

```text
Low
```

### Deployment Phase

```text
Day 2
```

### Dependencies

```text
Plex
```

---

## MeTube

### Purpose

Media download utility.

### Functions

- Video Downloads
- Audio Downloads
- Conversion Workflows

### Criticality

```text
Low
```

### Deployment Phase

```text
Day 2
```

---

# Media Automation Platform

## Overview

The ARR stack is responsible for:

- Request Processing
- Discovery
- Download Management
- Library Updates
- Metadata Updates

---

## qBittorrent

### Purpose

Primary download client.

### Criticality

```text
Important
```

### Storage Path

```text
/storage/downloads
```

---

## Prowlarr

### Purpose

Indexer management.

### Responsibilities

- Indexer Management
- ARR Integration

### Criticality

```text
Important
```

---

## Sonarr

### Purpose

Television automation.

### Library

```text
/storage/media/tv
```

---

## Radarr

### Purpose

Movie automation.

### Library

```text
/storage/media/movies
```

---

## Lidarr

### Purpose

Music automation.

### Library

```text
/storage/media/music
```

---

## Readarr

### Purpose

Book automation.

### Library

```text
/storage/media/ebooks
```

---

## Bazarr

### Purpose

Subtitle management.

### Functions

- Subtitle Discovery
- Subtitle Synchronization

---

## Overseerr

### Purpose

User request platform.

### Functions

- Media Requests
- Approval Workflow
- ARR Integration

### Criticality

```text
Important
```

---

# Storage Architecture

## Media Root

```text
/storage/media
```

---

## Directory Structure

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

## Download Structure

```text
/storage/downloads
│
├── incomplete
├── complete
└── watch
```

---

# Hardlink Requirements

## Design Decision

All ARR services must reference identical paths.

Purpose:

```text
Hardlinks

Atomic Moves

Efficient Storage Management
```

---

# Service Relationships

## Request Workflow

```text
User
   │
   ▼
Overseerr
   │
   ▼
Sonarr / Radarr
   │
   ▼
Prowlarr
   │
   ▼
qBittorrent
   │
   ▼
Storage
   │
   ▼
Plex
```

---

## Audiobook Workflow

```text
Storage
    │
    ▼
Audiobookshelf
    │
    ▼
Users
```

---

## Music Workflow

```text
Storage
    │
    ▼
Navidrome
    │
    ▼
Users
```

---

# Monitoring Requirements

## Uptime Kuma

Monitor:

- Plex
- Audiobookshelf
- Navidrome
- Overseerr
- qBittorrent
- Sonarr
- Radarr
- Prowlarr

---

## Alert Priority

| Service | Priority |
|----------|----------|
| Plex | Important |
| Audiobookshelf | Important |
| Navidrome | Important |
| ARR Services | Low |
| Tautulli | Low |
| MeTube | Low |

---

# Backup Requirements

## Backup Required

- Audiobookshelf Configuration
- Navidrome Configuration
- qBittorrent Configuration
- Plex Configuration (Optional)

---

## Not Backed Up

### Media Content

Reason:

```text
Media Libraries Can Be Rebuilt
```

---

## Not Backed Up

### ARR Configuration

Decision:

```text
Not Required
```

Reference:

```text
SERVICE-DECISIONS.md
```

---

# Optional Services

## Jellyfin

### Status

```text
Optional
```

### Current State

Under evaluation.

### Notes

Plex remains the primary platform because:

- Family familiarity
- Existing usage
- Lower migration effort

---

# Future Expansion

## Potential Additions

- Kometa
- ErsatzTV
- Additional Media Libraries
- Additional Music Services

Status:

```text
Research
```

---

# Related Documents

- SERVICE-INVENTORY.md
- SERVICE-DEPENDENCIES.md
- STORAGE-ARCHITECTURE.md
- STORAGE-MAP.md
- MONITORING-AND-ALERTING.md
- SERVICE-DECISIONS.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Media Services Documentation |