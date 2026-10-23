# jax-nextcloud

## Purpose

Deploy Nextcloud on JAX to provide secure private cloud storage, file synchronization, mobile access, collaboration, and family file management capabilities.

Nextcloud provides:

- Private Cloud Storage
- File Synchronization
- Mobile Device Synchronization
- File Sharing
- Web File Access
- Family Document Storage
- Centralized File Management
- Cross-Device Access

Reference Documents:

- STORAGE-MAP.md
- SERVICE-DEPENDENCIES.md
- SECURITY-BASELINE.md
- RECOVERY-TIME-OBJECTIVES.md
- docker-standard.md
- REMOTE-ACCESS.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-nextcloud

Role:

Private Cloud Platform

Port:

8084/TCP

---

# Architecture Role

Nextcloud serves as the family cloud storage platform.

Workflow:

User
↓
Nextcloud
↓
File Storage
↓
Synchronization
↓
Device Access

Related Services:

- Paperless-ngx
- Syncthing
- Vaultwarden
- Home Assistant

Nextcloud provides user-facing storage and synchronization while Paperless remains the authoritative document archive.

---

# Resource Allocation

CPU:

4 vCPU

Memory:

8 GB

Storage:

100 GB Initial Allocation

Expandable Through OMV Storage

---

# Service Classification

Service Tier:

Tier 1 Critical

Recovery Priority:

1

Target Recovery Time:

Same Day

Target Recovery Point:

24 Hours

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Storage Configuration

Application Data:

/storage/appdata/nextcloud

Nextcloud Repository:

/storage/documents/nextcloud

User Data:

/storage/documents/nextcloud/data

Shared Data:

/storage/documents/nextcloud/shared

Exports:

/storage/documents/nextcloud/export

Container Mounts:

/storage/appdata/nextcloud
→
/config

/storage/documents/nextcloud/data
→
/data

/storage/documents/nextcloud/shared
→
/shared

/storage/documents/nextcloud/export
→
/export

Backup Classification:

Critical

Backup Required:

Yes

Reference:

STORAGE-MAP.md

---

# Repository Structure

Nextcloud Repository:

/storage/documents/nextcloud

Structure:

/storage/documents/nextcloud
├── data
├── shared
└── export

Purpose:

data

- User Files
- User Uploads
- Device Synchronization

shared

- Family Shared Resources
- Common Documents
- Shared Media

export

- Archive Exports
- Migrations
- Recovery Validation

---

# Service Dependencies

Required Services:

- DNS
- Storage
- Network

Optional Services:

- Syncthing
- Paperless-ngx
- Home Assistant

Reference:

SERVICE-DEPENDENCIES.md

---

# Storage Model

Nextcloud is designed for:

- Active Files
- Shared Files
- Mobile Synchronization
- Device Synchronization
- User Collaboration

Nextcloud is not intended to replace Paperless document archival workflows.

Responsibility Split:

Paperless

- Long-Term Document Archive
- OCR Repository
- Document Search

Nextcloud

- Working Files
- Sync Platform
- User Access
- Collaboration

---

# Supported Content

Examples:

- Documents
- Spreadsheets
- Photos
- Videos
- School Records
- Household Documents
- Project Files
- Family Files

---

# User Management

Initial Users:

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

Future users may be added as required.

Access should follow least-privilege principles.

Reference:

SECURITY-BASELINE.md

---

# Synchronization Workflow

File Created
↓
Nextcloud
↓
Database Update
↓
Client Synchronization
↓
Mobile Access
↓
Web Access

Result:

Consistent file availability across devices.

---

# Network Configuration

DNS Servers:

10.0.10.50
10.0.10.51

Provided By:

- AdGuard Primary
- AdGuard Secondary

Reference:

DNS-ARCHITECTURE.md

---

# Access Policy

Allowed Access:

- Trusted VLAN
- Tailscale

Administrative Access:

- Trusted VLAN
- Tailscale

Public Internet Access:

Not Permitted

Reference:

REMOTE-ACCESS.md

---

# File Permissions

User:

media

Group:

media

Recommended PUID:

1000

Recommended PGID:

1000

Required Permissions

Read/Write:

/storage/documents/nextcloud/data

Read/Write:

/storage/documents/nextcloud/shared

Read/Write:

/storage/documents/nextcloud/export

Create:

- User Files
- Shared Files
- Application Metadata

Modify:

- Existing Files
- User Data
- Shared Content

Delete:

- User Files
- Shared Files
- Temporary Data

---

# Permission Validation

Verify:

- User Upload
- User Download
- User Delete
- Shared Folder Access
- Client Synchronization
- Export Creation

Result:

PASS / FAIL

---

# Security Requirements

Data Classification:

Critical Personal Data

Possible Contents:

- Family Documents
- Personal Documents
- School Records
- Household Records
- Photos
- Shared Files

Requirements:

- No Internet Exposure
- Tailscale Protected Access
- Strong Authentication
- MFA Recommended
- Daily Backup
- Recovery Validation

Reference:

SECURITY-BASELINE.md

---

# Credential Management

Administrative Credentials:

Vaultwarden

Secrets Storage:

Vaultwarden

Do Not Store:

- Credentials In Git
- Credentials In Documentation
- Credentials In Compose Files

Reference:

secrets-management-standard.md

---

# Monitoring Requirements

Monitor:

- Container Health
- Web Interface Availability
- Storage Capacity
- Database Health
- Synchronization Status
- Authentication Health

Alert Level:

Critical

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Configuration
- User Data
- Shared Data
- Export Repository
- Database
- Metadata

Do Not Backup:

- Temporary Cache Files
- Session Cache

Frequency:

Daily

Offsite Backup:

Required

Reference:

BACKUP-AND-RESTORE.md

---

# Validation

Verify:

- Container Running
- Web Interface Accessible
- User Login Functional
- File Upload Successful
- File Download Successful
- Shared Folder Access Functional
- Synchronization Functional
- Backup Functional

Validation Workflow:

1. Start Service
2. Create Test User
3. Upload Test File
4. Download Test File
5. Verify Shared Folder Access
6. Verify Client Synchronization
7. Verify Backup Included
8. Verify Restore Procedure

---

# Failure Scenarios

## Synchronization Failure

Symptoms:

- Files Not Updating

Actions:

- Verify Client Configuration
- Verify Database
- Verify Storage

---

## Storage Failure

Symptoms:

- Upload Failures
- Missing Files

Actions:

- Verify OMV Availability
- Verify Mounts
- Verify Permissions

---

## Database Failure

Symptoms:

- Login Failures
- Missing Metadata

Actions:

- Verify Database Availability
- Restore Database Backup
- Validate Storage

---

## Authentication Failure

Symptoms:

- User Login Issues

Actions:

- Verify User Database
- Verify Nextcloud Configuration
- Verify Authentication Settings

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Restore Database
4. Restore User Data
5. Restore Shared Repository
6. Verify User Authentication
7. Verify File Access
8. Verify Synchronization
9. Perform Restore Validation
10. Return Service To Production

---

# Success Criteria

Deployment is complete when:

- Nextcloud Operational
- User Authentication Functional
- File Storage Functional
- Synchronization Functional
- Shared Access Functional
- Backups Operational
- Recovery Validation Successful
- Monitoring Configured
- Documentation Updated