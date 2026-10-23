# SMB Shares

## Purpose

This document defines the SMB share architecture for the WoogleNet environment.

The goals of these shares are to:

- Provide centralized storage access
- Support application data
- Support media services
- Support backup operations
- Support user file access
- Enforce least-privilege access

All SMB shares will be hosted by:

```text
pax-omv
```

Reference:

```text
storage-layout.md
```

---

# SMB Service Information

## Host

```text
pax-omv
```

---

## Protocol

```text
SMB 3.x
```

---

## SMB Version Requirements

Minimum:

```text
SMB3
```

---

## Unsupported

```text
SMB1
```

Must remain disabled.

---

# Share Inventory

| Share | Path | Purpose |
|---------|---------|---------|
| backups | /storage/backups | Backup Storage |
| applications | /storage/applications | Application Data |
| media | /storage/media | Media Libraries |
| documents | /storage/documents | User Documents |
| downloads | /storage/downloads | ARR Stack Downloads |
| archives | /storage/archives | Long-Term Retention |
| staging | /storage/staging | Temporary Workspace |

---

# Share Naming Standard

All shares must use:

```text
lowercase
```

Examples:

```text
media

documents

applications

backups
```

---

# Share Configuration

## backups

### Path

```text
/storage/backups
```

---

### Purpose

Stores:

```text
Proxmox Backups

LXC Backups

Configuration Backups

Database Backups

Kopia Repository
```

---

### Access

Read/Write:

```text
Infrastructure Administrators
```

---

### Guest Access

```text
Disabled
```

---

### Browsable

```text
No
```

---

## applications

### Path

```text
/ storage / applications
```

---

### Purpose

Stores persistent application data.

---

### Consumers

```text
jax-immich

jax-nextcloud

jax-paperless

jax-vaultwarden

jax-bookstack

max-homeassistant
```

---

### Access

Read/Write:

```text
Application Administrators
```

---

### Guest Access

```text
Disabled
```

---

### Browsable

```text
No
```

---

## media

### Path

```text
/storage/media
```

---

### Purpose

Stores media assets.

---

### Consumers

```text
jax-plex

jax-audiobookshelf

jax-navidrome
```

---

### Access

Read/Write:

```text
Media Administrators
```

---

### Guest Access

```text
Disabled
```

---

### Browsable

```text
Yes
```

---

## documents

### Path

```text
/storage/documents
```

---

### Purpose

Stores documents and scanned content.

---

### Consumers

```text
jax-paperless

jax-nextcloud
```

---

### Access

Read/Write:

```text
Authorized Users
```

---

### Guest Access

```text
Disabled
```

---

### Browsable

```text
Yes
```

---

## downloads

### Path

```text
/storage/downloads
```

---

### Purpose

Temporary ARR processing.

---

### Consumers

```text
jax-qbittorrent

jax-sonarr

jax-radarr

jax-lidarr

jax-readarr
```

---

### Access

Restricted

---

### Guest Access

```text
Disabled
```

---

### Browsable

```text
No
```

---

## archives

### Path

```text
/storage/archives
```

---

### Purpose

Long-term retention.

---

### Access

Read/Write:

```text
Infrastructure Administrators
```

---

### Guest Access

```text
Disabled
```

---

### Browsable

```text
Yes
```

---

## staging

### Path

```text
/storage/staging
```

---

### Purpose

Temporary migration and processing area.

---

### Retention

```text
Short Term
```

---

### Access

Restricted

---

### Guest Access

```text
Disabled
```

---

### Browsable

```text
No
```

---

# User Access Model

## Infrastructure Administrators

Permissions:

```text
Full Access
```

To:

```text
backups

applications

archives

staging
```

---

## Media Administrators

Permissions:

```text
Full Access
```

To:

```text
media
```

---

## Authorized Users

Permissions:

```text
Read/Write
```

To:

```text
documents
```

---

# Network Access Policy

Reference:

```text
network-security-standard.md
```

---

## Allowed Networks

### Infrastructure VLAN

```text
10.0.10.0/24
```

---

### Trusted VLAN

```text
10.0.20.0/24
```

---

## Restricted Networks

### Guest VLAN

```text
10.0.40.0/24
```

Access:

```text
Denied
```

---

### IoT VLAN

```text
10.0.30.0/24
```

Access:

```text
Denied
```

---

# SMB Security Settings

## SMB Version

Minimum:

```text
SMB3
```

---

## Guest Login

```text
Disabled
```

---

## Anonymous Access

```text
Disabled
```

---

## Host Discovery

```text
Enabled
```

Internal Networks Only.

---

# Monitoring Requirements

Reference:

```text
monitoring-standard.md
```

---

Monitor:

- SMB Service Availability
- Share Availability
- Storage Capacity
- Authentication Failures

---

# Capacity Monitoring

Warning:

```text
80%
```

---

Critical:

```text
90%
```

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

Backup:

```text
SMB Configuration

User Permissions

Share Definitions
```

---

Store Exports In:

```text
deployment/sprint-04/exports/smb/
```

---

# Validation Checklist

## Services

- [ ] SMB Service Running
- [ ] SMB3 Enabled
- [ ] SMB1 Disabled

---

## Shares

- [ ] backups Available
- [ ] applications Available
- [ ] media Available
- [ ] documents Available
- [ ] downloads Available
- [ ] archives Available
- [ ] staging Available

---

## Access

- [ ] VLAN 10 Access Works
- [ ] VLAN 20 Access Works
- [ ] VLAN 30 Blocked
- [ ] VLAN 40 Blocked

---

## Security

- [ ] Guest Access Disabled
- [ ] Anonymous Access Disabled

---

# Related Documents

- README.md
- storage-layout.md
- backup-repository.md
- pax-omv.md
- ../standards/network-security-standard.md
- ../standards/backup-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial SMB Share Design |