# STORAGE-ARCHITECTURE

## Purpose

This document serves as the authoritative storage architecture reference for the WoogleNet environment.

The purpose of this document is to:

- Define storage design
- Define storage ownership
- Define storage allocation
- Define data classification
- Define backup requirements
- Define recovery requirements
- Support operational readiness reviews
- Support disaster recovery planning
- Support certification activities

The storage platform provides centralized data services for all production systems within WoogleNet.

Reference Documents:

- ARCHITECTURE.md
- HARDWARE-INVENTORY.md
- SERVICE-INVENTORY.md
- STORAGE-MAP.md
- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md

---

# Design Principles

The storage architecture is built on the following principles:

1. Centralized Storage
2. Data Protection First
3. Backup Before Change
4. Simplicity Over Complexity
5. Recovery Over High Availability
6. Shared Storage Where Appropriate
7. Documentation Must Reflect Reality

---

# Storage Overview

## High-Level Architecture

```text
Applications
      │
      ▼
Shared Storage
(OpenMediaVault)
      │
      ▼
Backup Repository
(Kopia)
      │
      ▼
Offsite Replication
(OneDrive)
```

---

# Storage Platform

## Primary Storage Platform

| Property | Value |
|----------|----------|
| Platform | OpenMediaVault |
| Host | PAX |
| Deployment Type | Virtual Machine |
| Status | Operational |
| Monitoring | Enabled |
| Backup Coverage | Enabled |
| Recovery Classification | Tier 1 |

Purpose:

- Centralized Storage
- Application Data
- Media Storage
- Documents
- Backups
- Shared File Storage

Reference:

SERVICE-INVENTORY.md

---

# Storage Functions

The storage platform provides the following functions.

## Application Storage

Stores:

- Container Volumes
- Application Configuration
- Databases
- Service Data

---

## Media Storage

Stores:

- Movies
- Television
- Music
- Audiobooks

---

## Photo Storage

Stores:

- Family Photos
- Mobile Uploads
- Image Archives

---

## Document Storage

Stores:

- Paperless Archives
- BookStack Assets
- Nextcloud Data
- General Documents

---

## Backup Storage

Stores:

- Kopia Repository
- Recovery Archives
- Configuration Backups

---

# Storage Layout

## Logical Structure

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

STORAGE-MAP.md

---

# Service Storage Mapping

## Core Infrastructure Services

| Service | Storage Required |
|----------|----------|
| AdGuard | Yes |
| Homepage | Yes |
| Uptime Kuma | Yes |
| Vaultwarden | Yes |

---

## Media Platform

| Service | Storage Location |
|----------|----------|
| Plex | media |
| Audiobookshelf | media |
| Immich | photos |
| Navidrome | media |
| Tautulli | appdata |
| MeTube | downloads |

---

## Automation Platform

| Service | Storage Location |
|----------|----------|
| Home Assistant | homeassistant |
| qBittorrent | downloads |
| Sonarr | media |
| Radarr | media |
| Lidarr | media |
| Readarr | media |
| Bazarr | appdata |
| Prowlarr | appdata |
| Overseerr | appdata |
| Gluetun | appdata |

---

## Knowledge Platform

| Service | Storage Location |
|----------|----------|
| Paperless-ngx | documents |
| Nextcloud | documents |
| Syncthing | documents |
| BookStack | appdata |
| Stirling-PDF | documents |

Reference:

SERVICE-INVENTORY.md

---

# Data Classification

## Critical Data

Loss or corruption would significantly impact operations or family data.

### Services

- Vaultwarden
- Immich
- Home Assistant
- Paperless-ngx
- Nextcloud
- BookStack

Backup Frequency:

```text
Daily
```

Recovery Priority:

```text
Tier 1
```

---

## Important Data

Loss impacts functionality but recovery urgency is lower.

### Services

- Audiobookshelf
- Navidrome
- Syncthing
- Homepage
- Uptime Kuma

Backup Frequency:

```text
Weekly
```

Recovery Priority:

```text
Tier 2
```

---

## Standard Data

Important but recoverable with limited operational impact.

### Services

- Plex
- Tautulli
- Arr Platform

Backup Frequency:

```text
Weekly
```

Recovery Priority:

```text
Tier 3
```

---

## Rebuildable Data

May be recreated without restore.

Examples:

- Docker Images
- Cache Data
- Temporary Downloads
- Application Cache

Backup Frequency:

```text
Optional
```

Recovery Priority:

```text
Best Effort
```

---

# Backup Architecture

## Backup Platform

Platform:

```text
Kopia
```

Purpose:

- Encrypted Backups
- Versioning
- Recovery Support
- Validation Testing

---

## Local Repository

Location:

```text
OpenMediaVault
```

Purpose:

- Primary Backup Repository

---

## Offsite Protection

Platform:

```text
Microsoft OneDrive
```

Purpose:

- Disaster Recovery
- Site Loss Protection
- Offsite Retention

Reference:

BACKUP-AND-RESTORE.md

---

# Recovery Architecture

## Recovery Philosophy

```text
Recoverable
Not Highly Available
```

Storage recovery is prioritized over redundancy complexity.

---

## Storage Recovery Priority

### Tier 1

Recover First:

- OpenMediaVault
- Storage Shares
- Backup Repository

---

### Tier 2

Recover Second:

- Application Data
- Media Services
- Knowledge Platform

---

### Tier 3

Recover Third:

- Rebuildable Services
- Temporary Storage

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Capacity Management

## Monitoring Requirements

Monitor:

- Capacity Utilization
- Disk Health
- Share Availability
- Storage Performance
- Backup Repository Health

Platform:

```text
Uptime Kuma
```

---

## Capacity Thresholds

### Warning

```text
80% Utilization
```

---

### Critical

```text
90% Utilization
```

Storage expansion planning should begin before critical thresholds are reached.

---

# Security Architecture

## Access Control

Storage access is controlled through:

- Network Segmentation
- Service Permissions
- Administrative Controls
- Tailscale Access

Reference:

SECURITY-BASELINE.md

---

## Administrative Access

Permitted Through:

```text
Trusted VLAN
Tailscale
Physical Console
```

Reference:

VPN-ARCHITECTURE.md

---

## Credential Management

Administrative storage credentials must be stored in:

```text
Vaultwarden
```

Reference:

CREDENTIAL-MANAGEMENT-STANDARD.md

---

# Monitoring Architecture

## Monitored Components

Monitor:

- PAX
- OpenMediaVault
- Storage Shares
- Disk Health
- Backup Repository
- OneDrive Replication

---

## Alert Conditions

Generate alerts for:

- Low Disk Space
- Failed Storage Mounts
- Disk Failures
- Repository Failures
- Replication Failures

---

# Disaster Recovery Considerations

## Critical Dependencies

Storage depends upon:

```text
Network
      ↓
PAX
      ↓
OpenMediaVault
      ↓
Storage Shares
      ↓
Applications
```

Reference:

SERVICE-DEPENDENCIES.md

---

## Single Points of Failure

| Component | Impact | Mitigation |
|----------|----------|----------|
| PAX | Storage Platform Loss | Recovery Procedures |
| OpenMediaVault | Storage Service Loss | Recovery Documentation |
| Disk Failure | Capacity Reduction | Monitoring & Replacement |
| OneDrive | Offsite Protection Loss | Local Repository Retained |

Reference:

DISASTER-RECOVERY.md

---

# Operational Readiness Requirements

Storage validation occurs during:

- Service Readiness Reviews
- Backup Validation Reviews
- Restore Testing Exercises
- Disaster Recovery Exercises
- Production Readiness Reviews
- Certification Reviews

Reference Documents:

- service-readiness-matrix.md
- operations-readiness-assessment.md
- disaster-recovery-exercise.md
- production-readiness-review.md
- ENVIRONMENT-CERTIFICATION.md

---

# Certification Requirements

Storage certification requires:

- OpenMediaVault Operational
- Share Availability Verified
- Backup Repository Operational
- Offsite Replication Operational
- Restore Validation Current
- Monitoring Operational
- Capacity Managed

Reference:

ENVIRONMENT-CERTIFICATION.md

---

# Success Criteria

The storage architecture is considered operational when:

- OpenMediaVault Is Operational
- Storage Shares Are Available
- Backup Repository Is Healthy
- Offsite Replication Is Functional
- Backup Validation Is Current
- Restore Validation Is Current
- Monitoring Is Operational
- Documentation Reflects Reality

Storage is a Tier 1 infrastructure service and must remain protected to support all dependent platforms.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial storage architecture aligned with Sprint 01-10 implementation, recovery framework, operational readiness model, and certification program |