# Logging Standard

## Purpose

This document defines the logging, retention, audit, and event management standards for all WoogleNet infrastructure, platforms, applications, and services.

The goals of this standard are to:

- Improve troubleshooting
- Improve security visibility
- Aid incident response
- Support operational audits
- Support disaster recovery
- Standardize log retention

All deployed services must comply with this standard unless a documented exception exists.

Reference:

```text
SERVICE-DECISIONS.md
```

---

# Logging Philosophy

## Principle 1

Logs are operational evidence.

---

## Principle 2

Important events should be recorded once and retained appropriately.

---

## Principle 3

Security events should never be ignored.

---

## Principle 4

Retention must balance operational value and storage consumption.

---

## Principle 5

Logs should support diagnosis without requiring reproduction of failures.

---

# Scope

This standard applies to:

## Infrastructure

```text
UDM-Pro
Switches
Access Points
DAX
MAX
PAX
JAX
```

---

## Core Services

```text
AdGuard
Homepage
Uptime Kuma
OpenMediaVault
```

---

## Critical Services

```text
Vaultwarden
Home Assistant
Immich
Paperless
Nextcloud
BookStack
```

---

## Media Services

```text
Plex
Audiobookshelf
Navidrome
ARR Stack
```

---

## Utility Services

```text
MeTube
Stirling-PDF
Tautulli
```

---

# Log Classification

## Operational Logs

Purpose:

```text
Service Health

Errors

Warnings

Startup Events

Shutdown Events
```

Examples:

```text
Application Startup

Application Shutdown

Database Connectivity

Configuration Loading
```

---

## Security Logs

Purpose:

```text
Authentication

Authorization

Administrative Changes
```

Examples:

```text
Successful Logins

Failed Logins

Permission Changes

Configuration Changes
```

---

## Audit Logs

Purpose:

```text
Who

What

When
```

Examples:

```text
Administrative Actions

User Creation

User Removal

Service Changes
```

---

# Logging Requirements

## Required For All Services

Capture:

```text
Startup Events

Shutdown Events

Errors

Warnings

Administrative Changes
```

---

## Recommended

Capture:

```text
Performance Events

Usage Metrics

Resource Consumption
```

---

# Security Logging Requirements

## Authentication Events

Must Record:

```text
Successful Login

Failed Login

Logout Event

Password Change
```

---

## Administrative Actions

Must Record:

```text
Settings Changes

Role Changes

Permission Changes

Service Restarts
```

---

## Account Events

Must Record:

```text
User Created

User Deleted

User Disabled

MFA Enabled

MFA Disabled
```

---

# Retention Policy

## Infrastructure Logs

Retention:

```text
180 Days
```

---

## Security Logs

Retention:

```text
365 Days
```

---

## Application Logs

Retention:

```text
90 Days
```

---

## Debug Logs

Retention:

```text
30 Days
```

---

# Log Storage

## Default Location

Local service storage.

---

## Preferred Future State

Centralized logging platform.

Status:

```text
Future Enhancement
```

Potential Platforms:

```text
Grafana Loki

Graylog

ELK Stack
```

---

# Critical Log Sources

## UDM-Pro

Retain:

```text
Firewall Events

Authentication Events

Connectivity Events
```

---

## Proxmox Hosts

Retain:

```text
Authentication

VM Events

LXC Events

Storage Events
```

---

## OpenMediaVault

Retain:

```text
Storage Events

SMB Events

Disk Errors

RAID Events
```

---

## Vaultwarden

Retain:

```text
Login Events

MFA Events

Administrative Actions
```

---

## Home Assistant

Retain:

```text
Authentication Events

Automation Failures

System Failures
```

---

# Log Review Schedule

## Weekly

Review:

```text
Critical Errors

Failed Backups

Authentication Failures
```

---

## Monthly

Review:

```text
Storage Warnings

Capacity Warnings

Repeated Service Failures
```

---

## Quarterly

Review:

```text
Security Events

Administrative Changes

Audit Trails
```

---

# Event Severity Levels

## Critical

Examples:

```text
Data Loss

Backup Failures

Storage Failures

Security Breaches
```

Action:

```text
Immediate Investigation
```

---

## High

Examples:

```text
Service Outages

Repeated Authentication Failures

DNS Failures
```

Action:

```text
Same Day Investigation
```

---

## Medium

Examples:

```text
Configuration Warnings

Resource Constraints
```

Action:

```text
Next Maintenance Window
```

---

## Low

Examples:

```text
Informational Events

Expected Restarts
```

Action:

```text
Review As Needed
```

---

# Failed Authentication Monitoring

## Threshold

Generate Alert When:

```text
5 Failed Logins

Within

15 Minutes
```

---

## Applicable Systems

```text
Vaultwarden
Nextcloud
BookStack
Home Assistant
Proxmox
OpenMediaVault
```

---

# Storage Monitoring Events

Alert When:

## Warning

```text
80% Utilization
```

---

## Critical

```text
90% Utilization
```

---

## Emergency

```text
95% Utilization
```

---

# Backup Logging Requirements

All backup jobs must record:

```text
Start Time

Completion Time

Result

Repository

Backup Size
```

---

## Backup Failures

Must Generate:

```text
Alert
```

and

```text
Log Entry
```

---

# Service Change Logging

All significant changes should be recorded.

Examples:

```text
New Service

Major Upgrade

Network Change

Storage Change

Security Policy Change
```

---

## Change Record Location

```text
SERVICE-DECISIONS.md
```

and

```text
OPERATIONS-RUNBOOK.md
```

when applicable.

---

# Incident Logging

All major incidents should include:

```text
Date

System

Issue

Root Cause

Resolution

Lessons Learned
```

---

## Storage Location

```text
incidents/
```

Future repository folder.

---

# Privacy Requirements

Logs must not contain:

```text
Passwords

Recovery Keys

Encryption Keys

Secrets
```

---

## API Keys

Mask whenever supported.

---

## Tokens

Mask whenever supported.

---

# Validation Checklist

## Service Logging

- [ ] Error Logging Enabled
- [ ] Warning Logging Enabled
- [ ] Startup Logging Enabled
- [ ] Shutdown Logging Enabled

---

## Security Logging

- [ ] Authentication Logging Enabled
- [ ] Administrative Logging Enabled
- [ ] Account Logging Enabled

---

## Backup Logging

- [ ] Backup Success Logged
- [ ] Backup Failure Logged

---

## Review Process

- [ ] Weekly Review Defined
- [ ] Monthly Review Defined
- [ ] Quarterly Review Defined

---

# Compliance Checklist

Applicable To All Services

- [ ] Logging Enabled
- [ ] Security Events Logged
- [ ] Retention Defined
- [ ] Review Schedule Defined
- [ ] Backup Logging Enabled

---

# Future Enhancements

Potential Future Projects:

```text
Grafana Loki

Graylog

ELK Stack

Security Event Aggregation

Centralized Syslog
```

---

# Related Standards

- naming-standard.md
- monitoring-standard.md
- backup-standard.md
- network-security-standard.md
- service-hardening-standard.md
- SECURITY-BASELINE.md
- OPERATIONS-RUNBOOK.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Logging Standard |