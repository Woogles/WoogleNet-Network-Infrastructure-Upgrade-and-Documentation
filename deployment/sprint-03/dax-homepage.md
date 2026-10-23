# dax-homepage

## Purpose

Deploy Homepage dashboard service.

Homepage provides:

- Infrastructure Dashboard
- Service Status Visibility
- Operational Links
- Environment Navigation

Reference:

MONITORING-AND-ALERTING.md

---

# Deployment Information

Host:

DAX

Platform:

LXC

IP Address:

10.0.10.60

Hostname:

dax-homepage

---

# Resource Allocation

CPU: 2 vCPU

Memory: 2 GB

Storage: 20 GB

---

# Service Groups

Infrastructure

- DAX
- MAX
- PAX
- JAX

Core Services

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

Family Services

- Immich
- Plex
- Audiobookshelf
- Vaultwarden

Knowledge Services

- Paperless
- Nextcloud
- BookStack

Media Automation

- qBittorrent
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Overseerr

---

# Access

Allowed:

- Trusted VLAN
- Tailscale

---

# Monitoring

Monitor Service Availability

Alert Level:

Important

---

# Backup

Backup:

- Configuration
- Service Definitions