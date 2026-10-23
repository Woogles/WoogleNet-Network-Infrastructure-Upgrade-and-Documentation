# jax-tautulli

## Purpose

Deploy Tautulli on JAX to provide analytics, monitoring, reporting, and operational visibility for the Plex media platform.

Tautulli provides:

- Plex Activity Monitoring
- User Analytics
- Playback Statistics
- Library Statistics
- Stream Monitoring
- Utilization Reporting
- Historical Usage Tracking
- Notification Automation

Reference Documents:

- jax-plex.md
- SERVICE-DEPENDENCIES.md
- MONITORING-AND-ALERTING.md
- docker-standard.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-tautulli

Role:

Plex Analytics Platform

---

# Architecture Role

Tautulli operates as a monitoring and analytics platform for Plex.

Workflow:

Users
↓
Plex
↓
Tautulli
↓
Usage Analytics
↓
Monitoring & Reports

Tautulli does not provide media services directly.

Tautulli consumes Plex activity data and generates operational reporting.

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

/storage/appdata/tautulli

Container Mounts:

/storage/appdata/tautulli
→
/config

Backup Classification:

Important

Backup Required:

Yes

Reference:

STORAGE-MAP.md

---

# Service Dependencies

Required Services:

- Plex
- DNS
- Storage
- Network

Optional Services:

- Uptime Kuma
- Email Notifications

Reference:

SERVICE-DEPENDENCIES.md

---

# Plex Integration

Purpose:

Monitor Plex usage and health.

Functions:

- Active Stream Monitoring
- Library Statistics
- Watch History
- User Activity Tracking
- Playback Reporting
- Bandwidth Monitoring

---

# User Monitoring

Track:

- Active Users
- Viewing History
- Media Consumption
- Playback Duration
- Stream Quality

Approved Users:

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

Reference:

SECURITY-BASELINE.md

---

# Library Monitoring

Monitor:

Movies

TV Shows

Music

Audiobooks

Metrics:

- Item Counts
- Recently Added Items
- Most Viewed Content
- Bandwidth Utilization
- Playback Statistics

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

Required Permissions:

- Read Application Data
- Write Application Data
- Access Plex Statistics
- Store Historical Analytics

Required Access:

/storage/appdata/tautulli

Validation:

- Create Database Entries
- Update Analytics Records
- Generate Reports

---

# Security Requirements

Container Execution:

Non-root where supported.

Credential Storage:

Vaultwarden

Do Not Store:

- Plex Credentials In Git
- Plex Credentials In Documentation
- Plex API Tokens In Compose Files

Reference:

docker-standard.md

secrets-management-standard.md

---

# Notification Functions

Supported Notifications:

- New Media Added
- Server Offline
- User Activity
- Playback Events
- Newsletter Generation

Notification Methods:

- Email
- Mobile Notifications
- Future Integrations

---

# Monitoring Requirements

Monitor:

- Container Health
- Web Interface Availability
- Plex Connectivity
- Database Health
- Notification Delivery

Alert Level:

Important

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Configuration
- Database
- Notification Settings
- Historical Analytics

Do Not Backup:

- Cache Files
- Temporary Logs
- Container Images

Frequency:

Weekly

---

# Validation

Verify:

- Container Running
- Web Interface Accessible
- Plex Connected
- User Activity Visible
- Library Statistics Available
- Playback Statistics Available
- Historical Data Recording
- Notifications Functional

Validation Workflow:

1. Start Container
2. Connect Plex Server
3. Trigger Test Stream
4. Verify Stream Appears
5. Verify User Statistics
6. Verify Library Statistics
7. Send Test Notification
8. Verify Historical Data Collection

---

# Failure Scenarios

## Plex Connection Failure

Symptoms:

- No Analytics Data
- No Active Stream Information

Actions:

- Verify Plex Availability
- Verify API Token
- Verify Network Connectivity

---

## Database Failure

Symptoms:

- Missing Historical Data
- Reporting Errors

Actions:

- Verify Storage
- Restore Database Backup
- Validate Permissions

---

## Notification Failure

Symptoms:

- Alerts Not Received

Actions:

- Verify Notification Settings
- Verify SMTP Configuration
- Verify Network Connectivity

---

## Storage Failure

Symptoms:

- Analytics Not Persisted
- Database Errors

Actions:

- Verify Storage Mount
- Verify Capacity
- Verify Permissions

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Restore Database
4. Verify Storage Mounts
5. Verify Plex Connectivity
6. Verify Historical Analytics
7. Generate Test Report
8. Validate Notifications
9. Return Service To Production

---

# Success Criteria

Deployment is complete when:

- Tautulli Operational
- Plex Connected
- User Analytics Functional
- Library Analytics Functional
- Historical Data Recording
- Notifications Configured
- Monitoring Enabled
- Backup Protection Enabled
- Documentation Updated
