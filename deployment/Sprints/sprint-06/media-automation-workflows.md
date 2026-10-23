# Media Automation Workflows

## Purpose

This document defines the operational workflows, service integrations, and automation processes used by the WoogleNet media platform.

The goals of these workflows are:

- Standardize media acquisition
- Standardize media processing
- Reduce manual intervention
- Improve media organization
- Improve media quality
- Support family media consumption
- Simplify troubleshooting

Reference Documents:

- automation-architecture.md
- SERVICE-DEPENDENCIES.md
- VPN-ARCHITECTURE.md
- STORAGE-MAP.md

---

# Media Automation Architecture

The media platform consists of:

Request Management

- Overseerr

Index Management

- Prowlarr

Media Managers

- Sonarr
- Radarr
- Lidarr
- Readarr

Download Platform

- qBittorrent

VPN Platform

- Gluetun
- NordVPN

Subtitle Management

- Bazarr

Media Delivery

- Plex
- Navidrome
- Audiobookshelf

Monitoring

- Tautulli

---

# Television Acquisition Workflow

Purpose:

Automated television episode acquisition.

Workflow:

User Request
↓
Overseerr
↓
Sonarr
↓
Prowlarr
↓
Indexer Search
↓
qBittorrent
↓
Gluetun
↓
NordVPN
↓
Download Complete
↓
Sonarr Import
↓
Bazarr Subtitle Download
↓
Plex Library Update

Result:

Television content becomes available automatically.

---

# Movie Acquisition Workflow

Purpose:

Automated movie acquisition.

Workflow:

User Request
↓
Overseerr
↓
Radarr
↓
Prowlarr
↓
Indexer Search
↓
qBittorrent
↓
Gluetun
↓
NordVPN
↓
Download Complete
↓
Radarr Import
↓
Bazarr Subtitle Download
↓
Plex Library Update

Result:

Movies become available automatically.

---

# Music Acquisition Workflow

Purpose:

Automated music acquisition.

Workflow:

User Request
↓
Lidarr
↓
Prowlarr
↓
Indexer Search
↓
qBittorrent
↓
Gluetun
↓
NordVPN
↓
Download Complete
↓
Lidarr Import
↓
Navidrome Library Update

Storage Location:

/storage/media/music

Result:

Music automatically appears in Navidrome.

---

# Audiobook Acquisition Workflow

Purpose:

Automated audiobook acquisition.

Workflow:

User Request
↓
Readarr
↓
Prowlarr
↓
Indexer Search
↓
qBittorrent
↓
Gluetun
↓
NordVPN
↓
Download Complete
↓
Readarr Import

Storage Location:

/storage/media/audiobooks

Result:

Audiobooks become available through Audiobookshelf.

---

# Ebook Acquisition Workflow

Purpose:

Automated ebook acquisition.

Workflow:

User Request
↓
Readarr
↓
Prowlarr
↓
Indexer Search
↓
qBittorrent
↓
Gluetun
↓
NordVPN
↓
Download Complete
↓
Readarr Import

Storage Location:

/storage/media/ebooks

Result:

Ebooks organized automatically.

Reference:

STORAGE-MAP.md

---

# Subtitle Workflow

Purpose:

Automated subtitle management.

Workflow:

Media Imported
↓
Bazarr Scan
↓
Missing Subtitle Detection
↓
Subtitle Provider Search
↓
Subtitle Download
↓
Subtitle Deployment
↓
Plex Availability

Managed Libraries:

- Movies
- Television

Result:

Subtitles remain synchronized automatically.

---

# Request Management Workflow

Purpose:

Allow family users to request media.

Workflow:

User
↓
Overseerr
↓
Approval
↓
Sonarr / Radarr
↓
Automation Pipeline

Approved Users:

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

Result:

No direct ARR platform access required.

---

# Download Security Workflow

Purpose:

Protect download traffic.

Workflow:

qBittorrent
↓
Gluetun
↓
NordVPN

Requirements:

- Kill Switch Enabled
- DNS Leak Prevention
- Public IP Replacement
- Tunnel Validation

Reference:

VPN-ARCHITECTURE.md

---

# Media Monitoring Workflow

Purpose:

Track media usage and service health.

Workflow:

Plex
↓
Tautulli
↓
Usage Analytics
↓
Operational Reporting

Monitor:

- Active Streams
- User Activity
- Bandwidth Usage
- Most Viewed Content
- Playback History

Result:

Operational visibility into media services.

---

# Manual Media Download Workflow

Purpose:

Support non-automated downloads.

Workflow:

User
↓
MeTube
↓
yt-dlp
↓
Download Repository
↓
Manual Organization

Storage Location:

/storage/downloads/metube

Result:

User-managed media acquisition.

---

# Failure Workflow

## Indexer Failure

Symptoms:

- Searches Return No Results

Response:

Prowlarr
↓
Indexer Validation
↓
Credential Validation
↓
Service Recovery

---

## VPN Failure

Symptoms:

- Downloads Stop

Expected Behavior:

No Traffic Leakage

Response:

Gluetun Recovery Procedure

Reference:

jax-gluetun.md

---

## Download Failure

Symptoms:

- Stalled Downloads

Response:

qBittorrent Validation
↓
VPN Validation
↓
Storage Validation

---

## Import Failure

Symptoms:

- Downloads Complete But Not Imported

Response:

Validate:

- Path Mappings
- Permissions
- Available Storage

---

# Storage Mapping Standards

Downloads:

/storage/downloads

Movies:

/storage/media/movies

TV:

/storage/media/tv

Music:

/storage/media/music

Audiobooks:

/storage/media/audiobooks

Ebooks:

/storage/media/ebooks

Reference:

STORAGE-MAP.md

---

# Success Criteria

Media automation is functioning when:

- Overseerr Requests Process Successfully
- Prowlarr Searches Functional
- Downloads Complete Successfully
- VPN Protection Active
- Imports Complete Automatically
- Subtitle Downloads Functional
- Plex Updated Automatically
- Navidrome Updated Automatically
- Audiobookshelf Updated Automatically
- Monitoring Operational

---

# Operational Goals

The media platform should operate with:

- Minimal Manual Intervention
- Automated Acquisition
- Automated Organization
- Automated Subtitle Management
- Automated Library Updates
- Secure Download Processing
- Centralized Monitoring

The media automation platform is considered successful when content can move from request to consumption without administrator involvement.