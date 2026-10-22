# Monitoring and Alerting

## Purpose

This document defines the monitoring, alerting, notification, and observability standards for the WoogleNet environment.

The goals of monitoring are:

- Detect service outages
- Detect infrastructure failures
- Detect storage issues
- Detect DNS issues
- Detect certificate expiration
- Improve recovery time
- Provide visibility into system health

This document should be updated whenever services or infrastructure are added, removed, or modified.

---

# Monitoring Philosophy

## Core Principles

1. Alert on actionable issues.
2. Avoid alert fatigue.
3. Monitor critical dependencies first.
4. Prioritize service availability.
5. Critical services must be monitored.
6. Monitoring should help recovery.
7. A monitored service should have an owner.

---

# Monitoring Platforms

## Homepage

Purpose:

```text
Status Dashboard
```

Responsibilities:

- Service Links
- Infrastructure Overview
- Visual Status
- Service Grouping

---

## Uptime Kuma

Purpose:

```text
Active Monitoring
Alerting
Notification Delivery
```

Responsibilities:

- Availability Monitoring
- DNS Monitoring
- Certificate Monitoring
- Alert Delivery

---

# Notification Methods

## Primary

```text
Email
```

---

## Secondary

```text
Mobile Notifications
```

---

## Future State

```text
Webhook Automation
AI Analysis
Event Correlation
```

Status:

```text
Future Review
```

---

# Monitoring Classifications

## Critical

Failure requires immediate attention.

Examples:

- UDM-Pro
- OpenMediaVault
- AdGuard
- Immich
- Vaultwarden
- Home Assistant
- Paperless-ngx
- Nextcloud

---

## Important

Failure should be addressed promptly.

Examples:

- Homepage
- Uptime Kuma
- Audiobookshelf
- BookStack
- Syncthing

---

## Low Priority

Failure can be addressed when convenient.

Examples:

- MeTube
- Tautulli
- ARR Stack Components

---

# Infrastructure Monitoring

## UDM-Pro

### Checks

- Ping
- HTTPS Availability

### Alert Level

```text
Critical
```

---

## DAX

### Checks

- Ping
- HTTPS Availability
- Proxmox Web Interface

### Alert Level

```text
Critical
```

---

## MAX

### Checks

- Ping
- HTTPS Availability
- Proxmox Web Interface

### Alert Level

```text
Critical
```

---

## PAX

### Checks

- Ping
- HTTPS Availability
- Proxmox Web Interface

### Alert Level

```text
Critical
```

---

## JAX

### Checks

- Ping
- SSH Response
- Docker Availability

### Alert Level

```text
Critical
```

---

# Storage Monitoring

## OpenMediaVault

### Checks

- Ping
- Web Interface
- Storage Availability

### Alert Level

```text
Critical
```

---

## Storage Capacity

### Warning Threshold

```text
80%
```

### Critical Threshold

```text
90%
```

---

# DNS Monitoring

## AdGuard Primary

### Checks

- DNS Resolution
- HTTP Availability

### Alert Level

```text
Critical
```

---

## AdGuard Secondary

### Checks

- DNS Resolution
- HTTP Availability

### Alert Level

```text
Critical
```

---

## DNS Test Domains

Examples:

```text
google.com
microsoft.com
github.com
```

---

# Service Monitoring

## Homepage

### Checks

- HTTP Availability

### Alert Level

```text
Important
```

---

## Uptime Kuma

### Checks

- HTTP Availability

### Alert Level

```text
Important
```

---

## Immich

### Checks

- HTTP Availability
- Login Page
- Database Connectivity

### Alert Level

```text
Critical
```

### Data Classification

```text
Critical
```

---

## Vaultwarden

### Checks

- HTTP Availability
- Login Page

### Alert Level

```text
Critical
```

---

## Home Assistant

### Checks

- Web Interface
- Login Response

### Alert Level

```text
Critical
```

---

## Nextcloud

### Checks

- HTTPS Availability
- Login Page

### Alert Level

```text
Critical
```

---

## Paperless-ngx

### Checks

- HTTPS Availability
- Login Page

### Alert Level

```text
Critical
```

---

## BookStack

### Checks

- HTTPS Availability

### Alert Level

```text
Important
```

---

## Audiobookshelf

### Checks

- HTTPS Availability

### Alert Level

```text
Important
```

---

## Plex

### Checks

- HTTPS Availability
- Remote Access Availability

### Alert Level

```text
Important
```

---

# ARR Stack Monitoring

## qBittorrent

Alert Level:

```text
Low
```

---

## Sonarr

Alert Level:

```text
Low
```

---

## Radarr

Alert Level:

```text
Low
```

---

## Lidarr

Alert Level:

```text
Low
```

---

## Readarr

Alert Level:

```text
Low
```

---

## Prowlarr

Alert Level:

```text
Low
```

---

## Bazarr

Alert Level:

```text
Low
```

---

## Overseerr

Alert Level:

```text
Low
```

---

# Certificate Monitoring

## Monitor For

- Expiration
- Renewal Failures
- Invalid Certificates

---

## Warning Threshold

```text
30 Days
```

---

## Critical Threshold

```text
7 Days
```

---

# Backup Monitoring

## Kopia

Monitor:

- Successful Backups
- Failed Backups
- Repository Availability

---

## OneDrive

Monitor:

- Sync Completion
- Sync Failures

---

## Alert Level

```text
Critical
```

for failed backups.

---

# Security Monitoring

## Failed Login Attempts

Monitor where supported:

- Vaultwarden
- Home Assistant
- Nextcloud

---

## Fail2Ban

Monitor:

- Active Bans
- Ban Rate

---

## Tailscale

Monitor:

- Device Enrollment
- Device Health
- Connectivity

---

# Alert Priorities

## Priority 1

Immediate Action Required.

Examples:

- UDM-Pro Offline
- DNS Failure
- OpenMediaVault Failure
- Immich Failure
- Vaultwarden Failure
- Backup Failure

---

## Priority 2

Investigate Promptly.

Examples:

- Plex Failure
- Home Assistant Failure
- Homepage Failure
- Uptime Kuma Failure

---

## Priority 3

Review As Time Permits.

Examples:

- ARR Failures
- MeTube Failure
- Tautulli Failure

---

# Dashboard Organization

## Infrastructure

- UDM-Pro
- DAX
- MAX
- PAX
- JAX
- OpenMediaVault

---

## Core Services

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

---

## Family Services

- Immich
- Plex
- Audiobookshelf
- Vaultwarden

---

## Knowledge Platform

- Nextcloud
- Paperless
- BookStack
- Syncthing

---

## Media Automation

- qBittorrent
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Overseerr

---

# Monitoring Review Schedule

## Weekly

Review:

- Failed Alerts
- Service Status
- Backup Status

---

## Monthly

Review:

- Storage Usage
- DNS Performance
- Monitoring Coverage

---

## Quarterly

Review:

- Alert Quality
- Notification Delivery
- Monitoring Accuracy

---

# Alert Response Procedure

## Step 1

Validate outage.

---

## Step 2

Determine scope.

```text
Infrastructure
Storage
DNS
Service
```

---

## Step 3

Review dependencies.

Reference:

```text
SERVICE-DEPENDENCIES.md
```

---

## Step 4

Recover service.

Reference:

```text
DISASTER-RECOVERY.md
OPERATIONS-RUNBOOK.md
```

---

## Step 5

Document findings.

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Centralized Logging Platform | Future Review |
| Grafana Deployment | Future Review |
| Prometheus Deployment | Future Review |
| AI-Assisted Alert Analysis | Future Review |
| Webhook Automation | Future Review |

---

# Monitoring Coverage Checklist

- [ ] UDM-Pro Monitoring
- [ ] DAX Monitoring
- [ ] MAX Monitoring
- [ ] PAX Monitoring
- [ ] JAX Monitoring
- [ ] OMV Monitoring
- [ ] DNS Monitoring
- [ ] Backup Monitoring
- [ ] Certificate Monitoring
- [ ] Family Service Monitoring
- [ ] Notification Validation

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Monitoring and Alerting Strategy |