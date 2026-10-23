# jax-bazarr

## Purpose

Deploy Bazarr on JAX to provide automated subtitle management for media libraries managed by the ARR platform.

Bazarr provides:

- Automatic Subtitle Downloads
- Subtitle Synchronization
- Multi-Language Support
- Sonarr Integration
- Radarr Integration
- Subtitle Health Monitoring
- Library Subtitle Maintenance

Reference Documents:

- automation-architecture.md
- SERVICE-DEPENDENCIES.md
- docker-standard.md
- STORAGE-MAP.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-bazarr

Role:

Subtitle Management Platform

---

# Architecture Role

Bazarr integrates with the media automation platform.

Workflow:

Prowlarr
↓
Sonarr / Radarr
↓
Media Acquisition
↓
Bazarr
↓
Subtitle Acquisition
↓
Media Library

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

/storage/appdata/bazarr

Movie Library:

/storage/media/movies

TV Library:

/storage/media/tv

Container Mounts:

/storage/appdata/bazarr
→
/config

/storage/media/movies
→
/movies

/storage/media/tv
→
/tv

Backup Classification:

Important

Backup Required:

Yes

Reference:

STORAGE-MAP.md

---

# Service Dependencies

Required Services:

- Sonarr
- Radarr
- DNS
- Storage

Optional Services:

- Overseerr
- Plex

Reference:

SERVICE-DEPENDENCIES.md

---

# ARR Integration

## Sonarr

Purpose:

Television subtitle management.

Functions:

- Subtitle Discovery
- Automatic Downloads
- Missing Subtitle Detection

---

## Radarr

Purpose:

Movie subtitle management.

Functions:

- Subtitle Discovery
- Language Matching
- Download Automation

---

# Media Path Mapping

Movie Library:

/storage/media/movies

TV Library:

/storage/media/tv

Container Paths:

Movies:

/movies

TV:

/tv

Requirements:

- Bazarr path mappings must match Sonarr
- Bazarr path mappings must match Radarr
- Library paths must remain consistent across all ARR applications

Path mismatches will prevent:

- Subtitle Discovery
- Subtitle Downloads
- Subtitle Synchronization

Reference:

automation-architecture.md

---

# Subtitle Providers

Supported Providers:

- OpenSubtitles
- Addic7ed
- Subscene (if available)
- Additional approved providers

Provider credentials should be stored in:

Vaultwarden

Reference:

secrets-management-standard.md

---

# Language Strategy

Primary Language:

English

Secondary Languages:

TBD

Requirements:

- Preferred language downloaded automatically
- Existing subtitles synchronized
- Missing subtitles reported

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

- Read Movie Library
- Read TV Library
- Write Subtitle Files
- Update Subtitle Files
- Remove Obsolete Subtitle Files

Required Access:

/storage/media/movies

/storage/media/tv

Validation:

- Create Subtitle File
- Update Subtitle File
- Delete Subtitle File

Without write permissions Bazarr cannot deploy subtitles.

---

# Security Requirements

Container Execution:

Non-root where supported.

Credential Storage:

Vaultwarden

Do Not Store:

- Provider Credentials In Git
- Provider Credentials In Documentation
- Provider Credentials In Compose Files

Reference:

docker-standard.md

secrets-management-standard.md

---

# Monitoring Requirements

Monitor:

- Container Health
- Web Interface Availability
- Subtitle Provider Connectivity
- API Connectivity To Sonarr
- API Connectivity To Radarr

Alert Level:

Important

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Configuration
- Database
- Provider Configuration
- API Settings

Do Not Backup:

- Temporary Metadata
- Logs
- Cache Files

Frequency:

Weekly

---

# Validation

Verify:

- Container Running
- Web Interface Accessible
- Sonarr Connected
- Radarr Connected
- Subtitle Provider Accessible
- Movie Library Visible
- TV Library Visible
- Subtitle Scan Successful
- Subtitle Download Successful
- Subtitle Files Written To Storage

Validation Workflow:

1. Connect Sonarr
2. Connect Radarr
3. Verify Path Mappings
4. Scan Existing Libraries
5. Identify Missing Subtitles
6. Download Test Subtitle
7. Verify Subtitle Written To Storage
8. Verify Subtitle Visible In Media Library

---

# Failure Scenarios

## Sonarr Integration Failure

Symptoms:

- TV Libraries Missing

Actions:

- Verify API Key
- Verify URL
- Verify Container Connectivity

---

## Radarr Integration Failure

Symptoms:

- Movie Libraries Missing

Actions:

- Verify API Key
- Verify URL
- Verify Radarr Availability

---

## Provider Failure

Symptoms:

- Subtitle Downloads Fail

Actions:

- Verify Provider Status
- Verify Credentials
- Test Alternate Provider

---

## Storage Failure

Symptoms:

- Media Paths Unavailable

Actions:

- Verify OMV
- Verify Mounts
- Verify Permissions

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Verify Storage Mounts
4. Verify File Permissions
5. Verify Sonarr Connectivity
6. Verify Radarr Connectivity
7. Verify Subtitle Providers
8. Rescan Libraries
9. Validate Subtitle Downloads
10. Verify Subtitle Files Present

---

# Success Criteria

Deployment is complete when:

- Bazarr Operational
- Sonarr Connected
- Radarr Connected
- Libraries Visible
- Subtitle Downloads Functional
- Monitoring Configured
- Backup Protection Enabled
- Documentation Updated
