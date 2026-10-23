# Sprint 06 - Productivity & Automation Platform

## Sprint Information

Property | Value
----------|----------
Sprint ID | Sprint 06
Name | Productivity & Automation Platform
Priority | Critical
Status | Complete
Owner | Eric Yacoub

---

# Purpose

Sprint 06 establishes the productivity, automation, media automation, credential management, and VPN-protected download platform for WoogleNet.

This sprint introduces:

- Home Automation
- Password Management
- Media Automation
- Request Management
- Subtitle Automation
- VPN Protected Downloads
- Music Streaming
- Media Analytics
- Document Processing Utilities

The objective is to transform WoogleNet from a collection of standalone services into an integrated automation platform.

---

# Reference Documentation

## Architecture

- automation-architecture.md
- VPN-ARCHITECTURE.md
- SERVICE-DEPENDENCIES.md
- media-automation-workflows.md

## Networking

- IP-ADDRESS-PLAN.md
- VLAN-PLAN.md
- FIREWALL-RULES.md
- DNS-ARCHITECTURE.md
- REMOTE-ACCESS.md

## Security

- SECURITY-BASELINE.md
- docker-standard.md
- secrets-management-standard.md

## Storage

- STORAGE-MAP.md
- STORAGE-ARCHITECTURE.md

---

# Services Deployed

## Home Automation Platform

### max-homeassistant

Host:

MAX

Platform:

VM

Port:

8123/TCP

Purpose:

Home Automation Platform

Documentation:

max-homeassistant.md

Classification:

Critical

---

## Credential Management Platform

### jax-vaultwarden

Host:

JAX

Platform:

Docker

Port:

8080/TCP

Purpose:

Password Management

Documentation:

jax-vaultwarden.md

Classification:

Critical

---

# VPN Platform

## jax-gluetun

Host:

JAX

Platform:

Docker

Purpose:

VPN Gateway

Documentation:

jax-gluetun.md

Classification:

Critical

---

## NordVPN

Purpose:

Secure Download Traffic

Documentation:

nordvpn-configuration.md

Classification:

Critical

---

# Media Automation Platform

## jax-qbittorrent

Host:

JAX

Platform:

Docker

Port:

8081/TCP

Purpose:

Download Client

Documentation:

jax-qbittorrent.md

Classification:

Important

---

## jax-prowlarr

Host:

JAX

Platform:

Docker

Port:

9696/TCP

Purpose:

Indexer Management

Documentation:

jax-prowlarr.md

Classification:

Important

---

## jax-sonarr

Host:

JAX

Platform:

Docker

Port:

8989/TCP

Purpose:

Television Automation

Documentation:

jax-sonarr.md

Classification:

Important

---

## jax-radarr

Host:

JAX

Platform:

Docker

Port:

7878/TCP

Purpose:

Movie Automation

Documentation:

jax-radarr.md

Classification:

Important

---

## jax-lidarr

Host:

JAX

Platform:

Docker

Port:

8686/TCP

Purpose:

Music Automation

Documentation:

jax-lidarr.md

Classification:

Important

---

## jax-readarr

Host:

JAX

Platform:

Docker

Port:

8787/TCP

Purpose:

Ebook And Audiobook Automation

Documentation:

jax-readarr.md

Classification:

Important

---

## jax-bazarr

Host:

JAX

Platform:

Docker

Port:

6767/TCP

Purpose:

Subtitle Management

Documentation:

jax-bazarr.md

Classification:

Important

---

## jax-overseerr

Host:

JAX

Platform:

Docker

Port:

5055/TCP

Purpose:

Media Requests

Documentation:

jax-overseerr.md

Classification:

Important

---

# Media Consumption Services

## jax-navidrome

Host:

JAX

Platform:

Docker

Port:

4533/TCP

Purpose:

Music Streaming

Documentation:

jax-navidrome.md

Classification:

Important

---

## jax-metube

Host:

JAX

Platform:

Docker

Port:

8082/TCP

Purpose:

Manual Media Downloads

Documentation:

jax-metube.md

Classification:

Low

---

## jax-tautulli

Host:

JAX

Platform:

Docker

Port:

8181/TCP

Purpose:

Plex Analytics Platform

Documentation:

jax-tautulli.md

Classification:

Important

---

# Utility Services

## jax-stirlingpdf

Host:

JAX

Platform:

Docker

Port:

8083/TCP

Purpose:

Document Processing Platform

Documentation:

jax-stirlingpdf.md

Classification:

Low

---

# User And Permission Standards

All Sprint 06 Docker services should use the standardized service account model.

User:

media

Group:

media

Recommended PUID:

1000

Recommended PGID:

1000

Purpose:

- Consistent File Ownership
- Simplified Storage Management
- Simplified Backup Operations
- Consistent Docker Permissions
- Reduced Operational Complexity

Services Subject To This Standard:

- jax-vaultwarden
- jax-gluetun
- jax-qbittorrent
- jax-prowlarr
- jax-sonarr
- jax-radarr
- jax-lidarr
- jax-readarr
- jax-bazarr
- jax-overseerr
- jax-navidrome
- jax-metube
- jax-tautulli
- jax-stirlingpdf

---

# Network Requirements

## Access Policy

Allowed Access:

- Trusted VLAN
- Tailscale

Administrative Access:

- Trusted VLAN
- Tailscale

Public Internet Access:

Not Permitted

Exception:

Plex

Reference:

REMOTE-ACCESS.md

---

## DNS Standard

Required DNS Servers:

Primary DNS:

10.0.10.50

Secondary DNS:

10.0.10.51

Provided By:

- AdGuard Primary
- AdGuard Secondary

Reference:

DNS-ARCHITECTURE.md

---

## VPN Protected Traffic

Protected Through VPN:

- qBittorrent

Traffic Flow:

qBittorrent
↓
Gluetun
↓
NordVPN
↓
Internet

No other services should be routed through the VPN tunnel.

Reference:

VPN-ARCHITECTURE.md

---

# Security Requirements

## Authentication

MFA Required:

- Home Assistant
- Vaultwarden

MFA Recommended:

- All Administrative Accounts

---

## Secrets Management

Secrets Storage:

Vaultwarden

Allowed:

- Vaultwarden
- Local .env Files

Prohibited:

- Repository Storage
- Compose Files
- Documentation Files
- Screenshots

Reference:

secrets-management-standard.md

---

## Remote Administration

Approved Methods:

- Trusted VLAN
- Tailscale
- Physical Console

Direct Internet Access:

Prohibited

Reference:

SECURITY-BASELINE.md

---

## Container Security

Requirements:

- Non-Root Execution When Supported
- Strong Credentials
- Quarterly Review
- Container Monitoring
- Log Review

Reference:

docker-standard.md

---

# Storage Standards

Application Data:

/storage/appdata

Downloads:

/storage/downloads

Movies:

/storage/media/movies

Television:

/storage/media/tv

Music:

/storage/media/music

Audiobooks:

/storage/media/audiobooks

Ebooks:

/storage/media/ebooks

Reference:

STORAGE-MAP.md

---

# Monitoring Requirements

All Sprint 06 services must be:

- Added To Homepage
- Added To Uptime Kuma
- Included In Backup Validation
- Included In Operational Reviews

Monitor:

- Service Availability
- Container Health
- Storage Availability
- VPN Connectivity
- Application Health

Reference:

MONITORING-AND-ALERTING.md

---

# Deliverables

## Service Documentation

- max-homeassistant.md
- jax-vaultwarden.md
- jax-gluetun.md
- nordvpn-configuration.md
- jax-qbittorrent.md
- jax-prowlarr.md
- jax-sonarr.md
- jax-radarr.md
- jax-lidarr.md
- jax-readarr.md
- jax-bazarr.md
- jax-overseerr.md
- jax-navidrome.md
- jax-metube.md
- jax-tautulli.md
- jax-stirlingpdf.md

## Operational Documentation

- media-automation-workflows.md
- validation-checklist.md
- rollback-procedure.md

---

# Success Criteria

Sprint 06 is complete when:

- Home Assistant Operational
- Vaultwarden Operational
- VPN Protection Operational
- ARR Platform Operational
- Bazarr Operational
- Overseerr Operational
- Navidrome Operational
- MeTube Operational
- Tautulli Operational
- Stirling-PDF Operational
- Monitoring Operational
- Backup Protection Enabled
- Security Standards Applied
- Validation Checklist Passed
- Documentation Updated

---

# Exit Criteria

Sprint 06 cannot be closed until:

- VPN Validation Successful
- Home Assistant Validation Successful
- Vaultwarden Validation Successful
- Media Request Workflow Functional
- Download Workflow Functional
- Import Workflow Functional
- Subtitle Workflow Functional
- Monitoring Operational
- Security Validation Complete
- Backup Validation Complete
- Validation Checklist Completed
- Evidence Collected
- Documentation Approved

---

# Sprint Outcome

Sprint 06 establishes the operational foundation for:

- Sprint 07 Knowledge Platform
- Sprint 08 Backup & Recovery
- Sprint 09 Security Hardening
- Sprint 10 Operations Readiness

The environment transitions from basic infrastructure and media services to a fully integrated automation platform capable of secure media acquisition, automated content management, credential management, home automation, analytics, and utility services with minimal administrator intervention.