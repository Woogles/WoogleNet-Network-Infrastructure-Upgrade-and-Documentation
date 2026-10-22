# Architecture

## Purpose

This document serves as the authoritative architectural overview for the WoogleNet environment.

It provides a high-level summary of:

- Infrastructure architecture
- Network architecture
- Service architecture
- Storage architecture
- Security architecture
- Operational architecture

This document is intended to be the first document reviewed when understanding the WoogleNet environment.

Detailed implementation information is documented in the supporting architecture documents.

---

# Executive Summary

WoogleNet is a self-hosted home lab environment designed to provide:

- Secure network segmentation
- Family media services
- Photo backup services
- Password management
- Document management
- Home automation
- Centralized storage
- Local AI capabilities
- Reliable backup and recovery

The environment prioritizes:

```text
Simplicity
Security
Recoverability
Documentation
Family Usability
```

over enterprise-style complexity.

---

# Architectural Principles

## Primary Principles

1. Simplicity over complexity.
2. Recovery over high availability.
3. Tailscale over public exposure.
4. Documentation before deployment.
5. Data protection before automation.
6. Services should be easy to rebuild.
7. Critical data must be backed up.

---

# Environment Overview

## Physical Infrastructure

```text
Internet
    │
    ▼
UDM-Pro
    │
    ▼
TP-Link Switching
    │
    ▼
UniFi Wireless
    │
    ▼
Compute + Storage
```

---

## Compute Platform

### DAX

Role:

```text
Infrastructure Host
```

Primary Services:

- AdGuard Primary
- Homepage
- Uptime Kuma

Platform:

```text
Proxmox VE
```

---

### MAX

Role:

```text
Infrastructure Host
```

Primary Services:

- AdGuard Secondary
- Home Assistant

Platform:

```text
Proxmox VE
```

---

### PAX

Role:

```text
Storage Host
```

Primary Services:

- OpenMediaVault

Platform:

```text
Proxmox VE
```

---

### JAX

Role:

```text
Application Host
AI Platform
```

Primary Services:

- Plex
- Immich
- Audiobookshelf
- Vaultwarden
- ARR Stack
- BookStack
- Nextcloud
- Paperless-ngx

Platform:

```text
Ubuntu Server
Docker
```

---

# Network Architecture

## Address Space

```text
10.0.0.0/16
```

---

## VLAN Architecture

| VLAN | Name | Purpose |
|----------|----------|----------|
| 10 | Infrastructure | Servers and Network Equipment |
| 20 | Trusted | Family Devices |
| 30 | IoT | Smart Devices |
| 40 | Guest | Internet Only |

---

## Security Model

```text
Infrastructure
     ↓
Trusted
     ↓
Services

IoT
     ↓
Internet

Guest
     ↓
Internet
```

---

## Remote Access

Primary Method:

```text
Tailscale
```

Administrative access is permitted from:

- Trusted VLAN
- Tailscale
- Physical Console

---

# Service Architecture

## Day 1 Services

Core services required for initial operation.

### Infrastructure

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

### Media

- Plex
- Audiobookshelf

### Photos

- Immich

---

## Day 2 Services

### Home Automation

- Home Assistant

### Security

- Vaultwarden

### Media Automation

- qBittorrent
- Prowlarr
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Overseerr

### Additional Services

- Navidrome
- Tautulli
- MeTube
- Stirling-PDF

---

## Day 4 Services

### Document Platform

- Paperless-ngx

### File Platform

- Nextcloud

### Synchronization

- Syncthing

### Documentation

- BookStack

---

## AI Platform

Managed separately.

Repository:

```text
My_Local_AI_Config
```

Components include:

- Ollama
- Open WebUI
- Local Models
- Agents
- Future RAG Components

---

# Storage Architecture

## Storage Platform

Platform:

```text
OpenMediaVault
```

Host:

```text
PAX
```

Deployment:

```text
Virtual Machine
```

---

## Storage Structure

```text
/storage
│
├── appdata
├── backups
├── documents
├── downloads
├── media
├── photos
└── homeassistant
```

---

## Data Classification

### Critical

- Immich
- Vaultwarden
- Paperless-ngx
- Nextcloud
- Home Assistant
- BookStack

---

### Important

- Audiobookshelf
- Navidrome
- ARR Services
- Uptime Kuma

---

### Disposable

- Cache Data
- Docker Images
- Temporary Downloads

---

# DNS Architecture

## DNS Platform

Platform:

```text
AdGuard Home
```

---

## High Availability Design

### Primary

```text
10.0.10.50
```

AdGuard Primary

Host:

```text
DAX
```

---

### Secondary

```text
10.0.10.51
```

AdGuard Secondary

Host:

```text
MAX
```

---

## Upstream DNS

### Primary

```text
Quad9
```

### Secondary

```text
Cloudflare
```

---

# Security Architecture

## Authentication

Vaultwarden serves as the credential management platform.

Minimum password length:

```text
16 Characters
```

---

## MFA Requirements

Required:

- Vaultwarden
- Tailscale
- Home Assistant

Optional:

- Immich
- Nextcloud

---

## Internet Exposure

Approved internet-facing service:

```text
Plex
```

All other services should be accessed through:

```text
Tailscale
```

---

## SSH Policy

```text
Disabled Unless Needed
```

Root SSH:

```text
Disabled
```

---

# Monitoring Architecture

## Monitoring Platforms

### Homepage

Purpose:

```text
Dashboard
```

---

### Uptime Kuma

Purpose:

```text
Monitoring
Alerting
Notifications
```

---

## Notification Methods

- Email
- Mobile Notifications

---

## Monitored Components

### Infrastructure

- UDM-Pro
- DAX
- MAX
- PAX
- JAX
- OpenMediaVault

### Core Services

- AdGuard
- Homepage
- Uptime Kuma

### Family Services

- Plex
- Immich
- Audiobookshelf
- Vaultwarden

---

# Backup Architecture

## Platform

```text
Kopia
```

---

## Local Repository

```text
OpenMediaVault
```

---

## Offsite Repository

```text
OneDrive
```

---

## Backup Strategy

Critical Data:

```text
Daily
```

Important Data:

```text
Weekly
```

Low Priority Data:

```text
Monthly
```

---

# Disaster Recovery Strategy

## Recovery Approach

```text
Recoverable
Not Highly Available
```

---

## Recovery Priority 1

- DNS
- Storage
- Immich
- Vaultwarden
- Paperless
- Nextcloud
- Home Assistant

---

## Recovery Priority 2

- Homepage
- Uptime Kuma
- Audiobookshelf

---

## Recovery Priority 3

- Plex
- ARR Stack

---

# Single Points of Failure

| Component | Impact |
|----------|----------|
| UDM-Pro | Network Loss |
| OpenMediaVault | Storage Loss |
| JAX | Service Loss |
| Internet | Remote Access Impact |

---

## Mitigations

| Component | Mitigation |
|----------|----------|
| UDM-Pro | USG Pro Recovery Device |
| DNS | AdGuard HA Pair |
| Data | Kopia Backups |
| Site Loss | OneDrive Offsite Backups |

---

# Documentation Set

## Architecture

- ARCHITECTURE.md
- NETWORK-TOPOLOGY.md
- IP-ADDRESS-PLAN.md
- VLAN-PLAN.md
- FIREWALL-RULES.md
- DNS-ARCHITECTURE.md
- REMOTE-ACCESS.md

---

## Infrastructure

- HARDWARE-INVENTORY.md
- STORAGE-ARCHITECTURE.md
- STORAGE-MAP.md

---

## Services

- SERVICE-INVENTORY.md
- SERVICE-DEPENDENCIES.md

---

## Operations

- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- OPERATIONS-RUNBOOK.md
- MONITORING-AND-ALERTING.md
- SECURITY-BASELINE.md

---

# Success Criteria

The architecture is considered complete when:

- Network segmentation is operational
- Infrastructure services are operational
- Storage platform is operational
- Backup platform is operational
- Monitoring platform is operational
- Security baseline is implemented
- Documentation reflects reality
- Critical recovery procedures are validated

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Architecture Overview |