# DAX Uptime Kuma Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational requirements for the WoogleNet monitoring platform.

Service Name:

```text
dax-uptime
```

Role:

```text
Monitoring Platform
Alerting Platform
Availability Monitoring
Operational Visibility
```

This service is responsible for monitoring all critical infrastructure and applications within WoogleNet.

Upon completion, Uptime Kuma will provide:

- Service Availability Monitoring
- Infrastructure Monitoring
- DNS Monitoring
- Backup Monitoring
- Alerting
- Incident Visibility

---

# Service Information

## Service Summary

| Property | Value |
|-----------|-----------|
| Service Name | dax-uptime |
| Application | Uptime Kuma |
| Role | Monitoring Platform |
| Host | DAX |
| Container Type | LXC |
| Container ID | 111 |
| Hostname | dax-uptime |
| IP Address | 10.0.10.61 |
| VLAN | 10 Infrastructure |
| Tier | Tier 1 Critical |

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
- [ ] DNS Operational
- [ ] Internet Connectivity Operational

---

# Resource Specification

## Container Resources

| Resource | Allocation |
|-----------|-----------|
| vCPU | 2 |
| RAM | 2 GB |
| Swap | 512 MB |
| Storage | 16 GB |

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
dax-uptime
```

---

## IPv4 Address

```text
10.0.10.61/24
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
111
```

---

## Container Name

```text
dax-uptime
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

# Docker Installation

## Install Docker Engine

```bash
apt install docker.io docker-compose-plugin -y
```

---

## Verify

```bash
docker ps
```

Expected:

```text
Docker Operational
```

---

# Uptime Kuma Installation

## Application Directory

Create:

```bash
mkdir -p /opt/uptime-kuma
```

---

## Docker Compose Location

```text
/opt/uptime-kuma/
```

---

## Container Name

```text
dax-uptime
```

---

## Validation

Verify:

```bash
docker ps
```

Expected:

```text
dax-uptime Running
```

---

# Service Access

## URL

```text
http://10.0.10.61:3001
```

---

## Future DNS Record

```text
http://dax-uptime

or

http://dax-uptime.wooglenet.internal
```
# Docker Compose

## Directory Structure

```text
/opt/uptime-kuma/
├── compose.yml
└── data/
```

---

## compose.yml

```yaml
services:
  uptime-kuma:
    image: louislam/uptime-kuma:latest
    container_name: dax-uptime

    restart: unless-stopped

    ports:
      - "3001:3001"

    volumes:
      - ./data:/app/data

    environment:
      TZ: America/New_York

    dns:
      - 10.0.10.50
      - 10.0.10.51
```

---

## Deployment

```bash
cd /opt/uptime-kuma

docker compose pull

docker compose up -d
```

---

## Validation

Browse:

```text
http://10.0.10.61:3001
```

Verify:

- Dashboard loads
- Initial setup works
- Monitors can be created

---

## Update Process

```bash
docker compose pull

docker compose up -d
```

---

## Backup Targets

```text
/opt/uptime-kuma/data
```

Contains:

- Monitors
- Notifications
- Status pages
- Users
```
---

# Initial Monitoring Configuration

## Infrastructure Group

Create Group:

```text
Infrastructure
```

---

### Monitors

```text
dax
max
pax
jax
```

Monitor Type:

```text
Ping
```

---

# Network Group

Create Group:

```text
Network
```

---

### Monitors

```text
UDM-Pro

Gateway

Internet Connectivity
```

---

# DNS Group

Create Group:

```text
DNS
```

---

### Monitors

```text
dax-adguard

max-adguard
```

Monitor Types:

```text
Ping

HTTP

DNS
```

---

# Core Infrastructure Group

Create Group:

```text
Core Infrastructure
```

---

### Monitors

```text
dax-homepage

dax-uptime
```

Monitor Types:

```text
HTTP

Ping
```

---

# Future Groups

## Storage

Placeholder:

```text
pax-omv
```

---

## Media Services

Placeholder:

```text
jax-plex

jax-audiobookshelf

jax-immich
```

---

## Knowledge Services

Placeholder:

```text
jax-paperless

jax-nextcloud

jax-bookstack
```

---

## Security Services

Placeholder:

```text
jax-vaultwarden

max-homeassistant
```

---

# Monitoring Configuration Standards

Reference:

```text
monitoring-standard.md
```

---

## Default Interval

```text
60 Seconds
```

---

## Retry Count

```text
3
```

---

## Alert Threshold

```text
3 Consecutive Failures
```

---

## Recovery Notification

```text
Enabled
```

---

# Notification Configuration

## Email Alerts

Required:

```text
Enabled
```

---

## Notification Test

Required:

- [ ] Alert Received
- [ ] Recovery Alert Received

---

# Backup Monitoring

Create Monitors For:

```text
Backup Repository

Backup Jobs

OneDrive Sync
```

when implemented.

Reference:

```text
backup-standard.md
```

---

# Capacity Monitoring

Track:

```text
Storage Capacity

Host Availability

Critical Service Status
```

---

## Alert Thresholds

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

# Access Control

Reference:

```text
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

## Denied

```text
Guest VLAN

IoT VLAN
```

---

# DNS Records

Create:

| Record | Address |
|----------|----------|
| dax-uptime | 10.0.10.61 |

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Backup

Protect:

```text
Monitor Definitions

Notification Configuration

Alert Rules

User Accounts
```

---

## Backup Location

```text
/opt/uptime-kuma
```

---

## Export Storage

```text
deployment/sprint-03/exports/dax-uptime/
```

---

# Logging Requirements

Reference:

```text
logging-standard.md
```

Capture:

```text
Monitor Failures

Alert Generation

Configuration Changes

Authentication Events

Service Restarts
```

---

# Evidence Collection

Store In:

```text
deployment/sprint-03/evidence/dax-uptime/
```

---

## Capture

- [ ] Dashboard
- [ ] Infrastructure Group
- [ ] DNS Group
- [ ] Alert Configuration
- [ ] Notification Test
- [ ] Monitor Status Page

---

# Validation Checklist

## Container

- [ ] Running
- [ ] Updated
- [ ] Static IP Assigned

---

## Application

- [ ] UI Accessible
- [ ] Dashboard Functional
- [ ] Configuration Saved

---

## Monitoring

- [ ] Infrastructure Monitors Created
- [ ] DNS Monitors Created
- [ ] Core Infrastructure Monitors Created

---

## Notifications

- [ ] Email Alerts Functional
- [ ] Recovery Notifications Functional

---

## Backup

- [ ] Configuration Protected

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

dax-uptime is complete when:

- [ ] Container Operational
- [ ] Monitoring Configured
- [ ] Alerting Configured
- [ ] Notification Testing Successful
- [ ] DNS Monitoring Functional
- [ ] Infrastructure Monitoring Functional
- [ ] Backups Configured
- [ ] Evidence Collected

---

# Related Documents

- deployment/sprint-03/README.md
- deployment/sprint-03/dax-adguard.md
- deployment/sprint-03/max-adguard.md
- deployment/sprint-03/dax-homepage.md
- deployment/sprint-03/validation-checklist.md
- deployment/standards/monitoring-standard.md
- deployment/standards/logging-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial DAX Uptime Kuma Deployment Guide |