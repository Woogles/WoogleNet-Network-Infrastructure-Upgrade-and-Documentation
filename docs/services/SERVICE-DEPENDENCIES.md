# Service Dependencies

## Purpose

This document defines service relationships and dependencies within the WoogleNet environment.

The goals of this document are to:

- Identify service dependencies
- Improve troubleshooting
- Simplify recovery operations
- Support disaster recovery planning
- Support monitoring configuration
- Identify critical failure points

This document should be reviewed whenever services are added, removed, or relocated.

---

# Dependency Levels

## Critical Dependency

If the dependency fails, the service becomes unavailable.

Example:

```text
Vaultwarden
    →
Storage
```

---

## Important Dependency

The service may function with reduced capabilities.

Example:

```text
Homepage
    →
Uptime Kuma
```

---

## Optional Dependency

Provides enhanced functionality but is not required.

Example:

```text
Plex
    →
Tautulli
```

---

# Infrastructure Dependency Tree

```text
Internet
    │
    ▼
UDM-Pro
    │
    ▼
Switching
    │
    ▼
DNS
    │
    ▼
Storage
    │
    ▼
Services
```

---

# Core Infrastructure Dependencies

## UDM-Pro

### Depends On

None

### Required By

- VLANs
- DHCP
- Routing
- Internet Access
- Tailscale Routing

### Impact if Failed

```text
Complete Network Outage
```

---

## Switching Infrastructure

### Depends On

- UDM-Pro

### Required By

- All Servers
- All Access Points
- All Clients

### Impact if Failed

```text
Loss Of Connected Devices
```

---

## DNS Platform

### Components

- AdGuard Primary
- AdGuard Secondary

### Depends On

- DAX
- MAX
- Network Connectivity

### Required By

- All Services
- All Clients
- Tailscale

### Impact if Failed

```text
Major Service Disruption
```

---

# Storage Dependencies

## OpenMediaVault

### Depends On

- PAX
- Storage Subsystem
- Networking

### Required By

- Immich
- Paperless
- Nextcloud
- Audiobookshelf
- ARR Stack
- Plex
- BookStack

### Impact if Failed

```text
Major Application Outage
```

---

# Service Dependency Matrix

| Service | DNS | Storage | Tailscale | Database | Internet |
|----------|----------|----------|----------|----------|----------|
| AdGuard | No | No | No | No | Optional |
| Homepage | Yes | Yes | No | No | No |
| Uptime Kuma | Yes | Yes | No | Yes | No |
| Plex | Yes | Yes | Optional | No | Optional |
| Audiobookshelf | Yes | Yes | Optional | No | No |
| Immich | Yes | Yes | Optional | Yes | No |
| Vaultwarden | Yes | Yes | Optional | Yes | No |
| Home Assistant | Yes | Yes | Optional | Yes | Optional |
| Nextcloud | Yes | Yes | Optional | Yes | No |
| Paperless-ngx | Yes | Yes | Optional | Yes | No |
| BookStack | Yes | Yes | Optional | Yes | No |

---

# Day 1 Services

## AdGuard Home

### Dependencies

```text
DAX / MAX
    ↓
Network
```

### Dependency Chain

```text
UDM-Pro
    ↓
Switch
    ↓
AdGuard
```

---

## Homepage

### Dependencies

```text
DNS
Storage
Network
```

### Internal Dependencies

Optional:

```text
Uptime Kuma
```

---

## Uptime Kuma

### Dependencies

```text
DNS
Storage
Network
```

---

## Plex

### Dependencies

```text
Storage
Network
DNS
```

### Optional Dependencies

```text
Internet
Tautulli
```

---

## Audiobookshelf

### Dependencies

```text
Storage
Network
DNS
```

---

## Immich

### Critical Dependencies

```text
Storage
Database
DNS
Network
```

### Failure Impact

```text
Photo Backup Failure
```

### Data Classification

```text
Critical
```

---

# Day 2 Services

## Home Assistant

### Dependencies

```text
DNS
Storage
Network
```

### Dependent Systems

```text
IoT Devices
```

### Failure Impact

```text
Home Automation Loss
```

---

## Vaultwarden

### Critical Dependencies

```text
DNS
Storage
Database
Network
```

### Failure Impact

```text
Password Management Unavailable
```

### Data Classification

```text
Critical
```

---

## qBittorrent

### Dependencies

```text
Storage
Internet
DNS
```

---

## ARR Stack

### Components

- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Overseerr

---

### Shared Dependencies

```text
Storage
DNS
Internet
qBittorrent
```

---

### Dependency Chain

```text
Prowlarr
     ↓
Sonarr/Radarr/Lidarr/Readarr
     ↓
qBittorrent
     ↓
Storage
```

---

## Navidrome

### Dependencies

```text
Storage
DNS
```

---

## Tautulli

### Dependencies

```text
Plex
DNS
```

### Impact

If Plex fails:

```text
Tautulli Fails
```

---

# Day 4 Services

## Paperless-ngx

### Critical Dependencies

```text
Storage
Database
DNS
```

### Failure Impact

```text
Document Access Lost
```

### Data Classification

```text
Critical
```

---

## Nextcloud

### Critical Dependencies

```text
Storage
Database
DNS
```

### Failure Impact

```text
File Access Lost
```

### Data Classification

```text
Critical
```

---

## BookStack

### Critical Dependencies

```text
Storage
Database
DNS
```

### Failure Impact

```text
Documentation Access Lost
```

### Data Classification

```text
Critical
```

---

## Syncthing

### Dependencies

```text
DNS
Storage
Network
```

---

# Monitoring Dependencies

## Uptime Kuma Monitors

### Infrastructure

- UDM-Pro
- DAX
- MAX
- PAX
- JAX
- OpenMediaVault

---

### Services

- AdGuard Primary
- AdGuard Secondary
- Plex
- Immich
- Vaultwarden
- Home Assistant
- Paperless
- Nextcloud
- BookStack

---

# Tailscale Dependencies

## Services Accessible Through Tailscale

- Homepage
- Uptime Kuma
- Vaultwarden
- Home Assistant
- Nextcloud
- Paperless-ngx
- BookStack
- Immich
- Audiobookshelf

---

## Depends On

```text
Internet
DNS
Tailscale Control Plane
```

---

# Database Dependencies

## Services With Internal Databases

- Immich
- Vaultwarden
- Home Assistant
- Paperless-ngx
- Nextcloud
- BookStack
- Uptime Kuma

---

## Strategy

```text
Per-Service Databases

No Shared Database Platform
```

---

# Critical Failure Domains

## DNS Failure

Affected:

- Most Services
- Most Clients

Severity:

```text
High
```

---

## OpenMediaVault Failure

Affected:

- Immich
- Plex
- Audiobookshelf
- Nextcloud
- Paperless
- ARR Stack
- BookStack

Severity:

```text
Critical
```

---

## JAX Failure

Affected:

- Plex
- Audiobookshelf
- Immich
- Vaultwarden
- ARR Stack
- BookStack
- Nextcloud
- Paperless

Severity:

```text
Critical
```

---

## UDM-Pro Failure

Affected:

```text
Entire Environment
```

Severity:

```text
Critical
```

---

# Restore Order

## Priority 1

- UDM-Pro
- Switching
- DNS
- OpenMediaVault

---

## Priority 2

- Vaultwarden
- Immich
- Paperless
- Nextcloud
- Home Assistant

---

## Priority 3

- BookStack
- AudioBookshelf
- Homepage
- Uptime Kuma

---

## Priority 4

- Plex
- ARR Stack
- Tautulli
- MeTube

---

# Single Points of Failure

## Current

| Component | Impact |
|------------|----------|
| UDM-Pro | Network Outage |
| OpenMediaVault | Storage Outage |
| JAX | Service Outage |
| Internet | Remote Access Impact |

---

## Mitigations

| Component | Mitigation |
|------------|----------|
| UDM-Pro | USG Pro Backup |
| DNS | AdGuard HA Pair |
| Services | Backups |
| Data | Kopia + OneDrive |

---

# Future Improvements

## Potential Enhancements

- Additional Storage Host
- Secondary JAX Equivalent
- Automated Dependency Monitoring
- Automated Recovery Validation

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Service Dependency Visualization | Future |
| Automated Dependency Mapping | Future |
| Dependency-Based Alerting | Future |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Service Dependency Documentation |