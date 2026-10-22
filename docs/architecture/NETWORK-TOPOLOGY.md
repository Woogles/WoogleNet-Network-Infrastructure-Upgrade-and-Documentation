# Network Topology

## Purpose

This document serves as the authoritative reference for the physical and logical network topology of the WoogleNet environment.

The purpose of this document is to:

- Document physical connectivity
- Define logical network relationships
- Identify critical infrastructure paths
- Support troubleshooting
- Support future expansion
- Serve as the foundation for firewall and routing documentation

This document should be updated whenever physical infrastructure, network architecture, or connectivity changes.

---

# Network Overview

## Design Principles

- Infrastructure is separated from users.
- Trusted devices may access approved internal services.
- IoT devices remain isolated.
- Guest devices receive internet-only access.
- Tailscale serves as the primary remote access solution.
- Services should be reachable through private connectivity whenever possible.
- Infrastructure services should remain accessible even during partial service failures.

---

# High-Level Topology

```text
Internet
    │
    ▼
UDM-Pro
    │
    ▼
=================
Core Infrastructure
=================
    │
    ├── TP-Link Switch 01
    │
    └── TP-Link Switch 02
            │
            ├── Access Points
            ├── DAX
            ├── MAX
            ├── PAX
            └── JAX
```

---

# Logical Network Topology

```text
Internet
    │
    ▼
UDM-Pro
    │
    ├── VLAN 10 Infrastructure
    │
    ├── VLAN 20 Trusted
    │
    ├── VLAN 30 IoT
    │
    └── VLAN 40 Guest
```

---

# Physical Topology

## Internet Edge

```text
ISP
 │
 ▼
UDM-Pro
```

Responsibilities:

- Routing
- Firewall
- DHCP
- VLAN Management
- Internet Connectivity

---

## Switching Layer

```text
UDM-Pro
   │
   ├── WoogleNetSwitch01
   │
   └── WoogleNetSwitch02
```

### Switch Infrastructure

| Device | Model | Purpose |
|----------|----------|----------|
| WoogleNetSwitch01 | TP-Link TL-SG1024DE | Core Distribution |
| WoogleNetSwitch02 | TP-Link TL-SG1024DE | Core Distribution |

---

## Wireless Layer

```text
Switches
   │
   └── Access Points
```

### Installed Access Points

| Model | Quantity |
|----------|----------|
| UniFi AC LR | 4 |
| UniFi AC Pro | 3 |

### Wireless Networks

| SSID | VLAN |
|----------|----------|
| WoogleNet | VLAN 20 |
| WoogleNet-IoT | VLAN 30 |
| WoogleNet-Guest | VLAN 40 |

---

# Compute Topology

## DAX

```text
Role:
Infrastructure Host
```

Primary Workloads:

- AdGuard Primary
- Homepage
- Uptime Kuma

Connectivity:

```text
DAX
 │
 ▼
Infrastructure VLAN
```

---

## MAX

```text
Role:
Infrastructure Host
```

Primary Workloads:

- AdGuard Secondary
- Home Assistant VM

Connectivity:

```text
MAX
 │
 ▼
Infrastructure VLAN
```

---

## PAX

```text
Role:
Storage Host
```

Primary Workloads:

- OpenMediaVault

Connectivity:

```text
PAX
 │
 ▼
Infrastructure VLAN
```

---

## JAX

```text
Role:
Application Host
```

Primary Workloads:

- Plex
- Immich
- Audiobookshelf
- Vaultwarden
- ARR Stack
- Nextcloud
- Paperless-ngx
- BookStack
- AI Platform

Connectivity:

```text
JAX
 │
 ▼
Infrastructure VLAN
```

---

# Service Topology

## Core Infrastructure Services

```text
DAX
 ├── AdGuard Primary
 ├── Homepage
 └── Uptime Kuma

MAX
 ├── AdGuard Secondary
 └── Home Assistant

PAX
 └── OpenMediaVault

JAX
 ├── Plex
 ├── Immich
 ├── Audiobookshelf
 ├── Vaultwarden
 ├── ARR Stack
 ├── Nextcloud
 ├── Paperless
 └── BookStack
```

---

# DNS Topology

```text
Client
   │
   ▼
AdGuard Primary
   │
   └── Quad9

Failover

Client
   │
   ▼
AdGuard Secondary
   │
   └── Quad9
```

---

# Remote Access Topology

## Primary Access Method

```text
Remote User
     │
     ▼
Tailscale
     │
     ▼
Internal Services
```

### Remote Access Targets

- Homepage
- Uptime Kuma
- Vaultwarden
- Nextcloud
- Paperless-ngx
- Home Assistant
- BookStack
- Infrastructure Services

---

# Media Architecture

```text
Users
   │
   ▼
Plex
   │
   ▼
Media Storage
```

Supporting Services:

```text
qBittorrent
      │
      ▼
Prowlarr
      │
      ▼
Sonarr
Radarr
Lidarr
Readarr
Bazarr
Overseerr
```

---

# Photo Management Architecture

```text
Phones
    │
    ▼
Immich
    │
    ▼
Local Storage
```

### Data Classification

```text
Critical
```

Family photos and mobile backups are considered non-replaceable.

---

# Home Automation Architecture

```text
Home Assistant
      │
      ▼
IoT Devices
```

Traffic Direction:

```text
Home Assistant
      →
IoT Devices

Allowed
```

```text
IoT Devices
      →
Infrastructure

Denied
```

---

# Security Boundaries

## Infrastructure VLAN

Contains:

- UDM-Pro
- Switches
- Access Points
- Servers
- Core Services

---

## Trusted VLAN

Contains:

- Family Devices
- Laptops
- Phones
- Tablets
- Media Streamers

---

## IoT VLAN

Contains:

- Smart Home Devices
- Sensors
- Appliances

---

## Guest VLAN

Contains:

- Visitor Devices

No access to internal systems.

---

# Traffic Flow Matrix

| Source | Infrastructure | Trusted | IoT | Guest | Internet |
|----------|----------|----------|----------|----------|----------|
| Infrastructure | Allow | Allow | Allow | Deny | Allow |
| Trusted | Allow | Allow | Limited | Deny | Allow |
| IoT | Deny | Deny | Allow | Deny | Allow |
| Guest | Deny | Deny | Deny | Allow | Allow |

---

# Future Growth Areas

## Approved Expansion Areas

| Area | Status |
|----------|----------|
| Additional Storage | Planned |
| Additional GPUs | Possible |
| Additional Proxmox Hosts | Possible |
| AI Expansion | Planned |
| Backup Repository Growth | Planned |

---

## Deferred Expansion Areas

| Area | Status |
|----------|----------|
| Camera VLAN | Deferred |
| Dedicated Server VLAN | Deferred |
| Lab VLAN | Deferred |
| IPv6 Deployment | Deferred |

---

# Open Decisions

| Item | Status |
|----------|----------|
| Physical Switch Port Mapping | TBD |
| Access Point Placement Validation | TBD |
| Cable Labeling Standard | TBD |
| Rack Cabling Documentation | TBD |
| UPS-to-Host Mapping | TBD |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Network Topology |