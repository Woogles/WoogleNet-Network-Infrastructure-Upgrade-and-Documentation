# DAX Homepage Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational requirements for the WoogleNet service dashboard.

Service Name:

```text
dax-homepage
```

Role:

```text
Infrastructure Dashboard
Service Directory
Operations Portal
```

Homepage serves as the central operational dashboard for WoogleNet and provides a single location to access infrastructure, storage, monitoring, and application services.

---

# Service Information

## Service Summary

| Property | Value |
|-----------|-----------|
| Service Name | dax-homepage |
| Application | Homepage |
| Role | Service Dashboard |
| Host | DAX |
| Container Type | LXC |
| Container ID | 110 |
| Hostname | dax-homepage |
| IP Address | 10.0.10.60 |
| VLAN | 10 Infrastructure |
| Tier | Tier 3 Utility |

---

# Standards Compliance

This deployment must comply with:

- naming-standard.md
- lxc-standard.md
- service-hardening-standard.md
- network-security-standard.md
- monitoring-standard.md
- backup-standard.md
- logging-standard.md

---

# Dependencies

Required Before Deployment:

- [ ] Sprint 01 Complete
- [ ] Sprint 02 Complete
- [ ] dax-adguard Operational
- [ ] max-adguard Operational
- [ ] DNS Functional

---

# Resource Specification

## Container Resources

| Resource | Allocation |
|-----------|-----------|
| vCPU | 2 |
| RAM | 2 GB |
| Swap | 512 MB |
| Storage | 8 GB |

---

## Container Type

```text
Unprivileged LXC
```

---

## Operating System

```text
Debian 12
```

---

# Network Configuration

## Hostname

```text
dax-homepage
```

---

## IPv4 Address

```text
10.0.10.60/24
```

---

## Gateway

```text
10.0.10.1
```

---

## DNS

Primary:

```text
10.0.10.50
```

Secondary:

```text
10.0.10.51
```

---

# LXC Creation

## Container ID

```text
110
```

---

## Container Name

```text
dax-homepage
```

---

## Validation

Verify:

- [ ] Container Created
- [ ] Container Running
- [ ] Static IP Assigned

---

# Base Operating System

## Initial Updates

```bash
apt update
apt upgrade -y
```

---

## Utility Packages

```bash
apt install curl wget sudo git ca-certificates -y
```

---

# Homepage Installation

## Install Docker Engine

```bash
apt install docker.io docker-compose-plugin -y
```

---

## Create Application Directory

```bash
mkdir -p /opt/homepage
```

---

## Deployment

Example Compose Location:

```text
/opt/homepage/
```
# Docker Compose

## Directory Structure

```text
/opt/homepage/
├── compose.yml
├── config/
│   ├── bookmarks.yaml
│   ├── services.yaml
│   ├── widgets.yaml
│   ├── settings.yaml
│   └── custom.css
└── icons/
```

---

## compose.yml

```yaml
services:
  homepage:
    image: ghcr.io/gethomepage/homepage:latest
    container_name: dax-homepage

    restart: unless-stopped

    ports:
      - "80:3000"

    environment:
      PUID: 1000
      PGID: 1000
      TZ: America/New_York

    volumes:
      - ./config:/app/config
      - ./icons:/app/public/icons

    dns:
      - 10.0.10.50
      - 10.0.10.51
```

---

## Deployment

```bash
cd /opt/homepage

docker compose pull

docker compose up -d
```

---

## Validation

```bash
docker ps
```

Expected:

```text
dax-homepage
```

Running.

---

## Update Process

```bash
cd /opt/homepage

docker compose pull

docker compose up -d
```

---

## Rollback

```bash
docker compose down

docker image ls
```

Redeploy previous image version if necessary.
```
---

## Container Name

```text
dax-homepage
```

---

## Validation

Verify:

```bash
docker ps
```

Expected:

```text
Homepage Container Running
```

---

# Service Access

## URL

```text
http://10.0.10.60
```

---

## Future DNS

```text
http://dax-homepage

or

http://dax-homepage.wooglenet.internal
```

---

# Dashboard Structure

Homepage should reflect the WoogleNet architecture.

---

# Infrastructure Section

## Network

Links:

```text
UDM-Pro
Switches
Access Points
```

---

## Hosts

Links:

```text
dax
max
pax
jax
```

---

# Core Infrastructure Section

Services:

```text
dax-adguard

max-adguard

dax-homepage

dax-uptime
```

---

# Storage Section

Placeholder:

```text
pax-omv
```

---

# Security Section

Placeholder:

```text
jax-vaultwarden

max-homeassistant
```

---

# Media Section

Placeholder:

```text
jax-plex

jax-audiobookshelf

jax-immich
```

---

# Knowledge Section

Placeholder:

```text
jax-paperless

jax-nextcloud

jax-bookstack
```

---

# Utility Services

Placeholder:

```text
jax-navidrome

jax-overseerr

jax-sonarr

jax-radarr

jax-prowlarr
```

---

# Widget Configuration

## System Widgets

Enable:

```text
CPU

Memory

Storage

Uptime
```

where available.

---

## Service Widgets

Enable:

```text
Service Health

Container Status
```

when supported.

---

# Access Control

Reference:

```text
service-hardening-standard.md

network-security-standard.md
```

---

## Administrative Access

Allowed From:

```text
Infrastructure VLAN

Trusted VLAN

Tailscale
```

---

## Access Denied

```text
Guest VLAN

IoT VLAN
```

---

# DNS Records

Create:

| Record | Address |
|----------|----------|
| dax-homepage | 10.0.10.60 |

---

# Monitoring Requirements

Reference:

```text
monitoring-standard.md
```

---

## Uptime Kuma Monitor

Create:

```text
dax-homepage
```

---

## Check Types

```text
Ping

HTTP
```

---

## Alert Priority

```text
Priority 3
```

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Protect

Backup:

```text
Configuration Files

Homepage YAML

Icons

Customizations
```

---

## Backup Location

```text
/opt/homepage
```

---

## Export Storage

```text
deployment/sprint-03/exports/dax-homepage/
```

---

# Logging Requirements

Reference:

```text
logging-standard.md
```

Capture:

```text
Application Startup

Application Shutdown

Container Failures

Configuration Changes
```

---

# Evidence Collection

Store In:

```text
deployment/sprint-03/evidence/dax-homepage/
```

---

## Capture

- [ ] Homepage Landing Page
- [ ] Infrastructure Section
- [ ] Core Services Section
- [ ] DNS Resolution
- [ ] Monitoring Configuration

---

# Validation Checklist

## Container

- [ ] Running
- [ ] Updated
- [ ] Static IP Assigned

---

## Application

- [ ] Homepage Accessible
- [ ] Dashboard Loads
- [ ] Links Functional

---

## DNS

- [ ] Hostname Resolves
- [ ] Dashboard Reachable

---

## Monitoring

- [ ] Added To dax-uptime
- [ ] Health Checks Passing

---

## Backup

- [ ] Configuration Backed Up

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

dax-homepage is complete when:

- [ ] Container Operational
- [ ] Dashboard Configured
- [ ] Infrastructure Links Added
- [ ] Monitoring Added
- [ ] Backups Configured
- [ ] DNS Functional
- [ ] Evidence Collected

---

# Related Documents

- deployment/sprint-03/README.md
- deployment/sprint-03/dax-adguard.md
- deployment/sprint-03/dax-uptime.md
- deployment/standards/naming-standard.md
- deployment/standards/lxc-standard.md
- deployment/standards/monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial DAX Homepage Deployment Guide |