# Sprint 05 - Day 1 Services

## Sprint Information

| Property | Value |
|----------|----------|
| Sprint ID | Sprint 05 |
| Name | Day 1 Services |
| Status | Planned |
| Priority | High |
| Estimated Duration | 1-2 Weeks |
| Owner | Eric Yacoub |

---

# Sprint Goal

Deploy the first production application services for WoogleNet.

This sprint establishes:

- JAX Application Platform
- Docker Environment
- Plex
- Audiobookshelf
- Immich

At completion, family-facing services become available and the first critical user workloads are operational.

---

# Success Criteria

Sprint 05 is complete when:

- JAX operational
- Docker operational
- OMV storage mounted
- Plex operational
- Audiobookshelf operational
- Immich operational
- Monitoring configured
- Remote access validated
- Family user testing completed

---

# Prerequisites

## Required Sprint Completion

- [ ] Sprint 00 Complete
- [ ] Sprint 01 Complete
- [ ] Sprint 02 Complete
- [ ] Sprint 03 Complete
- [ ] Sprint 04 Complete

---

## Required Documentation

- MEDIA-SERVICES.md
- STORAGE-MAP.md
- REMOTE-ACCESS.md
- MONITORING-AND-ALERTING.md
- SERVICE-DEPENDENCIES.md
- AI-SERVICES.md

---

# Phase 1 - JAX Platform Preparation

## System Validation

### Hardware

- [ ] Verify CPU
- [ ] Verify RAM
- [ ] Verify RTX 3060
- [ ] Verify GTX 1070
- [ ] Verify Storage Devices

---

### Operating System

- [ ] Install Ubuntu Server
- [ ] Apply Updates
- [ ] Configure Time Synchronization

---

### Networking

- [ ] Configure Static IP
- [ ] Configure DNS
- [ ] Verify Infrastructure Connectivity

---

### Hostname

```text
jax
```

---

# Phase 2 - Docker Platform

## Installation

- [ ] Install Docker
- [ ] Install Docker Compose
- [ ] Configure Service Accounts

---

## Validation

- [ ] Docker Running
- [ ] Docker Compose Working
- [ ] Test Container Executed

---

## Documentation

- [ ] Record Installed Versions

---

# Phase 3 - Storage Integration

## OpenMediaVault Connectivity

### Verify Mounts

- [ ] AppData Share
- [ ] Media Share
- [ ] Downloads Share
- [ ] Photos Share

---

## Mount Validation

Verify:

- [ ] Read Access
- [ ] Write Access
- [ ] Auto Mount On Boot

---

## Performance Validation

- [ ] Throughput Test
- [ ] Reconnect Test
- [ ] Reboot Test

---

# Phase 4 - Plex Deployment

## Installation

- [ ] Create Plex Container
- [ ] Configure Network
- [ ] Configure Storage Mounts

---

## Media Libraries

### Movies

```text
/storage/media/movies
```

---

### Television

```text
/storage/media/tv
```

---

## Plex Configuration

- [ ] Create Libraries
- [ ] Configure Metadata
- [ ] Configure Remote Access

---

## User Access

Create Access For:

- [ ] Eric
- [ ] Beth
- [ ] Amara
- [ ] Adam
- [ ] FeFe
- [ ] William

---

## Validation

- [ ] Local Streaming Works
- [ ] Remote Streaming Works
- [ ] Library Scan Works

---

# Phase 5 - Audiobookshelf Deployment

## Installation

- [ ] Create Audiobookshelf Container
- [ ] Configure Networking
- [ ] Configure Storage

---

## Library Configuration

Path:

```text
/storage/media/audiobooks
```

---

## User Access

Create Access For:

- [ ] Eric
- [ ] Beth
- [ ] Amara
- [ ] Adam
- [ ] FeFe
- [ ] William

---

## Validation

- [ ] Library Visible
- [ ] Playback Functional
- [ ] User Accounts Functional

---

# Phase 6 - Immich Deployment

## Installation

- [ ] Create Immich Containers
- [ ] Configure Database
- [ ] Configure Networking
- [ ] Configure Storage

---

## Storage Path

```text
/storage/photos
```

---

## Critical Data Validation

Verify:

- [ ] Upload Functional
- [ ] Download Functional
- [ ] Database Operational

---

## User Creation

Create Access For:

- [ ] Eric
- [ ] Beth
- [ ] Amara

---

## Mobile Integration

### Eric

- [ ] Install Mobile App
- [ ] Configure Backup

---

### Beth

- [ ] Install Mobile App
- [ ] Configure Backup

---

### Amara

- [ ] Configure Backup Strategy

---

## Validation

- [ ] Photo Upload Works
- [ ] Video Upload Works
- [ ] Search Works
- [ ] Timeline Works

---

# Phase 7 - Homepage Integration

## Add Services

### Media

- [ ] Plex
- [ ] Audiobookshelf

---

### Photos

- [ ] Immich

---

## Validation

- [ ] Dashboard Links Work
- [ ] Grouping Correct

---

# Phase 8 - Uptime Kuma Integration

## Monitoring

Create Monitors For:

- [ ] Plex
- [ ] Audiobookshelf
- [ ] Immich

---

## Validation

- [ ] Monitors Reporting
- [ ] Health Checks Successful

---

# Phase 9 - Remote Access Validation

## Tailscale Testing

Verify Access To:

- [ ] Plex
- [ ] Audiobookshelf
- [ ] Immich

---

## Remote User Testing

Verify:

- [ ] Authentication
- [ ] Streaming
- [ ] Photo Access

---

# Backup Preparation

## Immich

Classified As:

```text
Critical
```

---

### Verify

- [ ] Data Location Confirmed
- [ ] Backup Path Identified
- [ ] Snapshot Strategy Documented

---

## Plex

### Verify

- [ ] Configuration Location Recorded

---

## Audiobookshelf

### Verify

- [ ] Configuration Location Recorded

---

# Validation Testing

## Plex

- [ ] Movie Playback
- [ ] TV Playback
- [ ] Remote Streaming

---

## Audiobookshelf

- [ ] Audiobook Playback
- [ ] User Sync
- [ ] Progress Tracking

---

## Immich

- [ ] Mobile Upload
- [ ] Web Access
- [ ] Timeline Generation
- [ ] User Access

---

# Documentation Updates

Review:

- [ ] MEDIA-SERVICES.md
- [ ] STORAGE-MAP.md
- [ ] SERVICE-INVENTORY.md
- [ ] MONITORING-AND-ALERTING.md
- [ ] SERVICE-DEPENDENCIES.md

---

# Evidence Collection

Store In:

```text
evidence/sprint-05/
```

---

## Required Evidence

- [ ] Docker Installation
- [ ] Storage Mounts
- [ ] Plex Configuration
- [ ] Audiobookshelf Configuration
- [ ] Immich Configuration
- [ ] User Validation
- [ ] Monitoring Screenshots

---

# Lessons Learned

## What Worked

```text
(To be completed during execution)
```

---

## What Failed

```text
(To be completed during execution)
```

---

## Documentation Corrections

```text
(To be completed during execution)
```

---

# Exit Criteria

Sprint 05 cannot be closed until:

- [ ] JAX Operational
- [ ] Docker Operational
- [ ] Storage Mounts Functional
- [ ] Plex Operational
- [ ] Audiobookshelf Operational
- [ ] Immich Operational
- [ ] User Testing Complete
- [ ] Monitoring Operational
- [ ] Documentation Updated
- [ ] Evidence Collected

---

# Sprint Outcome

## Start Date

```text
TBD
```

## Completion Date

```text
TBD
```

## Final Status

```text
Planned
```

## Notes

```text
Sprint 05 is the first end-user service sprint.

Completion delivers:
- Family media streaming
- Audiobook access
- Photo backup services

Immich becomes the first critical-data service deployed in the environment.
```