# dax-uptime

## Purpose

Deploy Uptime Kuma monitoring platform.

Provides:

- Service Monitoring
- DNS Monitoring
- Certificate Monitoring
- Service Alerts

Reference:

MONITORING-AND-ALERTING.md

---

# Deployment Information

Host:

DAX

Platform:

LXC

IP Address:

10.0.10.61

Hostname:

dax-uptime

---

# Resource Allocation

CPU: 2 vCPU

Memory: 2 GB

Storage: 20 GB

---

# Monitoring Scope

Infrastructure

- UDM-Pro
- DAX
- MAX
- PAX
- JAX

Storage

- OpenMediaVault

DNS

- AdGuard Primary
- AdGuard Secondary

Applications

- Homepage
- Immich
- Vaultwarden
- Home Assistant
- Paperless
- Nextcloud

---

# Notification Methods

Primary:

Email

Secondary:

Mobile Notifications

---

# Critical Monitors

- DNS Failure
- Storage Failure
- Vaultwarden Failure
- Immich Failure
- Backup Failure

---

# Backup

Backup:

- Configuration Database
- Monitor Definitions
- Notification Rules

Frequency:

Weekly