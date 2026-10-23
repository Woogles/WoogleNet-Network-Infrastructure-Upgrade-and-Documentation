# DNS-ARCHITECTURE

## Purpose

This document serves as the authoritative DNS architecture reference for the WoogleNet environment.

The purpose of this document is to:

- Define DNS design
- Document DNS services
- Define DNS redundancy
- Define name resolution strategy
- Support operational troubleshooting
- Support disaster recovery planning
- Support readiness assessments
- Support certification activities

DNS services are critical infrastructure components supporting all systems within the WoogleNet environment.

Reference Documents:

- ARCHITECTURE.md
- NETWORK-ARCHITECTURE.md
- SERVICE-INVENTORY.md
- SERVICE-DEPENDENCIES.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md

---

# Design Principles

The DNS architecture follows the following principles:

1. DNS Must Be Highly Available
2. DNS Must Be Recoverable
3. Internal Resolution Must Be Consistent
4. DNS Should Remain Simple
5. Administrative Overhead Should Be Minimal
6. DNS Failure Must Not Cause Single-Host Dependency
7. DNS Services Must Be Monitored

---

# DNS Architecture Overview

## DNS Service Model

The WoogleNet environment utilizes a dual-instance DNS architecture.

```text
Clients
    │
    ▼
Primary DNS
(AdGuard Primary)
    │
    ▼
Upstream DNS

         +

Secondary DNS
(AdGuard Secondary)
    │
    ▼
Upstream DNS
```

This design provides:

- DNS Redundancy
- DNS Filtering
- Internal Service Resolution
- Simplified Administration

---

# DNS Infrastructure

## Primary DNS

| Property | Value |
|----------|----------|
| Platform | AdGuard Home |
| Host | DAX |
| Role | Primary DNS Resolver |
| Status | Operational |
| Monitoring | Enabled |
| Recovery Tier | Tier 1 |

Address:

```text
10.0.10.50
```

Responsibilities:

- Primary Resolver
- DNS Filtering
- Internal DNS Records
- Local Service Resolution

---

## Secondary DNS

| Property | Value |
|----------|----------|
| Platform | AdGuard Home |
| Host | MAX |
| Role | Secondary DNS Resolver |
| Status | Operational |
| Monitoring | Enabled |
| Recovery Tier | Tier 1 |

Address:

```text
10.0.10.51
```

Responsibilities:

- Secondary Resolver
- Resolver Failover
- DNS Filtering
- Internal DNS Records

---

# DNS Client Configuration

## Client Settings

Primary DNS:

```text
10.0.10.50
```

Secondary DNS:

```text
10.0.10.51
```

Distribution Method:

```text
DHCP
```

Provider:

```text
UDM-Pro
```

---

# Upstream DNS Providers

## Primary Provider

```text
Quad9
```

Purpose:

- Privacy Protection
- Threat Intelligence Filtering
- DNS Resolution

---

## Secondary Provider

```text
Cloudflare DNS
```

Purpose:

- DNS Resolution
- Upstream Redundancy

---

# Internal DNS Architecture

## Internal Resolution

Internal DNS supports resolution for:

- Infrastructure Hosts
- Application Services
- Administrative Systems

Examples:

```text
dax
max
pax
jax
```

and service-specific hostnames.

---

## Internal Naming Convention

Infrastructure Systems:

```text
hostname
```

Examples:

```text
dax
max
pax
jax
```

Service Naming:

```text
service-name
```

Examples:

```text
plex
immich
vaultwarden
paperless
nextcloud
```

The authoritative naming convention should remain simple and consistent.

---

# VLAN Integration

DNS services support all VLANs.

## Infrastructure VLAN

Supports:

- Servers
- Network Equipment
- Infrastructure Services

Access:

```text
Allowed
```

---

## Trusted VLAN

Supports:

- Family Devices
- Administrative Devices

Access:

```text
Allowed
```

---

## IoT VLAN

Supports:

- Smart Devices
- Home Automation Integrations

Access:

```text
Restricted
```

Only approved DNS traffic is permitted.

---

## Guest VLAN

Supports:

- Internet DNS Resolution

Access:

```text
Restricted
```

No administrative DNS functions are exposed.

---

# Service Dependency Architecture

The following services require DNS for normal operation.

## Infrastructure Services

- Homepage
- Uptime Kuma
- Vaultwarden
- Tailscale

---

## Media Services

- Plex
- Audiobookshelf
- Immich
- Navidrome
- Tautulli
- MeTube

---

## Automation Services

- Home Assistant
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Overseerr
- qBittorrent
- Gluetun

---

## Knowledge Services

- Paperless-ngx
- Nextcloud
- Syncthing
- BookStack
- Stirling-PDF

Reference:

SERVICE-DEPENDENCIES.md

---

# DNS Security Architecture

## Security Controls

DNS protection is provided through:

- AdGuard Filtering
- Local Resolution
- Redundant Infrastructure
- Network Segmentation
- Administrative Access Controls

---

## Administrative Access

Management access is allowed only from:

```text
Trusted VLAN
Tailscale
Physical Console
```

Reference:

SSH-STANDARD.md

---

## Public Exposure

Administrative DNS interfaces must not be exposed directly to the public Internet.

Access should occur through:

```text
Tailscale
```

Reference:

SECURITY-BASELINE.md

---

# Monitoring Architecture

## Monitored Components

Monitor:

- AdGuard Primary
- AdGuard Secondary
- DNS Resolution
- Upstream Connectivity
- Service Availability

Platform:

```text
Uptime Kuma
```

---

## Alerting

Generate alerts for:

- DNS Service Failure
- Resolver Unavailability
- Excessive Query Failure Rates
- Host Availability Issues

Notification Methods:

- Email
- Mobile Notifications

---

# Recovery Architecture

## Recovery Classification

DNS Services:

```text
Tier 1
```

DNS services must be restored before most application services.

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

## Recovery Order

```text
Network
    ↓
DNS
    ↓
Storage
    ↓
Credential Management
    ↓
Application Services
```

Reference:

DISASTER-RECOVERY.md

---

## DNS Failure Scenarios

### Primary DNS Failure

Expected Behavior:

```text
Clients Automatically Use Secondary DNS
```

Impact:

Minimal

---

### Secondary DNS Failure

Expected Behavior:

```text
Clients Continue Using Primary DNS
```

Impact:

Reduced Redundancy

---

### Complete DNS Failure

Impact:

- Administrative Difficulty
- Service Discovery Disruption
- Application Resolution Failures

Response:

Execute DNS recovery procedures.

Reference:

DISASTER-RECOVERY.md

---

# Operational Readiness Requirements

DNS validation occurs during:

- Service Readiness Reviews
- Operations Readiness Assessments
- Disaster Recovery Exercises
- Production Readiness Reviews
- Annual Certification Reviews

Reference Documents:

- service-readiness-matrix.md
- operations-readiness-assessment.md
- disaster-recovery-exercise.md
- production-readiness-review.md
- ENVIRONMENT-CERTIFICATION.md

---

# Certification Requirements

DNS certification requires:

- Primary Resolver Operational
- Secondary Resolver Operational
- DNS Monitoring Operational
- Upstream Providers Functional
- Recovery Procedures Documented
- Recovery Validation Completed

Reference:

ENVIRONMENT-CERTIFICATION.md

---

# Success Criteria

The DNS architecture is considered operational when:

- Primary DNS Is Operational
- Secondary DNS Is Operational
- DNS Monitoring Is Active
- DNS Filtering Is Functional
- Internal Resolution Is Functional
- Recovery Procedures Are Documented
- Recovery Validation Is Current
- Documentation Reflects Reality

DNS services are critical infrastructure components and must remain available to support the WoogleNet environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial DNS architecture aligned with Sprint 01–10 implementation, recovery framework, operational readiness model, and certification program |