# MONITORING-AND-ALERTING

## Purpose

This document defines the monitoring, alerting, notification, and observability standards for the WoogleNet environment.

The objectives of monitoring are to:

- Detect Infrastructure Failures
- Detect Storage Failures
- Detect DNS Failures
- Detect Service Outages
- Detect Backup Failures
- Detect Certificate Issues
- Improve Recovery Time
- Support Operational Awareness
- Support Disaster Recovery
- Support Operational Readiness
- Support Environment Certification

Monitoring is a required operational capability for all production services.

Reference Documents:

- ARCHITECTURE.md
- SERVICE-INVENTORY.md
- SERVICE-DEPENDENCIES.md
- OPERATIONS-RUNBOOK.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md
- service-readiness-matrix.md
- operations-readiness-assessment.md
- ENVIRONMENT-CERTIFICATION.md

---

# Monitoring Philosophy

## Core Principles

1. Monitor Critical Dependencies First
2. Alerts Must Be Actionable
3. Critical Services Require Monitoring
4. Monitoring Must Support Recovery
5. Monitoring Must Reduce Detection Time
6. Monitoring Must Avoid Alert Fatigue
7. Every Alert Must Have An Owner
8. Monitoring Must Reflect Service Criticality
9. Monitoring Coverage Must Be Documented
10. Monitoring Must Support Certification Activities

---

# Monitoring Architecture

## Monitoring Flow

```text
Infrastructure
        ↓
Storage
        ↓
DNS
        ↓
Core Services
        ↓
Application Services
        ↓
Backup Systems
        ↓
Recovery Validation
```

The monitoring hierarchy follows service dependency order.

Reference:

SERVICE-DEPENDENCIES.md

---

# Monitoring Platforms

## Homepage

Purpose:

```text
Operational Dashboard
```

Responsibilities:

- Service Visibility
- Administrative Access Links
- Service Organization
- Operational Overview

Status:

```text
Production
```

---

## Uptime Kuma

Purpose:

```text
Monitoring
Alerting
Notification Delivery
```

Responsibilities:

- Endpoint Monitoring
- Availability Monitoring
- DNS Monitoring
- Certificate Monitoring
- Alert Delivery

Status:

```text
Production
```

---

# Notification Architecture

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

## Alert Requirements

Alerts should provide:

- Service Name
- Failure Type
- Severity
- Impact Assessment
- Recovery Reference

---

# Service Classifications

## Critical

Immediate Action Required.

These services align with Tier 1 recovery requirements.

Services:

- AdGuard Primary
- AdGuard Secondary
- OpenMediaVault
- Vaultwarden
- Home Assistant
- Immich
- Paperless-ngx
- Nextcloud
- BookStack

Response Target:

```text
Immediate
```

---

## Important

Investigate Promptly.

These services align with Tier 2 recovery requirements.

Services:

- Homepage
- Uptime Kuma
- Audiobookshelf
- Navidrome
- Syncthing

Response Target:

```text
Same Day
```

---

## Standard

Review As Practical.

These services align with Tier 3 recovery requirements.

Services:

- Plex
- Tautulli
- MeTube
- qBittorrent
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Overseerr
- Gluetun
- Stirling-PDF

Response Target:

```text
Best Effort
```

---

# Infrastructure Monitoring

## UDM-Pro

Checks:

- Ping
- HTTPS Availability
- Management Interface

Classification:

```text
Critical
```

---

## DAX

Checks:

- Ping
- HTTPS Availability
- Proxmox Interface

Classification:

```text
Critical
```

---

## MAX

Checks:

- Ping
- HTTPS Availability
- Proxmox Interface

Classification:

```text
Critical
```

---

## PAX

Checks:

- Ping
- HTTPS Availability
- Proxmox Interface

Classification:

```text
Critical
```

---

## JAX

Checks:

- Ping
- SSH Response
- Docker Availability

Classification:

```text
Critical
```

---

# Storage Monitoring

## OpenMediaVault

Checks:

- Ping
- Web Interface
- Storage Availability
- Share Availability
- Mount Status
- SMART Health
- Capacity Utilization

Classification:

```text
Critical
```

Reference:

STORAGE-ARCHITECTURE.md

---

## Capacity Monitoring

### Warning Threshold

```text
80%
```

### Critical Threshold

```text
90%
```

Capacity planning should begin before critical thresholds are reached.

---

# DNS Monitoring

## AdGuard Primary

Checks:

- DNS Resolution
- Web Interface
- Upstream DNS Connectivity

Classification:

```text
Critical
```

---

## AdGuard Secondary

Checks:

- DNS Resolution
- Web Interface
- Upstream DNS Connectivity

Classification:

```text
Critical
```

Reference:

DNS-ARCHITECTURE.md

---

## Resolution Validation

Monitor successful resolution of:

```text
google.com
microsoft.com
github.com
```

along with internal service endpoints.

---

# Remote Access Monitoring

## Tailscale

Checks:

- Device Connectivity
- Tailnet Connectivity
- Administrative Access Availability

Classification:

```text
Critical
```

Reference:

VPN-ARCHITECTURE.md

---

# Core Operations Monitoring

## Homepage

Checks:

- HTTPS Availability

Classification:

```text
Important
```

---

## Uptime Kuma

Checks:

- HTTPS Availability

Classification:

```text
Important
```

---

## Vaultwarden

Checks:

- HTTPS Availability
- Login Page Availability

Classification:

```text
Critical
```

Recovery Tier:

```text
Tier 1
```

---

# Media Platform Monitoring

## Immich

Checks:

- HTTPS Availability
- Login Interface

Classification:

```text
Critical
```

Recovery Tier:

```text
Tier 1
```

---

## Plex

Checks:

- HTTPS Availability
- Remote Access Availability

Classification:

```text
Standard
```

---

## Audiobookshelf

Checks:

- HTTPS Availability

Classification:

```text
Important
```

---

## Navidrome

Checks:

- HTTPS Availability

Classification:

```text
Important
```

---

## Tautulli

Checks:

- HTTPS Availability

Classification:

```text
Standard
```

---

## MeTube

Checks:

- HTTPS Availability

Classification:

```text
Standard
```

---

# Knowledge Platform Monitoring

## Paperless-ngx

Checks:

- HTTPS Availability
- Login Interface

Classification:

```text
Critical
```

Recovery Tier:

```text
Tier 1
```

---

## Nextcloud

Checks:

- HTTPS Availability
- Login Interface

Classification:

```text
Critical
```

Recovery Tier:

```text
Tier 1
```

---

## BookStack

Checks:

- HTTPS Availability

Classification:

```text
Critical
```

Recovery Tier:

```text
Tier 1
```

---

## Syncthing

Checks:

- HTTPS Availability

Classification:

```text
Important
```

---

## Stirling-PDF

Checks:

- HTTPS Availability

Classification:

```text
Standard
```

---

# Automation Platform Monitoring

## Home Assistant

Checks:

- HTTPS Availability
- Login Interface
- API Response

Classification:

```text
Critical
```

Recovery Tier:

```text
Tier 1
```

---

## ARR Platform

Services:

- qBittorrent
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Overseerr
- Gluetun

Checks:

- HTTPS Availability

Classification:

```text
Standard
```

---

# Certificate Monitoring

## Monitor

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

Checks:

- Backup Completion
- Backup Failure
- Repository Availability
- Repository Integrity

Classification:

```text
Critical
```

---

## OneDrive Replication

Checks:

- Synchronization Completion
- Synchronization Failure

Classification:

```text
Critical
```

Reference:

BACKUP-AND-RESTORE.md

---

# Security Monitoring

## Authentication Monitoring

Monitor where supported:

- Failed Login Attempts
- Authentication Errors
- Excessive Login Activity

Applies To:

- Vaultwarden
- Home Assistant
- Nextcloud

---

## Tailnet Monitoring

Monitor:

- Authorized Devices
- Device Health
- Connectivity Status

Reference:

VPN-ARCHITECTURE.md

---

# Alert Priorities

## Priority 1

Immediate Action Required.

Examples:

- UDM-Pro Failure
- DNS Failure
- OpenMediaVault Failure
- AdGuard Failure
- Vaultwarden Failure
- Home Assistant Failure
- Immich Failure
- Paperless Failure
- Nextcloud Failure
- Backup Failure

---

## Priority 2

Investigation Required.

Examples:

- Homepage Failure
- Uptime Kuma Failure
- Audiobookshelf Failure
- Navidrome Failure
- Syncthing Failure

---

## Priority 3

Review As Practical.

Examples:

- Plex Failure
- ARR Stack Failure
- Tautulli Failure
- MeTube Failure
- Stirling-PDF Failure

---

# Dashboard Organization

## Infrastructure

- UDM-Pro
- DAX
- MAX
- PAX
- JAX

---

## Network Services

- AdGuard Primary
- AdGuard Secondary
- Tailscale

---

## Storage Platform

- OpenMediaVault
- Kopia
- OneDrive Replication