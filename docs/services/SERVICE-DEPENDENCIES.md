# SERVICE-DEPENDENCIES

## Purpose

This document serves as the authoritative dependency map for all services operating within the WoogleNet environment.

The purpose of this document is to:

- Document service relationships
- Identify operational dependencies
- Support troubleshooting
- Support recovery planning
- Support disaster recovery operations
- Support operational readiness reviews
- Support certification activities

This document answers:

> What services depend on other services to operate correctly?

Reference Documents:

- ARCHITECTURE.md
- SERVICE-INVENTORY.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md
- service-readiness-matrix.md

---

# Dependency Classification

## Critical Dependency

Service cannot function without the dependency.

Examples:

- Immich → Database
- Nextcloud → Storage

---

## Required Dependency

Service functionality is significantly degraded without the dependency.

Examples:

- Homepage → DNS
- Uptime Kuma → DNS

---

## Optional Dependency

Service remains functional but loses enhanced capabilities.

Examples:

- Services → Homepage
- Services → Tautulli

---

# Infrastructure Dependency Stack

All services ultimately depend upon the following infrastructure chain:

```text
Internet
    ↓
UDM-Pro
    ↓
Switching Infrastructure
    ↓
DNS
    ↓
Storage Platform
    ↓
Application Services
```

Infrastructure recovery follows the same order.

Reference:

DISASTER-RECOVERY.md

---

# Core Infrastructure Dependencies

## AdGuard Primary

Host:

```text
DAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| DAX | Critical |
| Network Connectivity | Critical |
| Upstream DNS Providers | Required |

Supports:

- All Infrastructure Hosts
- All Application Services
- Client Name Resolution

---

## AdGuard Secondary

Host:

```text
MAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| MAX | Critical |
| Network Connectivity | Critical |
| Upstream DNS Providers | Required |

Supports:

- Redundant DNS Services

---

## Homepage

Host:

```text
DAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| DNS Resolution | Required |
| DAX | Critical |

Supports:

- Administrative Visibility

---

## Uptime Kuma

Host:

```text
DAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| DNS Resolution | Required |
| Email Notifications | Optional |
| DAX | Critical |

Supports:

- Availability Monitoring
- Alerting
- Service Health Visibility

---

## Tailscale

Host:

```text
All Hosts
```

Depends On:

| Dependency | Type |
|------------|------------|
| Internet Connectivity | Required |
| Tailscale Control Plane | Required |

Supports:

- Secure Remote Access
- Administrative Connectivity

---

## Vaultwarden

Host:

```text
JAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| Storage Platform | Critical |
| DNS Resolution | Required |

Supports:

- Credential Management
- Administrative Access

Recovery Priority:

```text
Tier 1
```

---

# Storage Dependencies

## OpenMediaVault

Host:

```text
PAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| PAX | Critical |
| Physical Storage | Critical |
| Network Connectivity | Required |

Supports:

- Application Storage
- Media Storage
- Backup Storage
- Shared Storage

---

## Kopia

Host:

```text
JAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| OpenMediaVault | Critical |
| Storage Repository | Critical |
| OneDrive Replication | Optional |

Supports:

- Backup Protection
- Disaster Recovery

Recovery Priority:

```text
Tier 1
```

---

# Media Platform Dependencies

## Plex

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Critical |
| Media Storage | Critical |
| DNS Resolution | Required |

---

## Audiobookshelf

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Critical |
| Audiobook Storage | Critical |

---

## Immich

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Critical |
| Photo Storage | Critical |
| Database | Critical |
| DNS Resolution | Required |

Recovery Priority:

```text
Tier 1
```

---

## Navidrome

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Critical |
| Music Storage | Critical |

---

## Tautulli

Depends On:

| Dependency | Type |
|------------|------------|
| Plex | Critical |
| JAX | Required |

---

## MeTube

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Required |

---

# Automation Platform Dependencies

## Home Assistant

Host:

```text
MAX
```

Depends On:

| Dependency | Type |
|------------|------------|
| MAX | Critical |
| DNS Resolution | Required |
| VLAN Connectivity | Required |

Recovery Priority:

```text
Tier 1
```

---

## qBittorrent

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| Gluetun | Critical |
| Storage Platform | Critical |

---

## Gluetun

Depends On:

| Dependency | Type |
|------------|------------|
| VPN Provider | Critical |
| Internet Connectivity | Critical |

Supports:

- qBittorrent
- ARR Platform

---

## Prowlarr

Depends On:

| Dependency | Type |
|------------|------------|
| DNS Resolution | Required |
| Internet Connectivity | Required |
| JAX | Critical |

Supports:

- Sonarr
- Radarr
- Lidarr
- Readarr

---

## Sonarr

Depends On:

| Dependency | Type |
|------------|------------|
| Prowlarr | Required |
| qBittorrent | Required |
| Storage Platform | Critical |

---

## Radarr

Depends On:

| Dependency | Type |
|------------|------------|
| Prowlarr | Required |
| qBittorrent | Required |
| Storage Platform | Critical |

---

## Lidarr

Depends On:

| Dependency | Type |
|------------|------------|
| Prowlarr | Required |
| qBittorrent | Required |
| Storage Platform | Critical |

---

## Readarr

Depends On:

| Dependency | Type |
|------------|------------|
| Prowlarr | Required |
| qBittorrent | Required |
| Storage Platform | Critical |

---

## Bazarr

Depends On:

| Dependency | Type |
|------------|------------|
| Sonarr | Required |
| Radarr | Required |

---

## Overseerr

Depends On:

| Dependency | Type |
|------------|------------|
| Plex | Required |
| Sonarr | Required |
| Radarr | Required |

---

# Knowledge Platform Dependencies

## Paperless-ngx

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Critical |
| Database | Critical |

Recovery Priority:

```text
Tier 1
```

---

## Nextcloud

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Critical |
| Database | Critical |

Recovery Priority:

```text
Tier 1
```

---

## Syncthing

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| OpenMediaVault | Critical |

---

## BookStack

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| Database | Critical |
| Storage Platform | Critical |

Recovery Priority:

```text
Tier 1
```

---

## Stirling-PDF

Depends On:

| Dependency | Type |
|------------|------------|
| JAX | Critical |
| Storage Platform | Required |

---

# Recovery Dependency Chain

Infrastructure recovery should occur in the following order:

```text
Network
    ↓
DNS
    ↓
Storage
    ↓
Credential Management
    ↓
Critical Services
    ↓
Important Services
    ↓
Standard Services
```

---

# Service Recovery Order

## Tier 1

Recover First

1. AdGuard
2. OpenMediaVault
3. Vaultwarden
4. Home Assistant
5. Immich
6. Paperless-ngx
7. Nextcloud
8. BookStack

---

## Tier 2

Recover Second

1. Homepage
2. Uptime Kuma
3. Audiobookshelf
4. Navidrome
5. Syncthing

---

## Tier 3

Recover Third

1. Plex
2. Tautulli
3. MeTube
4. ARR Platform

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Failure Impact Matrix

| Failed Component | Impact |
|----------|----------|
| UDM-Pro | Wide Infrastructure Failure |
| DNS | Service Discovery Failure |
| PAX | Storage Failure |
| OpenMediaVault | Application Storage Failure |
| JAX | Application Platform Failure |
| Vaultwarden | Administrative Access Impact |
| Gluetun | Media Automation Impact |
| Prowlarr | ARR Platform Impact |

---

# Operational Readiness Requirements

Dependencies should be reviewed during:

- Service Readiness Reviews
- Operations Readiness Assessments
- Disaster Recovery Exercises
- Production Readiness Reviews
- Annual Certification Reviews

Reference:

- service-readiness-matrix.md
- operations-readiness-assessment.md
- production-readiness-review.md
- ENVIRONMENT-CERTIFICATION.md

---

# Success Criteria

This document is considered current when:

- All production services are represented
- Critical dependencies are documented
- Recovery order is documented
- Failure impact is understood
- Recovery planning aligns with service dependencies
- Documentation reflects reality

Dependency information must always reflect the current production environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial dependency architecture aligned with Sprint 01-10 implementation, recovery framework, and operational certification model |