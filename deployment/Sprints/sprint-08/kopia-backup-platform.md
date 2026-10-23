# kopia-backup-platform

## Purpose

Deploy and operate Kopia as the standardized backup platform for the WoogleNet environment.

Kopia provides:

- Encrypted Backups
- Incremental Backups
- Deduplication
- Compression
- Scheduled Backups
- Snapshot Management
- Restore Operations
- Offsite Replication Support

Reference Documents:

- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md
- SERVICE-DEPENDENCIES.md
- STORAGE-ARCHITECTURE.md

---

# Platform Information

Platform:

Kopia

Role:

Primary Backup Platform

Classification:

Critical Infrastructure

Sprint:

08 - Backup & Recovery

---

# Backup Architecture

Primary Services
↓
Kopia
↓
Local Repository
↓
Verification
↓
OneDrive Offsite Replication

The backup platform follows the Recovery First design principle.

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Design Goals

The backup platform must provide:

- Reliable Backups
- Fast Restore Operations
- Encrypted Storage
- Offsite Protection
- Recovery Validation
- Version Retention
- Minimal Administrative Overhead

---

# Repository Strategy

## Primary Repository

Platform:

Kopia

Location:

/storage/backups/kopia

Storage Platform:

OpenMediaVault

Purpose:

Authoritative Backup Repository

All backup and restore operations originate from this repository.

Kopia is the system of record for all backup operations.

---

## Offsite Repository

Platform:

OneDrive

Purpose:

Disaster Recovery Protection

Offsite Retention

Repository Replication

OneDrive is not the primary backup repository.

OneDrive serves only as offsite storage for Kopia backup data.

All restore procedures should utilize the local Kopia repository whenever available.

---

# Repository Location

Primary Repository:

/storage/backups/kopia

Repository Type:

Local Repository

Storage Platform:

OpenMediaVault

Backup Classification:

Critical

Reference:

STORAGE-ARCHITECTURE.md

---

# Protected Services

## Tier 1 Critical

Daily Backup Required

- Vaultwarden
- Home Assistant
- Immich
- Paperless
- Nextcloud
- BookStack

Recovery Priority:

1

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

## Tier 2 Important

Daily Backup Required

- Navidrome
- Audiobookshelf
- Syncthing
- Homepage
- Uptime Kuma

Recovery Priority:

2

---

## Tier 3 Rebuildable

Configuration Backup Only

- Plex
- ARR Stack
- AdGuard
- Gluetun

Recovery Priority:

3

---

# Backup Scope

## Included

Configuration:

/storage/appdata

Documents:

/storage/documents

Knowledge Platform:

/storage/documents/paperless

/storage/documents/nextcloud

/storage/documents/bookstack

/storage/documents/syncthing

Media Automation Configuration:

/storage/appdata/*

Home Automation:

/storage/appdata/homeassistant

Credential Platform:

/storage/appdata/vaultwarden

Databases:

- Paperless
- Nextcloud
- BookStack
- Vaultwarden

---

## Excluded

Do Not Backup:

- Container Images
- Docker Cache
- Transcoding Directories
- Application Caches
- Temporary Downloads
- Temporary OCR Files
- System Package Cache

Reference:

docker-standard.md

---

# Backup Schedule

## Daily

Time:

0200

Protected Workloads:

- Tier 1
- Tier 2

Retention:

30 Days

---

## Weekly

Time:

Sunday 0300

Protected Workloads:

All Systems

Retention:

12 Weeks

---

## Monthly

Time:

First Day Of Month

Protected Workloads:

All Systems

Retention:

12 Months

---

# Retention Policy

Daily:

30 Copies

Weekly:

12 Copies

Monthly:

12 Copies

Annual:

Optional

Policy Goal:

Support accidental deletion recovery and disaster recovery scenarios.

---

# Encryption Requirements

Repository Encryption:

Required

Repository Password:

Required

Encryption Standard:

Kopia Default Encryption

Credential Storage:

Vaultwarden

Reference:

secrets-management-standard.md

---

# Access Control

Administrative Access:

- Trusted VLAN
- Tailscale

Public Internet Access:

Not Permitted

Backup Administration Credentials:

Stored In Vaultwarden

Reference:

SECURITY-BASELINE.md

---

# Backup Validation Requirements

Every backup must validate:

- Snapshot Creation
- Repository Health
- Backup Completion
- Backup Consistency

Validation Frequency:

Daily

---

# Restore Validation Requirements

Quarterly Restore Testing Required For:

- Vaultwarden
- Home Assistant
- Immich
- Paperless
- Nextcloud
- BookStack

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Repository Health Monitoring

Monitor:

- Backup Completion
- Snapshot Success
- Storage Capacity
- Repository Integrity
- Offsite Replication Status

Alert Level:

Critical

Reference:

MONITORING-AND-ALERTING.md

---

# Snapshot Strategy

Before:

- Upgrades
- Major Configuration Changes
- Service Migration
- Infrastructure Changes

Create:

Manual Snapshot

Validate:

Snapshot Completion

---

# Backup Workflow

Protected Service
↓
Kopia Snapshot
↓
Encryption
↓
Primary Repository
↓
Verification
↓
OneDrive Replication

Result:

Recoverable Backup

---

# Restore Workflow

Preferred Recovery Path:

Kopia Repository
↓
Restore Operation
↓
Validation
↓
Service Recovery

Emergency Recovery Path:

OneDrive Replica
↓
Restore Kopia Repository
↓
Restore Service
↓
Validation

The local Kopia repository should always be used first when available.

---

# Failure Scenarios

## Backup Failure

Symptoms:

- Missing Snapshot
- Backup Job Failure

Actions:

- Review Logs
- Verify Storage Capacity
- Verify Repository Health
- Retry Backup

---

## Repository Corruption

Symptoms:

- Snapshot Errors
- Verification Failure

Actions:

- Run Repository Validation
- Restore Repository Backup
- Validate Integrity

---

## Storage Failure

Symptoms:

- Write Errors
- Missing Repository

Actions:

- Verify OMV Availability
- Verify Storage Mounts
- Verify Capacity

---

## Encryption Failure

Symptoms:

- Repository Access Denied

Actions:

- Verify Credentials
- Verify Repository Password
- Verify Vaultwarden Records

---

## Offsite Replication Failure

Symptoms:

- OneDrive Synchronization Failure
- Missing Offsite Copies

Actions:

- Verify OneDrive Connectivity
- Verify Repository Health
- Retry Replication
- Validate Latest Offsite Copy

---

# Recovery Procedure

1. Verify Repository Availability
2. Verify Repository Integrity
3. Identify Recovery Point
4. Select Required Snapshot
5. Restore Test Data
6. Validate Restored Data
7. Complete Service Restoration
8. Update Recovery Documentation

---

# Backup Success Criteria

Backup Platform Is Operational When:

- Repository Healthy
- Encryption Enabled
- Daily Backups Successful
- Weekly Backups Successful
- Monthly Backups Successful
- Monitoring Operational
- Restore Validation Successful
- Offsite Replication Successful

---

# Operational Requirements

Required Reviews:

Daily:

- Backup Success Review

Weekly:

- Capacity Review

Monthly:

- Retention Review

Quarterly:

- Restore Testing
- Recovery Validation

Annual:

- Backup Strategy Review

---

# Documentation Requirements

Maintain Documentation For:

- Repository Location
- Retention Policy
- Recovery Procedures
- Restore Procedures
- Credential Storage
- Validation Results

Updated documentation must be stored in:

- BookStack
- Repository Documentation

---

# Success Criteria

Deployment is complete when:

- Kopia Repository Created
- Repository Encryption Enabled
- Daily Backups Operational
- Weekly Backups Operational
- Monthly Backups Operational
- Monitoring Operational
- Restore Testing Operational
- OneDrive Replication Operational
- Recovery Validation Successful
- Documentation Updated
