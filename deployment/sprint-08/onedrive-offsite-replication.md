# onedrive-offsite-replication

## Purpose

Provide offsite disaster recovery protection for the WoogleNet backup platform through encrypted replication of Kopia repositories to Microsoft OneDrive.

OneDrive provides:

- Offsite Backup Storage
- Geographic Separation
- Disaster Recovery Protection
- Encrypted Backup Retention
- Ransomware Recovery Protection
- Secondary Recovery Source

Reference Documents:

- kopia-backup-platform.md
- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md

---

# Platform Information

Platform:

Microsoft OneDrive

Role:

Offsite Backup Repository

Classification:

Critical Infrastructure

Sprint:

08 - Backup & Recovery

---

# Architecture Role

OneDrive serves as the offsite storage target for Kopia backups.

Architecture:

Protected Services
↓
Kopia
↓
Local Repository
↓
Verification
↓
OneDrive Replication

OneDrive is not the primary backup system.

Kopia remains the authoritative backup platform.

OneDrive provides disaster recovery storage only.

---

# Recovery Model

Primary Recovery Path:

Kopia Repository
↓
Service Restore

Preferred Recovery Method

---

Disaster Recovery Path:

OneDrive
↓
Restore Kopia Repository
↓
Restore Service
↓
Validation

Emergency Recovery Method

---

# Design Goals

The offsite replication platform must provide:

- Geographic Separation
- Disaster Recovery Capability
- Backup Redundancy
- Secure Storage
- Ransomware Resilience
- Long-Term Retention
- Recovery Validation

---

# Protected Data

## Tier 1 Critical

Required Offsite Protection

- Vaultwarden
- Home Assistant
- Immich
- Paperless
- Nextcloud
- BookStack

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

## Tier 2 Important

Required Offsite Protection

- Navidrome
- Audiobookshelf
- Syncthing
- Homepage
- Uptime Kuma

---

## Tier 3 Rebuildable

Configuration Backup Only

- Plex
- ARR Stack
- AdGuard
- Gluetun

---

# Replication Scope

Replicate:

- Kopia Repository
- Snapshot Metadata
- Recovery Metadata
- Repository Configuration

Source:

/storage/backups/kopia

Destination:

OneDrive Backup Repository

---

# Repository Ownership

System Of Record:

Kopia

Offsite Storage:

OneDrive

Policy:

Never restore services directly from OneDrive data structures.

Restoration workflow:

OneDrive
↓
Restore Kopia Repository
↓
Restore Service

This ensures a single authoritative backup platform.

---

# OneDrive Requirements

Account Type:

Dedicated Backup Account

Purpose:

Backup Storage Only

Administrative Access:

Restricted

MFA:

Required

Reference:

SECURITY-BASELINE.md

---

# Security Requirements

Requirements:

- MFA Enabled
- Encrypted Backups
- Strong Credentials
- Dedicated Backup Account
- Restricted Access

Reference:

secrets-management-standard.md

---

# Credential Management

Store:

- OneDrive Credentials
- Recovery Information
- MFA Recovery Codes

Location:

Vaultwarden

Prohibited:

- Git Repositories
- Documentation Files
- Compose Files
- Screenshots

Reference:

secrets-management-standard.md

---

# Encryption Requirements

Repository Encryption:

Required

Encryption Provider:

Kopia

OneDrive stores encrypted repository data.

OneDrive never contains unencrypted backup data.

Encryption keys remain under Kopia management.

---

# Replication Schedule

Daily Replication:

After Successful Daily Backup

Weekly Replication:

After Weekly Backup Completion

Monthly Replication:

After Monthly Backup Completion

Requirements:

- Backup Verification Complete
- Snapshot Creation Complete
- Repository Integrity Verified

Before Replication Begins

---

# Retention Policy

OneDrive retains:

- Daily Retention Set
- Weekly Retention Set
- Monthly Retention Set

Retention authority remains managed by Kopia.

OneDrive should mirror the Kopia retention policy.

Reference:

kopia-backup-platform.md

---

# Access Control

Allowed Access:

- Trusted VLAN
- Tailscale

Public Internet Administration:

Not Permitted

Backup Repository Access:

Restricted Administrators Only

Reference:

REMOTE-ACCESS.md

---

# Monitoring Requirements

Monitor:

- Replication Success
- Replication Failure
- Last Successful Sync
- Storage Capacity
- Authentication Status

Alert Level:

Critical

Reference:

MONITORING-AND-ALERTING.md

---

# Bandwidth Management

Objectives:

- Minimize Internet Utilization
- Transfer Changed Data Only
- Utilize Kopia Deduplication

Requirements:

- Incremental Transfers
- Recovery Verification
- Replication Monitoring

---

# Validation Requirements

Verify:

- Authentication Successful
- Repository Accessible
- Latest Snapshots Replicated
- Incremental Updates Functional
- Replication Completes Successfully

Validation Frequency:

Weekly

---

# Offsite Recovery Validation

Quarterly Validation Required

Procedure:

1. Select Recent Snapshot
2. Restore Repository Metadata
3. Verify Snapshot Visibility
4. Verify Data Integrity
5. Validate Recovery Documentation

Result:

PASS / FAIL

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Failure Scenarios

## Authentication Failure

Symptoms:

- Login Failure
- Replication Failure

Actions:

- Verify Credentials
- Verify MFA
- Verify Account Status

---

## Replication Failure

Symptoms:

- Missing Backups
- Stale Repository

Actions:

- Verify Connectivity
- Verify Repository Health
- Retry Replication
- Review Logs

---

## Capacity Warning

Symptoms:

- Storage Utilization High

Actions:

- Review Retention Policy
- Review Capacity Growth
- Update Storage Planning

---

## Repository Mismatch

Symptoms:

- Missing Snapshots
- Inconsistent Metadata

Actions:

- Verify Local Repository
- Re-run Replication
- Validate Repository Integrity

---

# Recovery Procedure

## Local Repository Lost

1. Authenticate To OneDrive
2. Retrieve Latest Repository Copy
3. Restore Kopia Repository
4. Validate Repository Integrity
5. Validate Snapshots
6. Begin Service Recovery

---

## Site Disaster

1. Access OneDrive
2. Restore Kopia Repository
3. Validate Backups
4. Restore Tier 1 Services
5. Restore Tier 2 Services
6. Restore Tier 3 Services
7. Perform Recovery Validation

---

# Success Criteria

Deployment is complete when:

- OneDrive Connected
- MFA Enabled
- Replication Operational
- Daily Replication Successful
- Weekly Replication Successful
- Monthly Replication Successful
- Monitoring Operational
- Offsite Recovery Validation Successful
- Documentation Updated

---

# Operational Requirements

Daily:

- Review Replication Status

Weekly:

- Validate Latest Replication

Monthly:

- Capacity Review

Quarterly:

- Offsite Recovery Testing

Annual:

- Disaster Recovery Review

---

# Success Criteria

The offsite replication platform is considered operational when:

- Kopia Repository Replicated
- Offsite Copies Available
- Recovery Testing Successful
- Monitoring Functional
- MFA Enabled
- Documentation Current
- Disaster Recovery Objectives Met