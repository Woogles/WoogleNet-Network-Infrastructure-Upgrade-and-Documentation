# Core Infrastructure

## Purpose

This document defines the foundational infrastructure services that support the WoogleNet environment.

These services provide the capabilities required by nearly every other system within the environment.

The goals of the Core Infrastructure Platform are:

- Provide DNS services
- Provide storage services
- Provide monitoring
- Provide remote connectivity
- Provide management access
- Provide home automation
- Provide operational visibility

Failure of one or more core infrastructure services may impact multiple dependent services.

Reference:

```text
SERVICE-DEPENDENCIES.md
```

for detailed dependency relationships.

---

# Core Infrastructure Overview

## Service Stack

```text
UDM-Pro
    │
    ▼
AdGuard Home
    │
    ▼
OpenMediaVault
    │
    ▼
Homepage
Uptime Kuma
Tailscale
Home Assistant
```

---

# Core Infrastructure Components

| Service | Platform | Host | Criticality |
|----------|----------|----------|----------|
| UDM-Pro | Appliance | UDM-Pro | Critical |
| AdGuard Primary | LXC | DAX | Critical |
| AdGuard Secondary | LXC | MAX | Critical |
| OpenMediaVault | VM | PAX | Critical |
| Homepage | LXC | DAX | Important |
| Uptime Kuma | LXC | DAX | Important |
| Tailscale | Distributed | All Systems | Critical |
| Home Assistant | VM | MAX | Critical |

---

# Network Foundation

## UDM-Pro

### Purpose

Provides:

- Routing
- Firewall
- DHCP
- VLAN Management
- Internet Connectivity

### Responsibilities

- VLAN 10 Infrastructure
- VLAN 20 Trusted
- VLAN 30 IoT
- VLAN 40 Guest

### Failure Impact

```text
Entire environment impacted
```

### Recovery Priority

```text
Priority 1
```

Reference:

```text
DISASTER-RECOVERY.md
```

---

# DNS Services

## AdGuard Home

### Deployment Model

```text
Primary
+
Secondary
```

---

## AdGuard Primary

Host:

```text
DAX
```

IP Address:

```text
10.0.10.50
```

---

## AdGuard Secondary

Host:

```text
MAX
```

IP Address:

```text
10.0.10.51
```

---

## Responsibilities

- DNS Resolution
- DNS Filtering
- Malware Protection
- Ad Blocking
- Internal DNS Records

---

## Upstream DNS

Primary:

```text
Quad9
```

Secondary:

```text
Cloudflare
```

---

## Failure Impact

```text
Major service disruption
```

Although some direct connectivity may continue working.

---

# Storage Services

## OpenMediaVault

### Host

```text
PAX
```

### Platform

```text
Virtual Machine
```

### Criticality

```text
Critical
```

---

## Responsibilities

- Shared Storage
- Media Storage
- Application Data
- Backup Repository
- Persistent Volumes

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

## Dependent Services

### Critical

- Immich
- Vaultwarden
- Paperless
- Nextcloud
- BookStack

### Important

- Plex
- Audiobookshelf
- ARR Stack

---

## Failure Impact

```text
Major application outage
```

---

# Monitoring Services

## Homepage

### Host

```text
DAX
```

### Platform

```text
LXC
```

---

### Purpose

Provides:

- Dashboard
- Service Overview
- Quick Access Links
- Environment Visibility

---

### Criticality

```text
Important
```

---

## Uptime Kuma

### Host

```text
DAX
```

### Platform

```text
LXC
```

---

### Purpose

Provides:

- Service Monitoring
- DNS Monitoring
- Certificate Monitoring
- Alerting

---

### Notification Methods

- Email
- Mobile Notifications

---

## Monitored Services

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

- Immich
- Plex
- Audiobookshelf
- Vaultwarden

---

# Remote Access Platform

## Tailscale

### Purpose

Provides:

- Secure Remote Access
- Encrypted Connectivity
- Administrative Access
- Service Access

---

## Installation Standard

Installed On:

- DAX
- MAX
- PAX
- JAX
- OpenMediaVault
- Home Assistant

---

## Access Policy

Administrative Access Allowed From:

- Trusted VLAN
- Tailscale
- Physical Console

---

## Protected Services

- Proxmox
- OpenMediaVault
- Vaultwarden
- Home Assistant
- Immich
- Nextcloud
- Paperless
- BookStack

---

## Criticality

```text
Critical
```

---

# Home Automation Platform

## Home Assistant

### Host

```text
MAX
```

### Platform

```text
Virtual Machine
```

---

## Purpose

Provides:

- Home Automation
- Device Integration
- Smart Home Management

---

## Connected Systems

Examples:

- Lights
- Switches
- Sensors
- Smart Devices

---

## Network Requirements

Home Assistant requires controlled access to:

```text
IoT VLAN
```

while maintaining IoT isolation.

---

## Criticality

```text
Critical
```

---

# Infrastructure Dependency Chain

```text
Power
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

# Critical Service Relationships

## Immich

Depends On:

- DNS
- OpenMediaVault
- Tailscale

---

## Vaultwarden

Depends On:

- DNS
- OpenMediaVault
- Tailscale

---

## Paperless

Depends On:

- DNS
- OpenMediaVault

---

## Nextcloud

Depends On:

- DNS
- OpenMediaVault

---

## Plex

Depends On:

- DNS
- OpenMediaVault

---

# Recovery Priorities

## Priority 1

Restore:

- UDM-Pro
- Switching
- AdGuard
- OpenMediaVault

---

## Priority 2

Restore:

- Homepage
- Uptime Kuma
- Tailscale

---

## Priority 3

Restore:

- Home Assistant

---

## Priority 4

Restore application services.

---

# Monitoring Requirements

## Uptime Kuma

Monitor:

- UDM-Pro
- DAX
- MAX
- PAX
- JAX
- AdGuard Primary
- AdGuard Secondary
- OpenMediaVault
- Homepage
- Home Assistant

---

## Alert Priority

| Service | Priority |
|----------|----------|
| UDM-Pro | Critical |
| AdGuard | Critical |
| OpenMediaVault | Critical |
| Tailscale | Critical |
| Home Assistant | Critical |
| Homepage | Important |
| Uptime Kuma | Important |

---

# Backup Requirements

## Mandatory

- OpenMediaVault Configuration
- Home Assistant Configuration
- AdGuard Configuration

---

## Recommended

- Homepage Configuration
- Uptime Kuma Configuration

---

# Operational Standards

## Changes

Changes to core infrastructure require:

- Backup Verification
- Documentation Updates
- Validation Testing

---

## Documentation References

Changes may require updates to:

- HARDWARE-INVENTORY.md
- SERVICE-INVENTORY.md
- NETWORK-TOPOLOGY.md
- DNS-ARCHITECTURE.md
- REMOTE-ACCESS.md
- OPERATIONS-RUNBOOK.md

---

# Success Criteria

The Core Infrastructure Platform is considered healthy when:

- DNS is operational
- Storage is operational
- Monitoring is operational
- Remote access is operational
- Home automation is operational
- Backups are functional

---

# Related Documents

- ARCHITECTURE.md
- DNS-ARCHITECTURE.md
- REMOTE-ACCESS.md
- SERVICE-DEPENDENCIES.md
- MONITORING-AND-ALERTING.md
- DISASTER-RECOVERY.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Core Infrastructure Documentation |