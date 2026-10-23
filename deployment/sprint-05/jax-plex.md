# JAX Plex Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational requirements for the WoogleNet media server.

Service Name:

```text
jax-plex
```

Role:

```text
Media Server

Movie Streaming

TV Streaming

Music Streaming

Home Video Streaming
```

This service provides centralized media management and streaming for the WoogleNet environment.

---

# Service Information

## Service Summary

| Property | Value |
|-----------|-----------|
| Service Name | jax-plex |
| Application | Plex Media Server |
| Platform | Docker |
| Host | JAX |
| Tier | Tier 2 |
| Storage Backend | pax-omv |

---

# Standards Compliance

This deployment must comply with:

- naming-standard.md
- service-hardening-standard.md
- network-security-standard.md
- backup-standard.md
- monitoring-standard.md
- logging-standard.md

---

# Dependencies

Required Before Deployment:

- [ ] Sprint 03 Complete
- [ ] Sprint 04 Complete
- [ ] Storage Integration Complete
- [ ] OMV Operational
- [ ] Media Libraries Created

---

# References

- storage-layout.md
- storage-integration.md
- media-workflows.md
- pax-omv.md

---

# Storage Requirements

## Application Data

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
/storage/media/photos
/storage/media/home-videos
```

Access:

```text
Read Only
```

---

# Docker Directory Structure

```text
/opt/jax-plex
│
├── compose.yml
└── .env
```

---

# Network Configuration

## Service Name

```text
jax-plex
```

---

## DNS Record

```text
jax-plex
```

Future FQDN:

```text
jax-plex.wooglenet.internal
```

---

# Docker Compose

## compose.yml

```yaml
services:
  plex:
    image: lscr.io/linuxserver/plex:latest

    container_name: jax-plex

    restart: unless-stopped

    network_mode: host

    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/New_York
      - VERSION=docker

    volumes:
      - /storage/appdata/plex:/config

      - /storage/media/movies:/media/movies:ro
      - /storage/media/tv:/media/tv:ro
      - /storage/media/music:/media/music:ro
      - /storage/media/photos:/media/photos:ro
      - /storage/media/home-videos:/media/home-videos:ro

    dns:
      - 10.0.10.50
      - 10.0.10.51
```

---

# Deployment

## Create Directories

```bash
mkdir -p /storage/appdata/plex
```

---

## Application Directory

```bash
mkdir -p /opt/jax-plex
```

---

## Deploy

```bash
cd /opt/jax-plex

docker compose pull

docker compose up -d
```

---

## Verification

```bash
docker ps
```

Expected:

```text
jax-plex
```

Running.

---

# Initial Configuration

## Web Interface

```text
http://jax:32400/web
```

or

```text
http://<ip-address>:32400/web
```

---

## Plex Account

Configure:

```text
Administrative Plex Account
```

Store credentials in:

```text
Vaultwarden
```

---

# Library Configuration

## Movies Library

Path:

```text
/media/movies
```

---

## Television Library

Path:

```text
/media/tv
```

---

## Music Library

Path:

```text
/media/music
```

---

## Photos Library

Path:

```text
/media/photos
```

---

## Home Videos

Path:

```text
/media/home-videos
```

---

# Content Workflow

Reference:

```text
media-workflows.md
```

---

## Movies

```text
Radarr

→ /storage/media/movies

→ Plex
```

---

## Television

```text
Sonarr

→ /storage/media/tv

→ Plex
```

---

## Music

```text
Lidarr

→ /storage/media/music

→ Plex
```

---

## Home Videos

```text
Manual Import

→ /storage/media/home-videos

→ Plex
```

---

# Security

Reference:

```text
service-hardening-standard.md
```

---

## Library Access

Plex should receive:

```text
Read Only
```

access to:

```text
/storage/media
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

## Restricted

```text
Guest VLAN

IoT VLAN
```

unless explicitly approved.

---

# Monitoring

Reference:

```text
monitoring-standard.md
```

---

## Uptime Kuma

Create Monitor:

```text
jax-plex
```

---

## Checks

- Ping
- HTTP/HTTPS

---

## Alert Priority

```text
Priority 2
```

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Required Backup

```text
/storage/appdata/plex
```

---

## Includes

```text
Library Definitions

Collections

Metadata

Preferences

Users

Server Configuration
```

---

## Media Content

```text
/storage/media
```

follows overall media recovery strategy.

---

# Logging

Reference:

```text
logging-standard.md
```

---

Capture:

```text
Authentication Events

Library Scans

Metadata Failures

Configuration Changes

Playback Errors

Service Restarts
```

---

# Evidence Collection

Store In:

```text
deployment/sprint-05/evidence/jax-plex/
```

---

## Capture

- [ ] Login Screen
- [ ] Dashboard
- [ ] Movies Library
- [ ] TV Library
- [ ] Music Library
- [ ] Photos Library
- [ ] Monitoring Configuration
- [ ] Backup Configuration

---

# Validation Checklist

## Container

- [ ] Container Running
- [ ] Restart Policy Configured
- [ ] DNS Functional

---

## Storage

- [ ] AppData Mounted
- [ ] Movies Mounted
- [ ] TV Mounted
- [ ] Music Mounted
- [ ] Photos Mounted
- [ ] Home Videos Mounted

---

## Application

- [ ] UI Accessible
- [ ] Plex Account Configured
- [ ] Libraries Created

---

## Media

- [ ] Movies Detected
- [ ] TV Shows Detected
- [ ] Music Detected
- [ ] Photos Detected

---

## Playback

- [ ] Movie Playback Functional
- [ ] TV Playback Functional
- [ ] Music Playback Functional

---

## Monitoring

- [ ] Added To Uptime Kuma
- [ ] Health Check Passing

---

## Backup

- [ ] AppData Included
- [ ] Recovery Procedure Documented

---

# Completion Record

## Completed By

```text
_____________________
```

---

## Date

```text
_____________________
```

---

## Result

```text
PASS / FAIL
```

---

# Exit Criteria

jax-plex is complete when:

- [ ] Docker Service Operational
- [ ] Libraries Configured
- [ ] Media Detected
- [ ] Streaming Functional
- [ ] Monitoring Configured
- [ ] Backup Configured
- [ ] Documentation Updated
- [ ] Evidence Collected

---

# Related Documents

- README.md
- storage-integration.md
- media-workflows.md
- validation-checklist.md
- rollback-procedure.md
- jax-audiobookshelf.md
- jax-immich.md
- ../sprint-04/storage-layout.md
- ../sprint-04/pax-omv.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Plex Deployment Guide |