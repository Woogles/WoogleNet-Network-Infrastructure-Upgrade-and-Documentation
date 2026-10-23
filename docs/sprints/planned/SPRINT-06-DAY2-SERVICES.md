# Sprint 06 - Day 2 Services

## Sprint Information

| Property | Value |
|----------|----------|
| Sprint ID | Sprint 06 |
| Name | Day 2 Services |
| Status | Planned |
| Priority | High |
| Estimated Duration | 1-2 Weeks |
| Owner | Eric Yacoub |

---

# Sprint Goal

Deploy the second wave of services that provide:

- Password Management
- Home Automation
- Media Automation
- Music Streaming
- Utility Services

At completion, WoogleNet transitions from a media platform into a complete self-hosted services platform.

---

# Success Criteria

Sprint 06 is complete when:

- Home Assistant operational
- Vaultwarden operational
- ARR Stack operational
- Navidrome operational
- Tautulli operational
- MeTube operational
- Stirling-PDF operational
- Monitoring configured
- Remote access validated

---

# Prerequisites

## Required Sprint Completion

- [ ] Sprint 00 Complete
- [ ] Sprint 01 Complete
- [ ] Sprint 02 Complete
- [ ] Sprint 03 Complete
- [ ] Sprint 04 Complete
- [ ] Sprint 05 Complete

---

## Required Documentation

- CORE-INFRASTRUCTURE.md
- MEDIA-SERVICES.md
- SECURITY-BASELINE.md
- REMOTE-ACCESS.md
- STORAGE-MAP.md
- SERVICE-DEPENDENCIES.md

---

# Phase 1 - Home Assistant Deployment

## Platform

| Property | Value |
|----------|----------|
| Host | MAX |
| Platform | VM |
| Criticality | Critical |

---

## VM Deployment

- [ ] Create VM
- [ ] Install Home Assistant OS
- [ ] Configure Networking
- [ ] Configure Static IP

---

## Initial Configuration

- [ ] Create Administrator Account
- [ ] Configure Time Zone
- [ ] Configure Backups

---

## Security

- [ ] Enable MFA
- [ ] Configure Tailscale Access
- [ ] Verify Administrative Access

---

## Validation

- [ ] Web UI Functional
- [ ] Login Functional
- [ ] Tailscale Access Functional

---

# Phase 2 - Vaultwarden Deployment

## Platform

| Property | Value |
|----------|----------|
| Host | JAX |
| Platform | Docker |
| Criticality | Critical |

---

## Deployment

- [ ] Create Container
- [ ] Configure Storage
- [ ] Configure Networking

---

## Storage

```text
/storage/appdata/vaultwarden
```

---

## Security

- [ ] Configure Admin Account
- [ ] Enable MFA
- [ ] Configure Backups

---

## User Creation

Create Accounts For:

- [ ] Eric
- [ ] Beth
- [ ] Amara

---

## Validation

- [ ] Login Working
- [ ] MFA Functional
- [ ] Password Storage Functional

---

# Phase 3 - Media Automation Foundation

## qBittorrent

### Deployment

- [ ] Deploy Container
- [ ] Configure Downloads

Downloads Path:

```text
/storage/downloads
```

---

### Validation

- [ ] Downloads Functional
- [ ] File Access Functional

---

## Prowlarr

### Deployment

- [ ] Deploy Container
- [ ] Configure Indexers

---

### Validation

- [ ] Indexers Functional
- [ ] Application Integration Functional

---

# Phase 4 - ARR Stack Deployment

## Sonarr

- [ ] Deploy Container
- [ ] Configure TV Library
- [ ] Configure qBittorrent Integration
- [ ] Configure Prowlarr Integration

---

## Radarr

- [ ] Deploy Container
- [ ] Configure Movie Library
- [ ] Configure qBittorrent Integration
- [ ] Configure Prowlarr Integration

---

## Lidarr

- [ ] Deploy Container
- [ ] Configure Music Library
- [ ] Configure qBittorrent Integration

---

## Readarr

- [ ] Deploy Container
- [ ] Configure Ebook Library
- [ ] Configure qBittorrent Integration

---

## Bazarr

- [ ] Deploy Container
- [ ] Configure Subtitle Management

---

## Overseerr

- [ ] Deploy Container
- [ ] Configure Requests
- [ ] Integrate Plex
- [ ] Integrate ARR Stack

---

# Phase 5 - Storage Validation

## Hardlinks

Verify:

- [ ] Sonarr Hardlinks Work
- [ ] Radarr Hardlinks Work
- [ ] Lidarr Hardlinks Work
- [ ] Readarr Hardlinks Work

---

## Import Testing

Verify:

- [ ] TV Import
- [ ] Movie Import
- [ ] Music Import
- [ ] Ebook Import

---

# Phase 6 - Navidrome Deployment

## Deployment

- [ ] Create Container
- [ ] Configure Storage

Library Path:

```text
/storage/media/music
```

---

## Validation

- [ ] Music Library Visible
- [ ] Streaming Functional

---

# Phase 7 - Tautulli Deployment

## Deployment

- [ ] Create Container
- [ ] Connect To Plex

---

## Validation

- [ ] Plex Stats Visible
- [ ] Usage Data Collected

---

# Phase 8 - MeTube Deployment

## Deployment

- [ ] Create Container
- [ ] Configure Downloads

---

## Validation

- [ ] Video Download Functional
- [ ] Audio Download Functional

---

# Phase 9 - Stirling-PDF Deployment

## Deployment

- [ ] Create Container
- [ ] Configure Storage

---

## Validation

- [ ] PDF Merge
- [ ] PDF Split
- [ ] OCR Functionality

---

# Phase 10 - Homepage Integration

## Add Services

### Home Services

- [ ] Home Assistant
- [ ] Vaultwarden

---

### Media Automation

- [ ] qBittorrent
- [ ] Sonarr
- [ ] Radarr
- [ ] Lidarr
- [ ] Readarr
- [ ] Bazarr
- [ ] Overseerr

---

### Utility Services

- [ ] Navidrome
- [ ] MeTube
- [ ] Tautulli
- [ ] Stirling-PDF

---

# Phase 11 - Monitoring Integration

## Uptime Kuma

Add Monitors For:

- [ ] Home Assistant
- [ ] Vaultwarden
- [ ] qBittorrent
- [ ] Sonarr
- [ ] Radarr
- [ ] Lidarr
- [ ] Readarr
- [ ] Overseerr
- [ ] Navidrome
- [ ] MeTube
- [ ] Stirling-PDF

---

# Backup Preparation

## Vaultwarden

Verify:

- [ ] Backup Path Defined
- [ ] Backup Classification Critical

---

## Home Assistant

Verify:

- [ ] Snapshot Strategy Defined
- [ ] Backup Strategy Defined

---

# Validation Testing

## Home Assistant

- [ ] Local Access
- [ ] Tailscale Access
- [ ] MFA Validation

---

## Vaultwarden

- [ ] Login
- [ ] MFA
- [ ] Vault Creation

---

## ARR Stack

- [ ] Search Functional
- [ ] Download Functional
- [ ] Import Functional

---

## Utility Services

- [ ] Music Streaming
- [ ] Plex Analytics
- [ ] PDF Processing
- [ ] Media Downloads

---

# Documentation Updates

Review:

- [ ] CORE-INFRASTRUCTURE.md
- [ ] MEDIA-SERVICES.md
- [ ] SERVICE-INVENTORY.md
- [ ] STORAGE-MAP.md
- [ ] MONITORING-AND-ALERTING.md

---

# Evidence Collection

Store In:

```text
evidence/sprint-06/
```

---

## Required Evidence

- [ ] Home Assistant Configuration
- [ ] Vaultwarden Configuration
- [ ] ARR Screenshots
- [ ] Navidrome Screenshots
- [ ] Tautulli Screenshots
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

Sprint 06 cannot be closed until:

- [ ] Home Assistant Operational
- [ ] Vaultwarden Operational
- [ ] ARR Stack Operational
- [ ] Navidrome Operational
- [ ] Utility Services Operational
- [ ] Monitoring Operational
- [ ] Backup Planning Complete
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
Sprint 06 introduces the first critical personal services:

- Password Management
- Home Automation
- Media Automation

Completion marks the transition from media-focused services to a full self-hosted platform.
```