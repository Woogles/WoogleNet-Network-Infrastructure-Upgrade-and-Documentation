# jax-gluetun

## Purpose

Deploy the Gluetun VPN gateway container on JAX.

Gluetun provides:

- Secure VPN Tunnel
- Kill Switch Protection
- NordVPN Integration
- qBittorrent Traffic Routing
- DNS Leak Protection
- Public IP Obfuscation

Reference Documents:

- VPN-ARCHITECTURE.md
- SERVICE-DEPENDENCIES.md
- docker-standard.md
- secrets-management-standard.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-gluetun

Role:

VPN Gateway

---

# Architecture Role

The VPN routing path is:

Overseerr
↓
Sonarr / Radarr / Lidarr / Readarr
↓
Prowlarr
↓
qBittorrent
↓
Gluetun
↓
NordVPN
↓
Internet

Gluetun serves as the secure network gateway for all download traffic.

---

# Resource Allocation

CPU:

2 vCPU

Memory:

2 GB

Storage:

5 GB

---

# Storage Configuration

Application Data:

/storage/appdata/gluetun

Container Mount:

/gluetun

Backup Classification:

Important

Backup Required:

Yes

---

# Network Design

Type:

Bridge Network

DNS Servers:

10.0.10.50
10.0.10.51

VPN Provider:

NordVPN

VPN Protocol:

WireGuard

---

# Routing Policy

VPN Protected:

- qBittorrent

Non-VPN Services:

- Overseerr
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Plex
- Navidrome
- Vaultwarden
- Home Assistant

Only download traffic should traverse the VPN tunnel.

---

# Kill Switch Requirements

Policy:

No VPN
=
No Download Traffic

Requirements:

- Internet blocked on tunnel failure
- No traffic leakage
- VPN validation at startup
- Automatic reconnection

---

# Security Requirements

Secrets Storage:

Vaultwarden

Do Not Store:

- VPN Credentials in Git
- VPN Credentials in Documentation
- VPN Credentials in Compose Files

Required:

- .env Variables
- Strong Authentication
- Credential Backup

Reference:

secrets-management-standard.md

---

# Installation Requirements

Prerequisites:

- Docker Installed
- Docker Compose Installed
- NordVPN Account
- WireGuard Credentials
- DNS Infrastructure Operational

Dependencies:

- DNS
- Internet Connectivity
- NordVPN

---

# Service Dependencies

Required By:

- jax-qbittorrent

Indirect Dependencies:

- Sonarr
- Radarr
- Lidarr
- Readarr
- Prowlarr
- Overseerr

Reference:

SERVICE-DEPENDENCIES.md

---

# Monitoring Requirements

Monitor:

- Container Health
- VPN Status
- Tunnel Availability
- Public IP Address
- DNS Resolution

Alert Level:

Critical

---

# Validation

Verify:

- Container Running
- VPN Established
- Public IP Changed
- DNS Resolution Functional
- Kill Switch Functional
- qBittorrent Traffic Routed Through VPN

Validation Method:

1. Start Container
2. Verify Connection Logs
3. Confirm Public IP
4. Disable VPN
5. Verify Internet Blocked
6. Restore VPN
7. Confirm Connectivity Restored

---

# Backup Requirements

Backup:

- Configuration Files
- Environment Variables
- WireGuard Configuration

Do Not Backup:

- Container Images
- Logs
- Temporary Runtime Data

Frequency:

Weekly

---

# Failure Scenarios

## VPN Authentication Failure

Symptoms:

- Tunnel Not Established
- Connection Loops

Response:

- Verify NordVPN Credentials
- Verify WireGuard Configuration
- Restart Container

---

## DNS Resolution Failure

Symptoms:

- Connection Established
- No Internet Access

Response:

- Verify AdGuard Primary
- Verify AdGuard Secondary
- Verify DNS Configuration

---

## Tunnel Failure

Symptoms:

- Download Connectivity Lost

Expected Behavior:

No Internet Access

Kill Switch remains active.

Response:

- Verify VPN Endpoint
- Verify Internet Connectivity
- Restart Container
- Validate Public IP

---

# Recovery Procedure

1. Verify Internet Connectivity
2. Verify DNS Resolution
3. Verify NordVPN Credentials
4. Verify WireGuard Configuration
5. Restart Gluetun
6. Confirm Public IP Change
7. Confirm qBittorrent Connectivity
8. Resume Automation

---

# Success Criteria

Deployment is complete when:

- Gluetun Operational
- NordVPN Connected
- Public IP Verified
- Kill Switch Verified
- DNS Operational
- qBittorrent Connectivity Functional
- Monitoring Configured
- Backup Protection Enabled