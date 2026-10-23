# Monitoring Standard

## Purpose

This document defines the monitoring, alerting, health check, and operational visibility requirements for all WoogleNet infrastructure and services.

The objectives are to:

- Detect failures before users do
- Detect degradation before outages occur
- Monitor backup success
- Monitor security events
- Define operational ownership
- Support incident response
- Provide capacity planning data

All production systems must comply with this standard.

---

# Monitoring Principles

## Principle 1

Everything important must be monitored.

---

## Principle 2

Everything monitored must have an owner.

---

## Principle 3

Every alert must be actionable.

---

## Principle 4

Every critical system requires alerting.

---

## Principle 5

Monitoring should detect failures before users notice them.

---

# Monitoring Platform

## Primary Platform

```text
Uptime Kuma
```

Service:

```text
dax-uptime
```

Host:

```text
DAX
```

Tier:

```text
Tier 1 Critical
```

---

# Service Classification

## Tier 1 Critical

Examples:

```text
dax-adguard
max-adguard
pax-omv
max-homeassistant
jax-vaultwarden
jax-immich
jax-paperless
jax-nextcloud
```

---

### Requirements

- Uptime Monitoring
- Health Checks
- Alerting
- Backup Monitoring
- Capacity Monitoring

---

## Tier 2 Important

Examples:

```text
jax-plex
jax-audiobookshelf
jax-bookstack
jax-navidrome
```

---

### Requirements

- Uptime Monitoring
- Alerting

---

## Tier 3 Utility

Examples:

```text
dax-homepage
jax-tautulli
jax-metube
jax-stirling
```

---

### Requirements

- Availability Monitoring

---

# Infrastructure Monitoring

## Physical Hosts

Monitor:

```text
dax
max
pax
jax
```

Checks:

- Ping
- Web UI
- SSH

---

## Network Infrastructure

Monitor:

```text
UDM-Pro
Switches
Access Points
```

Checks:

- Ping
- Availability

---

# Service Monitoring Requirements

## DNS

### dax-adguard

Checks:

```text
Ping
HTTP
DNS Query
```

---

### max-adguard

Checks:

```text
Ping
HTTP
DNS Query
```

---

## Storage

### pax-omv

Checks:

```text
Ping
HTTPS
Storage Capacity
```

---

## Password Management

### jax-vaultwarden

Checks:

```text
Ping
HTTPS
Application Availability
```

---

## Media Services

### jax-plex

Checks:

```text
Ping
HTTPS
Application Availability
```

---

# Health Check Standards

## Default Interval

```text
60 Seconds
```

---

## Retry Count

```text
3
```

---

## Consecutive Failures

Generate Alert After:

```text
3 Consecutive Failures
```

---

## Recovery Notification

Required:

```text
Yes
```

---

# Alert Priorities

## Priority 1

Critical Infrastructure

Examples:

```text
DNS Offline
OMV Offline
Vaultwarden Offline
Home Assistant Offline
```

Response Goal:

```text
1 Hour
```

---

## Priority 2

Important Services

Examples:

```text
Immich Offline
Paperless Offline
Nextcloud Offline
Plex Offline
```

Response Goal:

```text
4 Hours
```

---

## Priority 3

Utility Services

Examples:

```text
Homepage Offline
Tautulli Offline
```

Response Goal:

```text
Next Maintenance Window
```

---

# Notification Channels

## Required

### Email

```text
Enabled
```

---

### Mobile Notifications

```text
Enabled
```

---

## Test Frequency

```text
Quarterly
```

---

# Capacity Monitoring

## Storage Warning

```text
80%
```

---

## Storage Critical

```text
90%
```

---

## CPU Alert

```text
90%
```

for:

```text
15 Minutes
```

---

## Memory Alert

```text
90%
```

for:

```text
15 Minutes
```

---

# Backup Monitoring

Monitor:

```text
Kopia Jobs

Repository Status

Repository Capacity

OneDrive Sync Status
```

---

## Alert Conditions

- Backup Failure
- Missed Backup
- Repository Offline
- Offsite Sync Failure

---

# Security Monitoring

Monitor:

```text
Failed Authentication

Repeated Login Failures

Service Restarts

Configuration Changes
```

---

## Authentication Alert Threshold

```text
5 Failed Logins

Within 15 Minutes
```

---

# Service Ownership

## Primary Owner

```text
Eric Yacoub
```

---

## Responsibilities

- Monitor Alerts
- Investigate Incidents
- Validate Backups
- Review Capacity
- Update Monitoring

---

# Weekly Review

Review:

- Alert History
- Capacity Growth
- Service Availability
- Backup Results

---

# Monthly Review

Review:

- Monitor Coverage
- Notification Reliability
- False Positives
- Capacity Forecasts

---

# Quarterly Review

Review:

- Monitoring Standards
- SLA Compliance
- Backup Validation
- Alert Effectiveness

---

# New Service Onboarding

Before a service enters production:

- [ ] Added To Uptime Kuma
- [ ] Assigned Priority
- [ ] Alerting Configured
- [ ] Notification Tested
- [ ] Health Check Verified
- [ ] Ownership Assigned

---

# Compliance Checklist

All Production Services Must Have:

- [ ] Monitoring
- [ ] Alerting
- [ ] Assigned Owner
- [ ] Health Check
- [ ] Recovery Notification
- [ ] Capacity Monitoring (if applicable)

---

# Related Standards

- naming-standard.md
- backup-standard.md
- service-hardening-standard.md
- logging-standard.md
- network-security-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Added service tiers, ownership, SLA targets, onboarding, and operational review procedures |