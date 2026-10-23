# Sprint 06 Validation Checklist

## Purpose

Validate the successful deployment, integration, security, monitoring, and operational readiness of all Sprint 06 services.

Sprint 06 establishes:

- Home Automation
- Credential Management
- Media Automation
- VPN Protected Downloads
- Media Request Management
- Music Streaming
- Utility Services

---

# Core Service Validation

## Home Assistant

Verify:

- [ ] Service Running
- [ ] Web Interface Accessible
- [ ] Storage Accessible
- [ ] DNS Resolution Functional
- [ ] Tailscale Access Functional
- [ ] Configuration Saved Successfully

Result:

PASS / FAIL

---

## Vaultwarden

Verify:

- [ ] Service Running
- [ ] Web Interface Accessible
- [ ] Account Creation Functional
- [ ] Vault Storage Functional
- [ ] Backup Configuration Functional
- [ ] MFA Configuration Functional

Result:

PASS / FAIL

---

# VPN Platform Validation

## Gluetun

Verify:

- [ ] Container Running
- [ ] VPN Connected
- [ ] Tunnel Stable
- [ ] DNS Resolution Functional
- [ ] Container Health Reporting Functional

Result:

PASS / FAIL

---

## NordVPN

Verify:

- [ ] Credentials Valid
- [ ] WireGuard Functional
- [ ] Public IP Changed
- [ ] VPN Endpoint Reachable
- [ ] No DNS Leaks Detected

Result:

PASS / FAIL

---

## Kill Switch Validation

Verify:

- [ ] VPN Connected
- [ ] Download Traffic Functional

Disconnect VPN

Verify:

- [ ] Download Traffic Blocked
- [ ] Internet Access Prevented
- [ ] No Traffic Leakage

Reconnect VPN

Verify:

- [ ] Connectivity Restored

Result:

PASS / FAIL

---

# Download Platform Validation

## qBittorrent

Verify:

- [ ] Service Running
- [ ] Web Interface Accessible
- [ ] Download Directory Accessible
- [ ] VPN Routing Functional
- [ ] Download Test Successful

Result:

PASS / FAIL

---

## Prowlarr

Verify:

- [ ] Service Running
- [ ] Indexers Configured
- [ ] Indexer Search Successful
- [ ] API Connectivity Functional

Result:

PASS / FAIL

---

# ARR Platform Validation

## Sonarr

Verify:

- [ ] Service Running
- [ ] Prowlarr Connected
- [ ] qBittorrent Connected
- [ ] TV Library Accessible
- [ ] Test Search Successful

Result:

PASS / FAIL

---

## Radarr

Verify:

- [ ] Service Running
- [ ] Prowlarr Connected
- [ ] qBittorrent Connected
- [ ] Movie Library Accessible
- [ ] Test Search Successful

Result:

PASS / FAIL

---

## Lidarr

Verify:

- [ ] Service Running
- [ ] Prowlarr Connected
- [ ] qBittorrent Connected
- [ ] Music Library Accessible

Result:

PASS / FAIL

---

## Readarr

Verify:

- [ ] Service Running
- [ ] Prowlarr Connected
- [ ] qBittorrent Connected
- [ ] Ebook Library Accessible
- [ ] Audiobook Library Accessible

Result:

PASS / FAIL

---

## Bazarr

Verify:

- [ ] Service Running
- [ ] Sonarr Connected
- [ ] Radarr Connected
- [ ] Subtitle Providers Accessible
- [ ] Subtitle Download Successful
- [ ] Subtitle Written To Library

Result:

PASS / FAIL

---

## Overseerr

Verify:

- [ ] Service Running
- [ ] Sonarr Connected
- [ ] Radarr Connected
- [ ] Media Request Successful
- [ ] Approval Workflow Functional

Result:

PASS / FAIL

---

# Media Platform Validation

## Navidrome

Verify:

- [ ] Service Running
- [ ] Music Library Accessible
- [ ] Library Scan Successful
- [ ] Audio Playback Functional

Result:

PASS / FAIL

---

## MeTube

Verify:

- [ ] Service Running
- [ ] Web Interface Accessible
- [ ] Test Download Successful
- [ ] Download Repository Accessible

Result:

PASS / FAIL

---

## Tautulli

Verify:

- [ ] Service Running
- [ ] Plex Connected
- [ ] User Statistics Available
- [ ] Stream Analytics Available
- [ ] Notifications Functional

Result:

PASS / FAIL

---

# Utility Platform Validation

## Stirling-PDF

Verify:

- [ ] Service Running
- [ ] Web Interface Accessible
- [ ] PDF Upload Successful
- [ ] PDF Merge Successful
- [ ] PDF Split Successful
- [ ] OCR Functional

Result:

PASS / FAIL

---

# Workflow Validation

## Television Workflow

Verify:

Overseerr
↓
Sonarr
↓
Prowlarr
↓
qBittorrent
↓
Import
↓
Bazarr

Test:

- [ ] Request Submitted
- [ ] Download Started
- [ ] Download Completed
- [ ] Import Successful
- [ ] Subtitle Download Successful

Result:

PASS / FAIL

---

## Movie Workflow

Verify:

Overseerr
↓
Radarr
↓
Prowlarr
↓
qBittorrent
↓
Import
↓
Bazarr

Test:

- [ ] Request Submitted
- [ ] Download Started
- [ ] Download Completed
- [ ] Import Successful
- [ ] Subtitle Download Successful

Result:

PASS / FAIL

---

## Music Workflow

Verify:

Lidarr
↓
Prowlarr
↓
qBittorrent
↓
Import
↓
Navidrome

Test:

- [ ] Search Successful
- [ ] Download Successful
- [ ] Import Successful
- [ ] Playback Successful

Result:

PASS / FAIL

---

# Storage Validation

Verify:

- [ ] /storage/appdata Accessible
- [ ] /storage/downloads Accessible
- [ ] /storage/media/movies Accessible
- [ ] /storage/media/tv Accessible
- [ ] /storage/media/music Accessible
- [ ] /storage/media/audiobooks Accessible
- [ ] /storage/media/ebooks Accessible

Result:

PASS / FAIL

---

# Monitoring Validation

Verify:

- [ ] Services Added To Homepage
- [ ] Services Added To Uptime Kuma
- [ ] Health Checks Functional
- [ ] Test Alerts Delivered

Result:

PASS / FAIL

---

# Remote Access Validation

Verify Through Tailscale:

- [ ] Home Assistant Reachable
- [ ] Vaultwarden Reachable
- [ ] ARR Applications Reachable
- [ ] Navidrome Reachable
- [ ] Utility Services Reachable

Result:

PASS / FAIL

---

# Backup Validation

Verify:

- [ ] Home Assistant Backup Configured
- [ ] Vaultwarden Backup Configured
- [ ] ARR Configuration Backup Configured
- [ ] Navidrome Backup Configured
- [ ] Utility Service Backups Configured

Result:

PASS / FAIL

---

# Evidence Collection

Capture:

- [ ] Home Assistant Dashboard
- [ ] Vaultwarden Dashboard
- [ ] qBittorrent Dashboard
- [ ] Prowlarr Dashboard
- [ ] Sonarr Dashboard
- [ ] Radarr Dashboard
- [ ] Lidarr Dashboard
- [ ] Readarr Dashboard
- [ ] Bazarr Dashboard
- [ ] Overseerr Dashboard
- [ ] Navidrome Dashboard
- [ ] MeTube Dashboard
- [ ] Tautulli Dashboard
- [ ] Stirling-PDF Dashboard
- [ ] VPN Validation Results
- [ ] Download Workflow Results
- [ ] Monitoring Validation Results

Store In:

evidence/sprint-06/

---

# Sprint Exit Validation

- [ ] Home Assistant Operational
- [ ] Vaultwarden Operational
- [ ] VPN Protection Operational
- [ ] ARR Stack Operational
- [ ] Navidrome Operational
- [ ] MeTube Operational
- [ ] Tautulli Operational
- [ ] Stirling-PDF Operational
- [ ] Media Automation Functional
- [ ] Monitoring Operational
- [ ] Backups Configured
- [ ] Documentation Complete
- [ ] Evidence Collected

Sprint Status:

PASS / FAIL

Reviewer:

____________________

Date:

____________________