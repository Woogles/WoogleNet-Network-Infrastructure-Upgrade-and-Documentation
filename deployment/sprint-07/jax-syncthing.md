# jax-syncthing

## Purpose

Deploy Syncthing on JAX to provide secure peer-to-peer file synchronization between trusted devices, mobile devices, and WoogleNet storage repositories.

Syncthing provides:

- Device Synchronization
- File Replication
- Folder Synchronization
- Offline Synchronization
- Cross-Platform Support
- Automatic File Distribution
- Data Redundancy
- Secure Device Connectivity

Reference Documents:

- STORAGE-MAP.md
- SERVICE-DEPENDENCIES.md
- SECURITY-BASELINE.md
- RECOVERY-TIME-OBJECTIVES.md
- REMOTE-ACCESS.md
- docker-standard.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-syncthing

Role:

Device Synchronization Platform

Port:

8384/TCP

Additional Ports:

22000/TCP

22000/UDP

21027/UDP

---

# Architecture Role

Syncthing serves as the trusted synchronization engine for WoogleNet.

Workflow:

Device
↓
Syncthing
↓
Synchronization
↓
Storage Repository
↓
Peer Devices

Related Services:

- Nextcloud
- Paperless-ngx
- Home Assistant

Syncthing complements Nextcloud by providing direct device-to-device synchronization.

---

# Resource Allocation

CPU:

2 vCPU

Memory:

2 GB

Storage:

20 GB

---

# Service Classification

Service Tier:

Tier 2 Important

Recovery Priority:

2

Target Recovery Time:

72 Hours

Target Recovery Point:

7 Days

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Storage Configuration

Application Data:

/storage/appdata/syncthing

Synchronization Repository:

/storage/documents/syncthing

User Sync Data:

/storage/documents/syncthing/user-data

Mobile Sync Data:

/storage/documents/syncthing/mobile

Shared Sync Data:

/storage/documents/syncthing/shared

Container Mounts:

/storage/appdata/syncthing
→
/config

/storage/documents/syncthing/user-data
→
/sync/user-data

/storage/documents/syncthing/mobile
→
/sync/mobile

/storage/documents/syncthing/shared
→
/sync/shared

Backup Classification:

Important

Backup Required:

Yes

Reference:

STORAGE-MAP.md

---

# Repository Structure

Syncthing Repository:

/storage/documents/syncthing

Structure:

/storage/documents/syncthing
├── user-data
├── mobile
└── shared

Purpose:

user-data

- User Files
- Work Files
- Personal Data

mobile

- Mobile Device Synchronization
- Photo Synchronization
- Document Synchronization

shared

- Family Shared Files
- Shared Projects
- Common Resources

---

# Synchronization Model

Primary Purpose:

- Device Synchronization
- Backup Synchronization
- Mobile File Collection
- Distributed File Access

Not Intended For:

- Long-Term Document Archival
- OCR Processing
- Document Management

Responsibility Split:

Paperless

- Document Archive
- OCR Processing
- Records Management

Nextcloud

- Private Cloud
- User File Access
- Collaboration

Syncthing

- Direct File Synchronization
- Device Replication
- Mobile Data Collection

---

# Service Dependencies

Required Services:

- DNS
- Storage
- Network

Optional Services:

- Nextcloud
- Paperless-ngx

Reference:

SERVICE-DEPENDENCIES.md

---

# Device Management

Supported Devices:

- Windows
- Linux
- Android
- iOS
- macOS

Approved Devices Only

Unknown devices must not be approved automatically.

---

# Synchronization Policy

Device Approval:

Manual

Folder Approval:

Manual

Auto-Accept New Devices:

Disabled

Auto-Accept New Folders:

Disabled

Purpose:

Reduce unauthorized synchronization.

Reference:

SECURITY-BASELINE.md

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

/storage/documents/syncthing/user-data

Read/Write:

/storage/documents/syncthing/mobile

Read/Write:

/storage/documents/syncthing/shared

Create:

- Synchronized Files
- Synchronized Directories
- Metadata Records

Modify:

- Existing Files
- Existing Folders
- Replicated Data

Delete:

- Synchronized Files
- Synchronized Directories

---

# Permission Validation

Verify:

- File Creation
- File Modification
- File Deletion
- Folder Creation
- Folder Synchronization
- Device Synchronization

Result:

PASS / FAIL

---

# Synchronization Workflows

## Desktop Synchronization

Desktop
↓
Syncthing
↓
JAX Repository
↓
Peer Devices

---

## Mobile Upload Workflow

Mobile Device
↓
Syncthing
↓
Mobile Repository
↓
Storage

---

## Shared Folder Workflow

User
↓
Shared Folder
↓
JAX
↓
Approved Devices

---

# Security Requirements

Data Classification:

Personal Data

Possible Contents:

- User Files
- Family Files
- Photos
- Documents
- Project Data

Requirements:

- No Internet Exposure
- Trusted Device Approval
- Manual Folder Approval
- Tailscale Protected Access
- Daily Backup

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
- Synchronization Status
- Device Connectivity
- Storage Capacity

Alert Level:

Important

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Configuration
- Device Configuration
- Folder Configuration
- Synchronization Database

Do Not Backup:

- Temporary Synchronization Cache
- Temporary Processing Files

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
- Device Pairing Functional
- Folder Sharing Functional
- File Synchronization Functional
- Mobile Synchronization Functional
- Backup Functional

Validation Workflow:

1. Start Service
2. Pair Test Device
3. Create Test Folder
4. Synchronize Test File
5. Modify File
6. Verify Replication
7. Delete File
8. Verify Synchronization
9. Verify Backup Included

---

# Failure Scenarios

## Device Pairing Failure

Symptoms:

- Device Cannot Connect

Actions:

- Verify Device ID
- Verify Network Connectivity
- Verify Firewall Rules

---

## Synchronization Failure

Symptoms:

- Files Not Updating

Actions:

- Verify Folder Configuration
- Verify Permissions
- Verify Connectivity

---

## Storage Failure

Symptoms:

- Replication Errors
- Missing Files

Actions:

- Verify Storage Availability
- Verify OMV
- Verify Mounts
- Verify Permissions

---

## Database Failure

Symptoms:

- Configuration Errors
- Sync State Lost

Actions:

- Restore Configuration Backup
- Restore Sync Database
- Validate Device Pairings

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Restore Device Configuration
4. Restore Synchronization Database
5. Verify Folder Access
6. Verify Device Pairing
7. Test File Synchronization
8. Validate Backup Inclusion
9. Return Service To Production

---

# Success Criteria

Deployment is complete when:

- Syncthing Operational
- Device Pairing Functional
- Folder Synchronization Functional
- Mobile Synchronization Functional
- Backup Protection Enabled
- Monitoring Configured
- Security Controls Applied
- Documentation Updated