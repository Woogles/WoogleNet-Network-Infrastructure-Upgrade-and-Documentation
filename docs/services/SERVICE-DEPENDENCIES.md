# Service Dependencies

## Purpose

This document serves as the authoritative dependency map for all approved WoogleNet services.

The goals of this document are:

- Identify critical dependencies
- Support troubleshooting
- Support recovery planning
- Establish startup order
- Establish recovery order
- Support monitoring design
- Reduce service coupling surprises

Reference Documents:

- ARCHITECTURE.md
- NETWORK-TOPOLOGY.md
- SERVICE-INVENTORY.md
- DNS-ARCHITECTURE.md
- DISASTER-RECOVERY.md

---

# Dependency Hierarchy

Internet
↓
UDM-Pro
↓
Network Infrastructure
↓
DNS
↓
Storage
↓
Core Services
↓
Application Services

---

# Core Infrastructure Dependencies

## Network

Required By:

- DNS
- Storage
- Monitoring
- All Application Services

Components:

- UDM-Pro
- TP-Link Switches
- Access Points

Failure Impact:

Environment-wide outage.

Criticality:

Critical

---

## DNS

Components:

- AdGuard Primary
- AdGuard Secondary

Dependent Services:

- OpenMediaVault
- Homepage
- Uptime Kuma
- Home Assistant
- Vaultwarden
- Immich
- Nextcloud
- Paperless
- BookStack
- ARR Stack
- Navidrome

Failure Impact:

High

Criticality:

Critical

---

## Storage

Components:

- OpenMediaVault
- SMB Shares
- Backup Repository

Dependent Services:

- Immich
- Audiobookshelf
- Plex
- Home Assistant
- Vaultwarden
- Paperless
- Nextcloud
- BookStack
- ARR Stack
- Navidrome

Failure Impact:

High

Criticality:

Critical

---

# Core Services

## Homepage

Dependencies:

- DNS
- Network

Used By:

- Administrators

Failure Impact:

Low

---

## Uptime Kuma

Dependencies:

- DNS
- Network

Used By:

- Administrators

Failure Impact:

Low

---

# Media Services

## Plex

Dependencies:

- DNS
- Storage
- Network

Recovery Priority:

3

---

## Immich

Dependencies:

- DNS
- Storage
- Network
- Database

Recovery Priority:

1

---

## Audiobookshelf

Dependencies:

- DNS
- Storage
- Network

Recovery Priority:

2

---

# Automation Services

## Home Assistant

Dependencies:

- DNS
- Network
- Storage

Recovery Priority:

1

---

## Vaultwarden

Dependencies:

- DNS
- Network
- Storage

Recovery Priority:

1

---

# ARR Platform

## Dependency Chain

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

---

## qBittorrent

Dependencies:

- Gluetun
- Storage
- DNS

Criticality:

Important

---

## Gluetun

Dependencies:

- DNS
- Internet
- NordVPN

Criticality:

Critical

---

# Knowledge Services

## Paperless-ngx

Dependencies:

- DNS
- Storage

Recovery Priority:

1

---

## Nextcloud

Dependencies:

- DNS
- Storage

Recovery Priority:

1

---

## BookStack

Dependencies:

- DNS
- Storage

Recovery Priority:

1

---

## Syncthing

Dependencies:

- DNS
- Storage

Recovery Priority:

2

---

# Recovery Order

1. UDM-Pro
2. Switching
3. DNS
4. OpenMediaVault
5. Homepage
6. Uptime Kuma
7. Home Assistant
8. Vaultwarden
9. Immich
10. Paperless
11. Nextcloud
12. BookStack
13. Audiobookshelf
14. Plex
15. ARR Stack
16. Optional Services