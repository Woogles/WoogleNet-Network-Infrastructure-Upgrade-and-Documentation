# JAX Audiobookshelf Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational requirements for the WoogleNet audiobook platform.

Service Name:

```text
jax-audiobookshelf
```

Role:

```text
Audiobook Library

Audiobook Streaming

Audiobook Metadata Management

Reading Progress Tracking
```

This service provides centralized audiobook management and streaming for the WoogleNet environment.

---

# Service Information

## Service Summary

| Property | Value |
|-----------|-----------|
| Service Name | jax-audiobookshelf |
| Application | Audiobookshelf |
| Platform | Docker |
| Host | JAX |
| Hostname | jax |
| Access Method | Web |
| Tier | Tier 2 |

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
- [ ] Media Storage Available

---

# Storage References

Reference:

- storage-layout.md
- storage-integration.md
- media-workflows.md

---

# Storage Requirements

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

## Metadata Storage

```text
/storage/appdata/audiobookshelf/metadata
```

Access:

```text
Read/Write
```

---

# Docker Directory Structure

```text
/opt/jax-audiobookshelf
│
├── compose.yml
└── .env
```

---

# Network Configuration

## Service Name

```text
jax-audiobookshelf
```

---

## DNS Record

```text
jax-audiobookshelf
```

Future FQDN:

```text
jax-audiobookshelf.wooglenet.internal
```

---

# Docker Compose

## compose.yml

```yaml
services:
  audiobookshelf:
    image: ghcr.io/advplyr/audiobookshelf:latest

    container_name: jax-audiobookshelf

    restart: unless-stopped

    ports:
      - "13378:80"

    environment:
      TZ: America/New_York

    volumes:
      - /storage/appdata/audiobookshelf/config:/config
      - /storage/appdata/audiobookshelf/metadata:/metadata
      - /storage/media/audiobooks:/audiobooks:ro

    dns:
      - 10.0.10.50
      - 10.0.10.51
```

---

# Deployment

## Create Directories

```bash
mkdir -p /storage/appdata/audiobookshelf/config

mkdir -p /storage/appdata/audiobookshelf/metadata
```

---

## Application Directory

```bash
mkdir -p /opt/jax-audiobookshelf
```

---

## Deploy

```bash
cd /opt/jax-audiobookshelf

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
jax-audiobookshelf
```

Running.

---

# Initial Configuration

## Web Interface

```text
http://jax-audiobookshelf:13378
```

or

```text
http://<ip-address>:13378
```

---

## Administrator Account

Create:

```text
Administrative User
```

Store credentials in:

```text
Vaultwarden
```

---

# Library Configuration

## Audiobook Library

Add:

```text
/storage/media/audiobooks
```

---

## Library Type

```text
Audiobooks
```

---

## Metadata Storage

Store metadata in:

```text
/storage/appdata/audiobookshelf/metadata
```

---

# Content Workflow

Reference:

```text
media-workflows.md
```

---

## Import Process

```text
Audiobook Files

→ AudioBookshelf Scan

→ Metadata Processing

→ Library Creation

→ Streaming
```

---

# Security

Reference:

```text
service-hardening-standard.md
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

---

## Library Access

Audiobookshelf should have:

```text
Read Only
```

access to:

```text
/storage/media/audiobooks
```

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
jax-audiobookshelf
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
/storage/appdata/audiobookshelf
```

---

## Includes

```text
Users

Libraries

Metadata

Collections

Progress Tracking

Settings
```

---

## Media Backup

```text
/storage/media/audiobooks
```

Follows overall media recovery strategy.

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

Service Restarts
```

---

# Evidence Collection

Store In:

```text
deployment/sprint-05/evidence/jax-audiobookshelf/
```

---

## Capture

- [ ] Login Screen
- [ ] Dashboard
- [ ] Library Configuration
- [ ] Metadata Configuration
- [ ] Monitor Configuration
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
- [ ] Metadata Directory Mounted
- [ ] Audiobook Library Mounted

---

## Application

- [ ] UI Accessible
- [ ] Administrator Created
- [ ] Library Created
- [ ] Metadata Functional

---

## Content

- [ ] Audiobooks Detected
- [ ] Covers Displayed
- [ ] Playback Functional

---

## Monitoring

- [ ] Added To Uptime Kuma
- [ ] Health Check Passing

---

## Backup

- [ ] Backup Included
- [ ] Restore Procedure Documented

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

jax-audiobookshelf is complete when:

- [ ] Docker Service Operational
- [ ] Library Accessible
- [ ] Audiobooks Imported
- [ ] Metadata Functional
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
- ../sprint-04/storage-layout.md
- ../sprint-04/pax-omv.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Audiobookshelf Deployment Guide |