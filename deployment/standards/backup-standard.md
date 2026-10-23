# Backup Standard

## Purpose

This document defines the backup, retention, recovery, and validation standards for all systems deployed within the WoogleNet environment.

The goals of this standard are to:

- Protect critical data
- Ensure recoverability
- Standardize backup operations
- Reduce data loss risk
- Support disaster recovery objectives
- Verify backups through regular testing

All systems must comply with this standard unless a documented exception exists.

Reference:

```text
SERVICE-DECISIONS.md
```

---

# Backup Philosophy

## Core Principle

A backup does not exist until it has been successfully restored.

---

## Backup Strategy

WoogleNet follows the:

```text
3-2-1 Strategy
```

### Three Copies

```text
Production Data

Local Backup

Offsite Backup
```

---

### Two Media Types

```text
Primary Storage

Backup Storage
```

---

### One Offsite Copy

```text
OneDrive
```

---

# Backup Platform

## Primary Backup Solution

```text
Kopia
```

---

## Backup Repository

Location:

```text
/storage/backups
```

Hosted on:

```text
OpenMediaVault
```

---

## Offsite Repository

Provider:

```text
Microsoft OneDrive
```

---

# Data Classification

## Tier 1

### Critical

Loss would create significant impact.

Examples:

```text
Vaultwarden

Immich

Paperless-ngx

Nextcloud

Home Assistant

OpenMediaVault

BookStack
```

---

### Requirements

```text
Daily Backup

Offsite Copy

Restore Testing
```

---

## Tier 2

### Important

Loss is recoverable but disruptive.

Examples:

```text
Plex

Audiobookshelf

Navidrome

ARR Stack

Tautulli
```

---

### Requirements

```text
Weekly Backup

Local Retention
```

---

## Tier 3

### Utility

Examples:

```text
Homepage

MeTube

Stirling-PDF

Uptime Kuma
```

---

### Requirements

```text
Configuration Backup

Weekly Backup
```

---

# Backup Frequency

## Tier 1

Frequency:

```text
Daily
```

Preferred Window:

```text
0200-0600
```

---

## Tier 2

Frequency:

```text
Weekly
```

Preferred Window:

```text
Sunday Overnight
```

---

## Tier 3

Frequency:

```text
Weekly
```

---

# Retention Policy

## Daily

Retention:

```text
30 Days
```

---

## Weekly

Retention:

```text
12 Weeks
```

---

## Monthly

Retention:

```text
12 Months
```

---

## Annual

Retention:

```text
3 Years
```

Optional based on storage availability.

---

# Backup Targets

## Local Repository

Primary Target:

```text
/storage/backups
```

---

## Offsite Repository

Secondary Target:

```text
OneDrive
```

---

# Backup Types

## Configuration Backup

Protects:

```text
Application Settings

Configuration Files

Service Definitions
```

Required For:

```text
All Services
```

---

## Data Backup

Protects:

```text
User Data

Photos

Documents

Databases
```

Required For:

```text
Production Services
```

---

## VM Backup

Protects:

```text
Entire Virtual Machine
```

Required For:

```text
Home Assistant

OpenMediaVault
```

---

## LXC Backup

Protects:

```text
Container

Application Data

Configuration
```

Required For:

```text
Infrastructure Containers

Application Containers
```

---

# Service Backup Matrix

| Service | Tier | Frequency | Offsite |
|----------|----------|----------|----------|
| Vaultwarden | Tier 1 | Daily | Yes |
| Immich | Tier 1 | Daily | Yes |
| Paperless | Tier 1 | Daily | Yes |
| Nextcloud | Tier 1 | Daily | Yes |
| Home Assistant | Tier 1 | Daily | Yes |
| BookStack | Tier 1 | Daily | Yes |
| OMV | Tier 1 | Daily | Yes |
| Plex | Tier 2 | Weekly | Optional |
| Audiobookshelf | Tier 2 | Weekly | Optional |
| Navidrome | Tier 2 | Weekly | Optional |
| Homepage | Tier 3 | Weekly | No |
| Uptime Kuma | Tier 3 | Weekly | No |

---

# Encryption Standard

## Repository Encryption

Required:

```text
Yes
```

---

## Backup Passwords

Store In:

```text
Vaultwarden
```

---

## Recovery Keys

Store In:

```text
Vaultwarden

Offline Secure Location
```

---

# Restore Testing Standard

## Tier 1

Frequency:

```text
Quarterly
```

Minimum:

```text
Twice Per Year
```

---

## Tier 2

Frequency:

```text
Semi-Annual
```

---

## Tier 3

Frequency:

```text
Annual
```

---

# Restore Validation

A restore test is successful when:

- Data restores successfully
- Service starts successfully
- Validation tests pass
- Users can access restored data

---

# Recovery Objectives

## Recovery Point Objective (RPO)

### Tier 1

Maximum Loss:

```text
24 Hours
```

---

### Tier 2

Maximum Loss:

```text
7 Days
```

---

### Tier 3

Maximum Loss:

```text
30 Days
```

---

## Recovery Time Objective (RTO)

### Tier 1

Target:

```text
4 Hours
```

---

### Tier 2

Target:

```text
24 Hours
```

---

### Tier 3

Target:

```text
72 Hours
```

---

# Backup Monitoring

## Uptime Kuma

Monitor:

- Backup Jobs
- Backup Repository
- Available Capacity
- OneDrive Connectivity

---

## Alerts

Generate Alerts For:

- Failed Backups
- Missed Backups
- Repository Errors
- Capacity Thresholds

---

# Capacity Management

## Warning Threshold

```text
80%
```

---

## Critical Threshold

```text
90%
```

---

## Action Required

At 80%:

```text
Review Capacity
```

At 90%:

```text
Immediate Action Required
```

---

# Documentation Requirements

Every Service Must Document:

- Backup Method
- Backup Location
- Frequency
- Retention
- Recovery Process

---

## Location

Reference:

```text
BACKUP-AND-RESTORE.md
```

---

# Backup Validation Checklist

## Backup Configuration

- [ ] Repository Defined
- [ ] Schedule Defined
- [ ] Retention Defined
- [ ] Encryption Enabled

---

## Recovery

- [ ] Recovery Procedure Documented
- [ ] Restore Test Completed
- [ ] Restore Test Recorded

---

## Security

- [ ] Backup Credentials Stored
- [ ] Recovery Keys Stored

---

## Monitoring

- [ ] Monitoring Enabled
- [ ] Alerts Enabled

---

# Compliance Checklist

Applies To All Services

- [ ] Backup Configured
- [ ] Schedule Configured
- [ ] Retention Configured
- [ ] Monitoring Configured
- [ ] Recovery Procedure Documented
- [ ] Restore Test Completed

---

# Exceptions

All backup exceptions must document:

- Business Justification
- Risk Assessment
- Mitigations
- Review Date

Location:

```text
SERVICE-DECISIONS.md
```

---

# Related Standards

- service-hardening-standard.md
- network-security-standard.md
- monitoring-standard.md
- logging-standard.md
- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Backup Standard |