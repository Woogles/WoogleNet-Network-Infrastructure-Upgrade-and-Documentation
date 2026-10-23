# ARCHITECTURE

## Purpose

This document serves as the authoritative architectural overview for the WoogleNet environment.

It provides a high-level summary of:

- Infrastructure Architecture
- Network Architecture
- Service Architecture
- Storage Architecture
- Security Architecture
- Monitoring Architecture
- Backup & Recovery Architecture
- Documentation Architecture
- Governance Architecture
- Operational Readiness Architecture

This document is intended to be the first document reviewed when understanding the WoogleNet environment.

Detailed implementation information is documented in supporting architecture, operations, security, recovery, and governance documents.

Reference Documents:

- DOCUMENT-INDEX.md
- HARDWARE-INVENTORY.md
- SERVICE-INVENTORY.md
- NETWORK-ARCHITECTURE.md
- STORAGE-ARCHITECTURE.md
- DNS-ARCHITECTURE.md
- VPN-ARCHITECTURE.md

---

# Executive Summary

WoogleNet is a self-hosted family services platform designed to provide:

- Secure Infrastructure
- Network Segmentation
- Family Media Services
- Photo Management
- Password Management
- Document Management
- File Synchronization
- Home Automation
- Centralized Storage
- Backup & Recovery
- Operational Governance

The environment prioritizes:

```text
Simplicity
Security
Recoverability
Documentation
Family Usability
Operational Sustainability
```

over enterprise-scale complexity.

The environment is designed to be:

- Secure
- Recoverable
- Well Documented
- Operationally Manageable
- Certification Ready

---

# Architectural Principles

## Core Principles

1. Simplicity over complexity.
2. Recovery over high availability.
3. Documentation before deployment.
4. Backups before change.
5. Security by default.
6. Tailscale before public exposure.
7. Services should be recoverable.
8. Critical data must be protected.
9. Documentation must reflect reality.
10. Governance must be operationalized.

---

# Environment Overview

## High-Level Architecture

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
Compute Infrastructure
    │
    ▼
Storage Platform
    │
    ▼
Application Services
```

---

# Infrastructure Architecture

## Infrastructure Hosts

| Host | Role | Platform |
|----------|----------|----------|
| DAX | Infrastructure Services | Proxmox VE |
| MAX | Infrastructure Services | Proxmox VE |
| PAX | Storage Services | Proxmox VE |
| JAX | Application Services | Ubuntu Server |

---

## DAX

Purpose:

```text
Infrastructure Host
```

Primary Services:

- AdGuard Primary
- Homepage
- Uptime Kuma

---

## MAX

Purpose:

```text
Infrastructure Host
```

Primary Services:

- AdGuard Secondary
- Home Assistant

---

## PAX

Purpose:

```text
Storage Host
```

Primary Services:

- OpenMediaVault

---

## JAX

Purpose:

```text
Application Host
```

Primary Service Categories:

- Media Platform
- Automation Platform
- Knowledge Platform
- Security Platform
- Backup Platform

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
| 40 | Guest | Internet Access Only |

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
Restricted Access

Guest
     ↓
Internet Only
```

---

## Administrative Access

Approved Administrative Access Methods:

- Trusted VLAN
- Tailscale
- Physical Console

Internet Administrative Access:

```text
Prohibited
```

Reference:

- SSH-STANDARD.md
- VPN-ARCHITECTURE.md

---

# Service Architecture

## Core Infrastructure Platform

Services required for foundational operation.

### Services

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma
- Vaultwarden
- Tailscale

---

## Media Platform

Services supporting media management and consumption.

### Services

- Plex
- Audiobookshelf
- Immich
- Navidrome
- Tautulli
- MeTube

---

## Automation Platform

Services supporting automation and media acquisition.

### Services

- Home Assistant
- qBittorrent
- Prowlarr
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Overseerr
- Gluetun

---

## Knowledge Platform

Services supporting documentation, files, and collaboration.

### Services

- Paperless-ngx
- Nextcloud
- Syncthing
- BookStack
- Stirling-PDF

---

## AI Platform

The AI platform is managed separately.

Repository:

```text
My_Local_AI_Config
```

Managed Components:

- Ollama
- Open WebUI
- Local Models
- Agents
- Future RAG Components

The WoogleNet repository tracks only infrastructure dependencies supporting AI workloads.

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

Status:

```text
Operational
```

---

## Storage Functions

- Application Storage
- Media Storage
- Photo Storage
- Document Storage
- Backup Repository Storage
- Shared Storage

---

## Logical Storage Layout

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

Reference:

- STORAGE-ARCHITECTURE.md
- STORAGE-MAP.md

---

# Security Architecture

## Security Model

The environment follows a layered security model based on:

- Network Segmentation
- Tailscale Access
- MFA Enforcement
- Credential Governance
- Security Auditing
- Recovery Planning

---

## Credential Management

Credential management is provided by:

```text
Vaultwarden
```

Reference:

- CREDENTIAL-MANAGEMENT-STANDARD.md

---

## MFA Requirements

Required Administrative MFA:

- Vaultwarden
- Tailscale
- Home Assistant Administration
- Nextcloud Administration
- Infrastructure Administration

Reference:

- MFA-STANDARD.md

---

## SSH Controls

Internet SSH Exposure:

```text
Prohibited
```

Root SSH:

```text
Disabled
```

Reference:

- SSH-STANDARD.md

---

## Public Exposure

Approved Internet-Facing Service:

```text
Plex
```

All other administrative access should occur through:

```text
Tailscale
```

Reference:

- SECURITY-BASELINE.md

---

# Monitoring Architecture

## Homepage

Purpose:

```text
Operational Dashboard
```

Functions:

- Service Visibility
- Administrative Access
- Service Organization

---

## Uptime Kuma

Purpose:

```text
Monitoring
Alerting
Notifications
```

Functions:

- Availability Monitoring
- Service Health Checks
- Notification Delivery

---

## Monitoring Scope

Infrastructure:

- UDM-Pro
- DAX
- MAX
- PAX
- JAX
- OpenMediaVault

Core Services:

- AdGuard
- Homepage
- Uptime Kuma
- Vaultwarden

Critical Services:

- Home Assistant
- Immich
- Paperless
- Nextcloud
- BookStack

---

# Backup Architecture

## Backup Platform

Platform:

```text
Kopia
```

---

## Repository Strategy

### Local Repository

```text
OpenMediaVault
```

### Offsite Repository

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

Standard Data:

```text
Monthly
```

Reference:

- BACKUP-AND-RESTORE.md

---

# Recovery Architecture

## Design Philosophy

```text
Recoverable
Not Highly Available
```

---

## Recovery Tiers

Reference:

RECOVERY-TIME-OBJECTIVES.md

### Tier 1 Critical Services

- Vaultwarden
- Home Assistant
- Immich
- Paperless
- Nextcloud
- BookStack
- AdGuard

---

### Tier 2 Important Services

- Audiobookshelf
- Navidrome
- Syncthing
- Homepage
- Uptime Kuma

---

### Tier 3 Rebuildable Services

- Plex
- Tautulli
- MeTube
- ARR Services

---

## Recovery Protection

Mechanisms:

- Kopia Backups
- OneDrive Replication
- Restore Testing
- Disaster Recovery Exercises

Reference:

- DISASTER-RECOVERY.md
- BACKUP-AND-RESTORE.md

---

# Documentation Architecture

## Documentation Sources

Authoritative Documentation Locations:

- Git Repository
- BookStack

---

## Documentation Categories

- Program Documentation
- Architecture Documentation
- Infrastructure Documentation
- Service Documentation
- Security Documentation
- Operations Documentation
- Recovery Documentation
- Governance Documentation
- Certification Documentation

Reference:

DOCUMENT-INDEX.md

---

## Documentation Governance

Documentation lifecycle management is governed by:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

# Governance Architecture

## Security Governance

Security governance is provided through:

- SECURITY-BASELINE.md
- MFA-STANDARD.md
- SSH-STANDARD.md
- CREDENTIAL-MANAGEMENT-STANDARD.md
- SECURITY-AUDIT-PROGRAM.md

---

## Documentation Governance

Documentation governance is provided through:

- DOCUMENTATION-GOVERNANCE-STANDARD.md
- DOCUMENT-INDEX.md
- BookStack

---

## Recovery Governance

Recovery governance is provided through:

- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md

---

## Operational Governance

Operational governance is provided through:

- OPERATIONS-RUNBOOK.md
- service-readiness-matrix.md
- operations-readiness-assessment.md

---

# Operational Readiness Architecture

## Validation Model

Operational readiness validation follows:

```text
Service Inventory
        ↓
Service Readiness Matrix
        ↓
Operations Readiness Assessment
        ↓
Disaster Recovery Exercise
        ↓
Production Readiness Review
        ↓
Operational Validation Report
        ↓
Environment Certification
```

---

## Operational Status

| Area | Status |
|----------|----------|
| Infrastructure | ✅ Operational |
| Services | ✅ Operational |
| Monitoring | ✅ Operational |
| Security | ✅ Governed |
| Backup | ✅ Operational |
| Recovery | ✅ Validated |
| Documentation | ✅ Governed |
| Operations | ✅ Validated |

---

# Certification Framework

Operational certification is governed through:

- service-readiness-matrix.md
- operations-readiness-assessment.md
- disaster-recovery-exercise.md
- production-readiness-review.md
- operational-validation-report.md
- ENVIRONMENT-CERTIFICATION.md

The environment architecture is considered fully validated when certification activities are successfully completed.

---

# Single Points of Failure

| Component | Impact | Mitigation |
|----------|----------|----------|
| UDM-Pro | Network Loss | Configuration Backups |
| PAX | Storage Loss | Recovery Procedures |
| OpenMediaVault | Storage Services Loss | Backup Protection |
| JAX | Application Service Loss | Recovery Framework |
| Internet Service | Remote Access Impact | Local Operations Continue |

Reference:

DISASTER-RECOVERY.md

---

# Success Criteria

The architecture is considered complete and operational when:

- Infrastructure Services Are Operational
- Storage Platform Is Operational
- Network Segmentation Is Operational
- Monitoring Platform Is Operational
- Security Governance Is Active
- Documentation Governance Is Active
- Backup Protection Is Operational
- Recovery Procedures Are Validated
- Operational Readiness Reviews Are Complete
- Certification Framework Is Operational

The architecture must continuously reflect the current production environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Updated following completion of Sprint 01-10 implementation, governance, recovery, operational readiness, and certification framework |
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Architecture Overview |