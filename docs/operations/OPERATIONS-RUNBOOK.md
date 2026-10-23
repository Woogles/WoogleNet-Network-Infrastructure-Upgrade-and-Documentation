# OPERATIONS-RUNBOOK

## Purpose

This document defines the operational procedures used to manage, maintain, secure, monitor, validate, recover, and govern the WoogleNet environment.

The purpose of this runbook is to:

- Standardize Administration
- Reduce Operational Risk
- Support Security Governance
- Support Documentation Governance
- Support Recovery Operations
- Support Readiness Reviews
- Support Certification Reviews
- Ensure Long-Term Sustainability

This document serves as the primary operational guide for the WoogleNet environment.

Reference Documents:

- ARCHITECTURE.md
- HARDWARE-INVENTORY.md
- SERVICE-INVENTORY.md
- DOCUMENT-INDEX.md
- PROGRAM-STATUS.md

---

# Governance Framework

Operations are governed through the following standards and programs.

## Security Governance

- SECURITY-BASELINE.md
- MFA-STANDARD.md
- SSH-STANDARD.md
- CREDENTIAL-MANAGEMENT-STANDARD.md
- SECURITY-AUDIT-PROGRAM.md

---

## Documentation Governance

- DOCUMENTATION-GOVERNANCE-STANDARD.md
- DOCUMENT-INDEX.md

---

## Recovery Governance

- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md

---

## Operational Governance

- service-readiness-matrix.md
- operations-readiness-assessment.md
- production-readiness-review.md
- operational-validation-report.md
- ENVIRONMENT-CERTIFICATION.md

---

# Operational Principles

## Core Rules

1. Documentation must reflect reality.
2. Security standards are mandatory.
3. Backups must exist before major changes.
4. Critical services must be monitored.
5. Recovery procedures must remain current.
6. Certification evidence must be maintained.
7. Governance reviews must occur on schedule.
8. Simplicity is preferred over unnecessary complexity.
9. Changes must be documented.
10. Recovery must be continuously validated.

---

# Administrative Standards

## Approved Administrative Access

Administrative access is permitted through:

```text
Trusted VLAN
Tailscale
Physical Console
```

Administrative access from the public Internet is prohibited.

Reference:

- SSH-STANDARD.md
- VPN-ARCHITECTURE.md

---

## Credential Management

All administrative credentials shall be stored within:

```text
Vaultwarden
```

Examples:

- UDM-Pro
- TP-Link Switches
- Proxmox
- OpenMediaVault
- Home Assistant
- Tailscale
- Service Administration Accounts

Reference:

CREDENTIAL-MANAGEMENT-STANDARD.md

---

## MFA Requirements

Administrative access requiring MFA includes:

- Vaultwarden
- Tailscale
- Home Assistant Administration
- Nextcloud Administration
- Infrastructure Administration

Reference:

MFA-STANDARD.md

---

# Change Management

## Change Philosophy

Changes should be:

- Planned
- Documented
- Reversible
- Recoverable

Critical services should never be modified without a known recovery path.

---

## Documentation Requirements

Documentation updates are required when:

- Services Are Added
- Services Are Removed
- Infrastructure Changes
- Security Controls Change
- Storage Layout Changes
- Recovery Procedures Change
- Governance Processes Change

Reference:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

## Required Documentation Review

Review as applicable:

```text
ARCHITECTURE.md
HARDWARE-INVENTORY.md
SERVICE-INVENTORY.md
SERVICE-DEPENDENCIES.md
STORAGE-ARCHITECTURE.md
STORAGE-MAP.md
OPERATIONS-RUNBOOK.md
```

---

## Change Validation

Verify:

- Service Availability
- Storage Connectivity
- Monitoring Coverage
- Backup Coverage
- Documentation Accuracy

Before closing the change.

---

# Service Lifecycle Management

## New Service Introduction

### Step 1

Review service requirements.

Document:

- Purpose
- Host Platform
- Storage Requirements
- Backup Requirements
- Recovery Requirements
- Security Requirements
- Monitoring Requirements

---

### Step 2

Determine deployment location.

Options:

```text
LXC
Docker
VM
```

Reference:

ARCHITECTURE.md

---

### Step 3

Update Documentation

Required:

```text
SERVICE-INVENTORY.md
STORAGE-MAP.md
SERVICE-DEPENDENCIES.md
```

---

### Step 4

Deploy Service

---

### Step 5

Validate Service

Confirm:

- Service Operational
- Storage Connected
- Monitoring Configured
- Backup Configured
- Recovery Documented

---

### Step 6

Add To Readiness Reviews

Reference:

service-readiness-matrix.md

---

## Service Retirement

Before service removal:

Verify:

- Data Archived
- Dependencies Reviewed
- Documentation Updated
- Monitoring Removed
- Backups Reviewed

---

# Monitoring Operations

## Monitoring Platforms

### Homepage

Purpose:

```text
Dashboard
Visibility
Access
```

---

### Uptime Kuma

Purpose:

```text
Monitoring
Alerting
Notifications
```

---

## Monitoring Requirements

Every production service must:

- Appear in Homepage
- Be monitored by Uptime Kuma
- Have documented ownership
- Have a documented recovery path

Reference:

service-readiness-matrix.md

---

## Alert Response Procedure

### Step 1

Identify affected service.

---

### Step 2

Determine impact:

- Critical
- Important
- Standard

---

### Step 3

Review logs and metrics.

---

### Step 4

Attempt service restoration.

---

### Step 5

Escalate to recovery procedures if required.

Reference:

DISASTER-RECOVERY.md

---

# Backup Operations

## Backup Policy

Operational rule:

```text
Backup First
Change Second
```

---

## Backup Platform

Primary Backup Platform:

```text
Kopia
```

---

## Backup Destinations

### Local Repository

```text
OpenMediaVault
```

### Offsite Repository

```text
OneDrive
```

---

## Verify Before Major Changes

Confirm:

- Backup Completed
- Repository Healthy
- Restore Path Known

Reference:

BACKUP-AND-RESTORE.md

---

# Recovery Operations

## Recovery Philosophy

The environment is designed to be:

```text
Recoverable
Not Highly Available
```

---

## Recovery Priority

### Tier 1

Recover First:

- Vaultwarden
- Home Assistant
- Immich
- Paperless
- Nextcloud
- BookStack
- AdGuard

---

### Tier 2

Recover Second:

- Audiobookshelf
- Navidrome
- Syncthing
- Homepage
- Uptime Kuma

---

### Tier 3

Recover Third:

- Plex
- Tautulli
- MeTube
- ARR Platform

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

## Recovery Escalation

Reference:

- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- disaster-recovery-exercise.md

---

# Documentation Operations

## Documentation Sources

Authoritative documentation is maintained in:

- Repository
- BookStack

---

## Documentation Expectations

Documentation must be:

✅ Accurate

✅ Current

✅ Reviewed

✅ Searchable

✅ Recoverable

Reference:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

## Documentation Reviews

### Monthly

Review:

- Recent Changes
- Service Updates
- New Documentation

---

### Quarterly

Review:

- Service Documentation
- Security Documentation
- Recovery Documentation

---

### Annual

Perform:

- Full Documentation Audit

Reference:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

# Security Operations

## Security Reviews

Security reviews are governed through:

SECURITY-AUDIT-PROGRAM.md

---

## Review Scope

Review:

- MFA Compliance
- Credential Management
- Administrative Accounts
- Tailscale Access
- SSH Controls
- Backup Protection

---

## Security Findings

Track findings as:

- Critical
- High
- Medium

Reference:

SECURITY-AUDIT-PROGRAM.md

---

# Readiness & Certification Operations

## Readiness Validation Chain

```text
Service Inventory
        ↓
Service Readiness Matrix
        ↓
Operations Readiness Assessment
        ↓
Disaster Recovery Exercise
        ↓
Production Readiness Review
        ↓
Operational Validation Report
        ↓
Environment Certification
```

---

## Operational Reviews

### Quarterly

Review:

- Service Readiness
- Security Status
- Backup Status
- Documentation Status

---

### Annual

Review:

- Architecture
- Recovery Validation
- Operational Certification
- Governance Programs

---

# Maintenance Schedule

## Monthly

Verify:

- Infrastructure Health
- Service Health
- Storage Health
- Backup Success
- Monitoring Coverage

---

## Quarterly

Verify:

- Security Program
- Documentation Program
- Recovery Program
- Readiness Reviews

---

## Annual

Perform:

- Documentation Audit
- Disaster Recovery Exercise
- Certification Review
- Capacity Review

---

# Operational Checklists

## Service Change Checklist

- [ ] Backup Completed
- [ ] Change Documented
- [ ] Validation Completed
- [ ] Monitoring Verified
- [ ] Documentation Updated

---

## Recovery Checklist

- [ ] Failure Identified
- [ ] Backup Verified
- [ ] Recovery Executed
- [ ] Service Tested
- [ ] Documentation Updated

---

## Readiness Review Checklist

- [ ] Service Inventory Current
- [ ] Readiness Matrix Current
- [ ] Security Findings Reviewed
- [ ] Recovery Validation Current
- [ ] Documentation Current

---

# Future Operational Improvements

Future initiatives may include:

- Operations Automation
- Backup Automation
- Validation Automation
- Audit Automation
- Infrastructure As Code
- Compliance Reporting

These initiatives are managed separately from the completed implementation program.

---

# Success Criteria

This runbook is considered current when:

- Administrative Procedures Current
- Security Standards Referenced
- Recovery Procedures Current
- Documentation Governance Active
- Certification Framework Referenced
- Operational Reviews Defined
- Maintenance Schedules Defined

The runbook must always represent the current operational procedures used to manage the WoogleNet environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Updated following Sprint 08–10 recovery, governance, operational readiness, and certification framework implementation |
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Operations Runbook |