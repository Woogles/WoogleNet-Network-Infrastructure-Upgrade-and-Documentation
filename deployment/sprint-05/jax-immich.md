# JAX Immich Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational requirements for the WoogleNet photo management platform.

Service Name:

```text
jax-immich
```

Role:

```text
Photo Management

Photo Backup

Photo Search

Mobile Upload Platform

AI-Assisted Organization
```

This service provides centralized photo and video management for the WoogleNet environment.

---

# Service Information

## Service Summary

| Property | Value |
|-----------|-----------|
| Service Name | jax-immich |
| Application | Immich |
| Platform | Docker |
| Host | JAX |
| Tier | Tier 1 Critical |
| Storage Backend | pax-omv |
| Database | PostgreSQL |
| Cache | Redis |

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
- [ ] Photo Storage Available

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

## Database Storage

```text
/storage/appdata/immich/postgres
```

---

## Redis Storage

```text
/storage/appdata/immich/redis
```

---

# Docker Directory Structure

```text
/opt/jax-immich
│
├── compose.yml
├── .env
└── backups/
```

---

# Network Configuration

## Service Name

```text
jax-immich
```

---

## DNS Record

```text
jax-immich
```

Future FQDN:

```text
jax-immich.wooglenet.internal
```

---

# Docker Compose

## compose.yml

```yaml
services:
  immich-server:
    container_name: jax-immich-server
    image: ghcr.io/immich-app/immich-server:release

    restart: unless-stopped

    ports:
      - "2283:2283"

    environment:
      TZ: America/New_York

    volumes:
      - /storage/appdata/immich:/usr/src/app/upload
      - /storage/media/photos:/photos

    depends_on:
      - redis
      - postgres

    dns:
      - 10.0.10.50
      - 10.0.10.51

  redis:
    container_name: jax-immich-redis
    image: redis:7

    restart: unless-stopped

    volumes:
      - /storage/appdata/immich/redis:/data

  postgres:
    container_name: jax-immich-postgres
    image: postgres:16

    restart: unless-stopped

    environment:
      POSTGRES_DB: immich
      POSTGRES_USER: immich
      POSTGRES_PASSWORD: CHANGE_ME

    volumes:
      - /storage/appdata/immich/postgres:/var/lib/postgresql/data
```

---

# Deployment

## Create Directories

```bash
mkdir -p /storage/appdata/immich

mkdir -p /storage/appdata/immich/postgres

mkdir -p /storage/appdata/immich/redis

mkdir -p /storage/media/photos
```

---

## Create Application Directory

```bash
mkdir -p /opt/jax-immich
```

---

## Deploy

```bash
cd /opt/jax-immich

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
jax-immich-server

jax-immich-postgres

jax-immich-redis
```

Running.

---

# Initial Configuration

## Web Interface

```text
http://jax-immich:2283
```

Or:

```text
http://<ip-address>:2283
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

## Storage Location

Primary Library:

```text
/storage/media/photos
```

---

## Mobile Uploads

Enable:

```text
Automatic Uploads
```

for approved devices.

---

## AI Features

Enable:

```text
Face Recognition

Smart Search

Object Detection

Album Suggestions
```

As resources permit.

---

# Photo Workflow

Reference:

```text
media-workflows.md
```

---

## Workflow

```text
Mobile Upload

→ Ingest

→ Thumbnail Generation

→ AI Processing

→ Search Indexing

→ Album Organization

→ Backup
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

# Monitoring

Reference:

```text
monitoring-standard.md
```

---

## Uptime Kuma

Create Monitor:

```text
jax-immich
```

---

## Checks

- Ping
- HTTP/HTTPS

---

## Alert Priority

```text
Priority 1
```

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Required Backups

```text
/storage/appdata/immich

/storage/appdata/immich/postgres

/storage/appdata/immich/redis
```

---

## Critical Components

Backup:

```text
Database

Metadata

Albums

Users

Settings

Face Recognition Data
```

---

## Media Library

```text
/storage/media/photos
```

Follow media backup policy.

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

Upload Events

Database Errors

Metadata Processing Errors

Configuration Changes

Service Restarts
```

---

# Evidence Collection

Store In:

```text
deployment/sprint-05/evidence/jax-immich/
```

---

## Capture

- [ ] Login Screen
- [ ] Dashboard
- [ ] Mobile Client Connected
- [ ] User Administration
- [ ] Photo Library
- [ ] Face Recognition
- [ ] Search Functionality
- [ ] Monitoring Configuration

---

# Validation Checklist

## Containers

- [ ] Server Running
- [ ] PostgreSQL Running
- [ ] Redis Running

---

## Storage

- [ ] AppData Mounted
- [ ] Photos Library Mounted
- [ ] Database Storage Functional

---

## Application

- [ ] UI Accessible
- [ ] Administrator Created
- [ ] Login Functional

---

## Uploads

- [ ] Photo Upload Successful
- [ ] Video Upload Successful
- [ ] Mobile Upload Functional

---

## Features

- [ ] Search Functional
- [ ] Albums Functional
- [ ] Face Recognition Functional

---

## Monitoring

- [ ] Added To Uptime Kuma
- [ ] Health Checks Passing

---

## Backup

- [ ] Database Included
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

jax-immich is complete when:

- [ ] Docker Stack Operational
- [ ] Database Operational
- [ ] Mobile Upload Functional
- [ ] Photo Library Functional
- [ ] AI Features Operational
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
- ../sprint-04/storage-layout.md
- ../sprint-04/pax-omv.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Immich Deployment Guide |