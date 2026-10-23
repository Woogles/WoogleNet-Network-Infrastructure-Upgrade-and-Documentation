# Sprint 05 - Media Platform

## Purpose

Sprint 05 establishes the media services platform for the WoogleNet environment.

This sprint deploys the core media ecosystem and integrates it with the centralized storage platform established in Sprint 04.

The objective is to deploy:

- Plex Media Server
- Audiobookshelf
- Immich
- Media Workflows
- Storage Integration
- Monitoring
- Backup Protection

Upon completion, WoogleNet gains centralized media management for:

```text
Movies

TV Shows

Music

Audiobooks

Photos

Home Videos
```

---

# Sprint Objectives

## Primary Goals

- Deploy jax-plex
- Deploy jax-audiobookshelf
- Deploy jax-immich
- Integrate OMV Storage
- Validate Media Workflows
- Configure Monitoring
- Configure Backups

---

## Secondary Goals

- Establish Media Standards
- Validate Storage Mounts
- Validate Remote Access
- Prepare For Sprint 06

---

# Sprint Deliverables

Upon completion the following services should be operational:

```text
jax-plex

jax-audiobookshelf

jax-immich
```

---

## Integrated Storage

```text
/storage/media/movies

/storage/media/tv

/storage/media/music

/storage/media/audiobooks

/storage/media/photos

/storage/media/home-videos
```

---

## Operational Capabilities

```text
Movie Streaming

TV Streaming

Music Streaming

Audiobook Streaming

Photo Management

Mobile Access

Backup Protection

Monitoring
```

---

# Directory Structure

```text
deployment/
└── sprint-05/
    │
    ├── README.md
    ├── storage-integration.md
    ├── media-workflows.md
    ├── jax-plex.md
    ├── jax-audiobookshelf.md
    ├── jax-immich.md
    ├── validation-checklist.md
    ├── rollback-procedure.md
    │
    ├── exports/
    │   ├── jax-plex/
    │   ├── jax-audiobookshelf/
    │   └── jax-immich/
    │
    └── evidence/
        ├── jax-plex/
        ├── jax-audiobookshelf/
        ├── jax-immich/
        ├── storage/
        └── workflows/
```

---

# References

## Sprint Documents

- storage-layout.md
- smb-shares.md
- backup-repository.md
- pax-omv.md

---

## Standards

- naming-standard.md
- lxc-standard.md
- service-hardening-standard.md
- network-security-standard.md
- backup-standard.md
- monitoring-standard.md
- logging-standard.md

---

# Deployment Targets

## Plex

| Property | Value |
|-----------|-----------|
| Service Name | jax-plex |
| Platform | Docker |
| Host | JAX |
| Role | Media Server |
| Tier | Tier 2 |

---

## Audiobookshelf

| Property | Value |
|-----------|-----------|
| Service Name | jax-audiobookshelf |
| Platform | Docker |
| Host | JAX |
| Role | Audiobook Platform |
| Tier | Tier 2 |

---

## Immich

| Property | Value |
|-----------|-----------|
| Service Name | jax-immich |
| Platform | Docker |
| Host | JAX |
| Role | Photo Management |
| Tier | Tier 1 |

---

# Storage Integration

## Plex

### Configuration

```text
/storage/appdata/plex
```

### Media

```text
/storage/media
```

Access:

```text
Read Only
```

---

## Audiobookshelf

### Configuration

```text
/storage/appdata/audiobookshelf
```

### Content

```text
/storage/media/audiobooks
```

Access:

```text
Read Only
```

---

## Immich

### Configuration

```text
/storage/appdata/immich
```

### Photo Library

```text
/storage/media/photos
```

Access:

```text
Read/Write
```

---

# Media Workflow Objectives

## Movies

Flow:

```text
Downloads

→ Processing

→ Media Library

→ Plex
```

---

## TV

Flow:

```text
Downloads

→ Processing

→ Media Library

→ Plex
```

---

## Music

Flow:

```text
Media Library

→ Navidrome

→ Plex
```

---

## Audiobooks

Flow:

```text
Media Library

→ Audiobookshelf
```

---

## Photos

Flow:

```text
Mobile Upload

→ Immich

→ Backup

→ Search
```

---

# Monitoring Requirements

Reference:

```text
monitoring-standard.md
```

---

## Required Monitors

### jax-plex

- Ping
- HTTP/HTTPS

---

### jax-audiobookshelf

- Ping
- HTTP/HTTPS

---

### jax-immich

- Ping
- HTTP/HTTPS

---

## Storage Monitoring

Monitor:

```text
Media Capacity

Photo Capacity

Application Storage
```

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Plex

Backup:

```text
Configuration Only
```

---

## Audiobookshelf

Backup:

```text
Configuration

Metadata
```

---

## Immich

Backup:

```text
Configuration

Database

Photo Metadata
```

---

# Security Requirements

Reference:

```text
service-hardening-standard.md

network-security-standard.md
```

---

## Administrative Access

Allowed:

```text
Infrastructure VLAN

Trusted VLAN

Tailscale
```

---

## Restricted Networks

```text
Guest VLAN

IoT VLAN
```

Unless explicitly approved.

---

# Deployment Order

Follow this sequence exactly.

## Step 1

Complete:

```text
storage-integration.md
```

---

## Step 2

Complete:

```text
media-workflows.md
```

---

## Step 3

Deploy:

```text
jax-plex
```

---

## Step 4

Deploy:

```text
jax-audiobookshelf
```

---

## Step 5

Deploy:

```text
jax-immich
```

---

## Step 6

Configure Monitoring

---

## Step 7

Configure Backups

---

## Step 8

Execute Validation

Reference:

```text
validation-checklist.md
```

---

# Success Criteria

Sprint 05 is complete when:

- jax-plex Operational
- jax-audiobookshelf Operational
- jax-immich Operational
- Storage Integration Complete
- Monitoring Operational
- Backups Operational
- Media Workflows Validated
- Documentation Updated

---

# Exit Criteria

Sprint 05 may only be closed when:

- [ ] Plex Operational
- [ ] Audiobookshelf Operational
- [ ] Immich Operational
- [ ] Storage Mounts Validated
- [ ] Monitoring Configured
- [ ] Backups Configured
- [ ] Validation Complete
- [ ] Exports Collected
- [ ] Evidence Collected

---

# Expected Outcome

At completion of Sprint 05:

```text
Centralized Media Platform Exists

Photo Platform Exists

Audiobook Platform Exists

Storage Integration Complete

Media Workflows Operational
```

The environment is now ready for:

```text
Sprint 06 - Productivity & Automation Platform
```

---

# Next Sprint

```text
Sprint 06 - Productivity & Automation Platform
```

Primary Objectives:

```text
Deploy Vaultwarden

Deploy Home Assistant

Deploy ARR Stack

Deploy Navidrome

Establish Automation Platform
```

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 05 Media Platform Deployment Guide |