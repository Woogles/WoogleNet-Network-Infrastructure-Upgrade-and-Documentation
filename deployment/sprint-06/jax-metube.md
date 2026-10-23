# jax-metube

## Purpose

Deploy MeTube on JAX to provide a self-hosted media download platform for approved personal media acquisition workflows.

MeTube provides:

- Web-Based Media Downloads
- YouTube-DL Integration
- yt-dlp Integration
- Audio Downloads
- Video Downloads
- Playlist Downloads
- Browser-Based Media Management

Reference Documents:

- automation-architecture.md
- docker-standard.md
- STORAGE-MAP.md
- SECURITY-BASELINE.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-metube

Role:

Media Download Utility

---

# Architecture Role

MeTube operates as an independent utility service within the media platform.

Workflow:

User Request
↓
MeTube
↓
yt-dlp
↓
Media Download
↓
Storage Repository

Unlike the ARR platform, MeTube is manually initiated by users.

---

# Resource Allocation

CPU:

2 vCPU

Memory:

2 GB

Storage:

10 GB

---

# Storage Configuration

Application Data:

/storage/appdata/metube

Download Repository:

/storage/downloads/metube

Container Mounts:

/storage/appdata/metube
→
/config

/storage/downloads/metube
→
/downloads

Backup Classification:

Low

Backup Required:

Optional

Reference:

STORAGE-MAP.md

---

# Download Repository Structure

Recommended Layout:

/storage/downloads/metube
├── audio
├── video
├── playlists
└── archive

Downloaded content can later be moved into:

/storage/media/music

/storage/media/videos

when appropriate.

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

# Service Dependencies

Required Services:

- DNS
- Storage
- Internet Connectivity

Optional Services:

- Navidrome
- Plex

Reference:

SERVICE-DEPENDENCIES.md

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

Required Permissions:

- Read Download Repository
- Write Download Repository
- Create Folders
- Delete Downloads

Required Access:

/storage/downloads/metube

Validation:

- Create File
- Delete File
- Rename File
- Create Directory

---

# Security Requirements

Container Execution:

Non-root where supported.

Do Not Store:

- Credentials In Git
- Credentials In Documentation
- Credentials In Compose Files

Secrets Storage:

Vaultwarden

Reference:

secrets-management-standard.md

---

# Download Policy

Approved Usage:

- Personal Media Downloads
- Public Domain Media
- User-Owned Content
- Educational Content

Users are responsible for ensuring downloaded content is used appropriately and in accordance with applicable terms and rights.

---

# Monitoring Requirements

Monitor:

- Container Health
- Web Interface Availability
- Storage Availability
- Download Repository Capacity

Alert Level:

Low

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Configuration
- Download Archive Metadata

Do Not Backup:

- Temporary Downloads
- Download Cache
- Container Images

Frequency:

Weekly

---

# Validation

Verify:

- Container Running
- Web Interface Accessible
- yt-dlp Functional
- Download Repository Accessible
- File Permissions Correct
- Test Video Download Successful
- Test Audio Download Successful

Validation Workflow:

1. Start Container
2. Access Web Interface
3. Submit Test Download
4. Verify Download Completes
5. Verify File Written To Storage
6. Verify File Accessible
7. Verify Download Directory Structure

---

# Failure Scenarios

## Download Failure

Symptoms:

- Download Does Not Start
- Processing Errors

Actions:

- Validate Internet Connectivity
- Validate Source URL
- Validate yt-dlp Functionality

---

## Storage Failure

Symptoms:

- Downloads Complete But Files Missing

Actions:

- Verify Storage Mount
- Verify Permissions
- Verify Available Capacity

---

## Container Failure

Symptoms:

- Web Interface Unavailable

Actions:

- Verify Container Status
- Review Logs
- Restart Service

---

## Repository Full

Symptoms:

- New Downloads Fail

Actions:

- Review Storage Usage
- Archive Old Downloads
- Expand Storage Capacity

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Verify Storage Mounts
4. Verify Permissions
5. Validate Download Repository
6. Perform Test Download
7. Verify File Creation
8. Return Service To Production

---

# Success Criteria

Deployment is complete when:

- MeTube Operational
- Web Interface Accessible
- Download Repository Functional
- Test Downloads Successful
- Storage Permissions Validated
- Monitoring Configured
- Documentation Updated