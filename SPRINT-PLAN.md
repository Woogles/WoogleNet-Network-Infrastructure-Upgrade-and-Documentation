# Sprint Plan

## Purpose

This document defines the deployment roadmap for the WoogleNet environment.

The goals of this plan are:

- Build infrastructure in a logical order
- Reduce deployment risk
- Ensure documentation remains accurate
- Produce usable services early
- Avoid rework
- Maintain operational stability

This document should be considered the authoritative deployment roadmap for the project.

---

# Project Objectives

## Primary Goals

- Build a segmented and secure home network
- Deploy infrastructure services
- Deploy storage services
- Deploy media services
- Deploy family services
- Deploy backup and recovery systems
- Enable remote management through Tailscale

---

## Secondary Goals

- Support future AI workloads
- Support home automation
- Support family media access
- Support personal document management
- Support future experimentation

---

# Current State

## Installed

### Network

- UDM-Pro
- TP-Link TL-SG1024DE Switches
- UniFi AC LR Access Points
- UniFi AC Pro Access Points

### Power

- Tripp Lite SMART1500LCD UPS Units
- APC Back-UPS Pro UPS Units

### Hardware

- DAX
- MAX
- PAX
- JAX

---

## Not Yet Deployed

### Infrastructure

- Proxmox
- OpenMediaVault
- DNS Platform
- Monitoring

### Services

- Immich
- Plex
- Audiobookshelf
- Home Assistant
- Vaultwarden
- Nextcloud
- Paperless-ngx

---

# Sprint 0 - Discovery and Validation

## Goal

Establish a known-good baseline and validate documentation.

---

## Tasks

### Documentation

- Validate Hardware Inventory
- Validate Service Inventory
- Validate Network Documentation
- Validate Storage Documentation

### Infrastructure

- Inventory Server Hardware
- Inventory Network Hardware
- Inventory UPS Hardware

### Configuration Exports

- Export UDM-Pro Configuration
- Export TP-Link Configurations
- Export UniFi Configuration

---

## Acceptance Criteria

- Hardware verified
- Documentation verified
- Configuration backups exist

---

# Sprint 1 - Network Foundation

## Goal

Deploy VLANs and core network segmentation.

---

## Tasks

### VLAN Configuration

- Create Infrastructure VLAN (10)
- Create Trusted VLAN (20)
- Create IoT VLAN (30)
- Create Guest VLAN (40)

### DHCP Configuration

- Trusted Network
- IoT Network
- Guest Network

### Wireless Configuration

#### SSIDs

- WoogleNet
- WoogleNet-IoT
- WoogleNet-Guest

### Firewall

- Infrastructure Rules
- Trusted Rules
- IoT Rules
- Guest Rules

---

## Validation

- Trusted Devices Work
- IoT Isolation Works
- Guest Isolation Works

---

## Acceptance Criteria

- VLANs Functional
- Firewall Functional
- Wireless Functional

---

# Sprint 2 - Proxmox Platform

## Goal

Deploy virtualization infrastructure.

---

## DAX

### Tasks

- Install Proxmox
- Configure Networking
- Configure Storage
- Configure Tailscale

---

## MAX

### Tasks

- Install Proxmox
- Configure Networking
- Configure Storage
- Configure Tailscale

---

## PAX

### Tasks

- Install Proxmox
- Configure Networking
- Configure Storage
- Configure Tailscale

---

## Validation

- All Hosts Reachable
- Tailscale Functional
- Backups Configured

---

## Acceptance Criteria

- Three Operational Proxmox Hosts

---

# Sprint 3 - Core Infrastructure Services

## Goal

Deploy management and monitoring services.

---

## DNS

### AdGuard Primary

Host:

```text
DAX
```

Platform:

```text
LXC
```

---

### AdGuard Secondary

Host:

```text
MAX
```

Platform:

```text
LXC
```

---

## Monitoring

### Homepage

Host:

```text
DAX
```

Platform:

```text
LXC
```

---

### Uptime Kuma

Host:

```text
DAX
```

Platform:

```text
LXC
```

---

## Tailscale

Deploy To:

- DAX
- MAX
- PAX
- JAX

---

## Validation

- DNS Functional
- Monitoring Functional
- Remote Access Functional

---

## Acceptance Criteria

- Infrastructure Services Operational

---

# Sprint 4 - Storage Platform

## Goal

Deploy centralized storage.

---

## OpenMediaVault

Host:

```text
PAX
```

Platform:

```text
VM
```

---

## Tasks

- Deploy OMV VM
- Configure Storage
- Configure Shares
- Configure Backup Repository

---

## Storage Layout

Create:

```text
/storage/appdata
/storage/backups
/storage/documents
/storage/downloads
/storage/media
/storage/photos
/storage/homeassistant
```

---

## Acceptance Criteria

- Shared Storage Available
- Backup Repository Available

---

# Sprint 5 - Day 1 Services

## Goal

Deploy core family-facing services.

---

## JAX Preparation

- Install Ubuntu
- Install Docker
- Configure Storage Mounts
- Configure Tailscale

---

## Plex

Priority:

```text
Important
```

---

## Audiobookshelf

Priority:

```text
Important
```

---

## Immich

Priority:

```text
Critical
```

---

## Monitoring

Add:

- Plex
- Audiobookshelf
- Immich

to Homepage and Uptime Kuma.

---

## Acceptance Criteria

- Media Platform Operational
- Photo Backup Operational

---

# Sprint 6 - Day 2 Services

## Goal

Deploy automation and family services.

---

## Home Assistant

Host:

```text
MAX
```

Platform:

```text
VM
```

---

## Vaultwarden

Host:

```text
JAX
```

Platform:

```text
Docker
```

---

## ARR Stack

Deploy:

- qBittorrent
- Prowlarr
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Overseerr

---

## Additional Services

- Navidrome
- MeTube
- Tautulli
- Stirling-PDF

---

## Acceptance Criteria

- Home Automation Operational
- Password Management Operational
- Media Automation Operational

---

# Sprint 7 - Knowledge Platform

## Goal

Deploy document and file services.

---

## Services

### Paperless-ngx

Priority:

```text
Critical
```

---

### Nextcloud

Priority:

```text
Critical
```

---

### Syncthing

Priority:

```text
Important
```

---

### BookStack

Priority:

```text
Critical
```

---

## Acceptance Criteria

- Document Management Operational
- File Synchronization Operational
- Knowledge Base Operational

---

# Sprint 8 - Backup and Recovery

## Goal

Deploy backup platform and validate recovery.

---

## Kopia

- Install Kopia
- Create Repository
- Test Local Backups

---

## OneDrive

- Configure Offsite Backups
- Test Uploads

---

## Restore Testing

### Required

- Immich
- Vaultwarden
- Home Assistant
- Paperless-ngx

---

## Acceptance Criteria

- Backups Successful
- Restores Verified

---

# Sprint 9 - Security Hardening

## Goal

Implement security baseline.

---

## Tasks

### MFA

Enable:

- Vaultwarden
- Tailscale
- Home Assistant

---

### SSH

- Disable Root SSH
- Disable Unused SSH Services

---

### Security Review

- User Review
- Password Review
- Tailscale Review

---

## Acceptance Criteria

- Security Baseline Met

---

# Sprint 10 - Operations Readiness

## Goal

Transition to steady-state operations.

---

## Tasks

### Monitoring

- Validate Monitoring
- Validate Alerts

### Backup

- Validate Jobs
- Validate Retention

### Documentation

- Final Documentation Review
- Publish BookStack Copies
- Create PDF Archive

---

## Acceptance Criteria

- Environment Fully Operational
- Documentation Complete
- Backups Validated
- Monitoring Validated

---

# AI Platform

## Managed Separately

Repository:

```text
My_Local_AI_Config
```

Reference Implementation:

- Ollama
- Open WebUI
- AI Models
- Agents
- RAG Components

Tracked outside of WoogleNet deployment.

---

# Success Criteria

The project is complete when:

- VLANs are operational
- Core services are operational
- Storage platform is operational
- Backup platform is operational
- Monitoring is operational
- Security baseline is met
- Documentation reflects reality
- Family services are available
- Disaster recovery procedures are validated

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Rebuilt sprint plan aligned with approved architecture |