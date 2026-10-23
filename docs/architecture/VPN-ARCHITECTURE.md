# VPN Architecture

## Purpose

Establish secure VPN routing for download automation services.

---

# Design Decision

Approved Platform:

- Gluetun
- NordVPN

Reason:

- Kill Switch Protection
- Proven Docker Integration
- DNS Leak Prevention
- Easy Operational Management

---

# Architecture

Overseerr
↓
Sonarr / Radarr / Lidarr / Readarr
↓
qBittorrent
↓
Gluetun
↓
NordVPN
↓
Internet

---

# Service Placement

Host:

JAX

Platform:

Docker

Service Name:

jax-gluetun

---

# Protected Services

VPN Required:

- qBittorrent

---

# Non-VPN Services

Do Not Route Through VPN:

- Overseerr
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Plex
- Home Assistant
- Vaultwarden

---

# Kill Switch Requirement

Policy:

No VPN
=
No Download Traffic

Traffic leakage is prohibited.

---

# Storage Requirements

Configuration:

/storage/appdata/gluetun

---

# Monitoring

Monitor:

- Container Health
- VPN Endpoint
- Public IP Address
- DNS Resolution

Alert Level:

High

---

# Recovery Procedure

1. Validate NordVPN Credentials
2. Validate Gluetun Container
3. Validate DNS
4. Validate VPN Endpoint
5. Validate qBittorrent Connectivity
6. Resume Automation