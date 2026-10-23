# Sprint 04 - Storage Platform

## Purpose

Sprint 04 establishes the centralized storage platform for the WoogleNet environment.

This sprint transforms PAX from a Proxmox host into the primary storage platform used by infrastructure, backup, media, and application services.

The objective is to deploy:

- OpenMediaVault
- Shared Storage
- SMB Services
- NFS Services
- Backup Repository
- Storage Monitoring
- Storage Security Controls

Upon completion, WoogleNet gains centralized storage services that support all future application deployments.

---

# Sprint Objectives

## Primary Goals

- Deploy pax-omv
- Configure Storage Pools
- Configure Shared Storage
- Configure SMB Shares
- Configure Backup Repository
- Configure Monitoring
- Validate Storage Access

---

## Secondary Goals

- Establish Storage Standards
- Validate Backup Workflows
- Prepare Media Storage
- Prepare Application Storage
- Implement Capacity Management

---

# Sprint Deliverables

Upon completion, the following should exist:

```text
pax-omv Operational

Storage Pools Configured

SMB Shares Operational

Backup Repository Operational

Monitoring Operational

Capacity Monitoring Operational
```

---

# Directory Structure

```text
deployment/
└── sprint-04/
    │
    ├── README.md
    ├── pax-omv.md
    ├── storage-layout.md
    ├── smb-shares.md
    ├── backup-repository.md
    ├── validation-checklist.md
    ├── rollback-procedure.md
    │
    ├── exports/
    │   ├── pax-omv/
    │   ├── smb/
    │   └── storage/
    │
    └── evidence/
        ├── pax-omv/
        ├── storage/
        ├── shares/
        └── backups/
```

---

# References

## Required Documentation

- STORAGE-ARCHITECTURE.md
- BACKUP-AND-RESTORE.md
- NETWORK-TOPOLOGY.md
- SECURITY-BASELINE.md
- SERVICE-DEPENDENCIES.md

---

## Standards

Required:

- vm-standard.md
- naming-standard.md
- backup-standard.md
- monitoring-standard.md
- service-hardening-standard.md
- network-security-standard.md

---

# Deployment Targets

## Primary Service

### pax-omv

| Property | Value |
|-----------|-----------|
| Service Name | pax-omv |
| Host | PAX |
| Type | Virtual Machine |
| VM ID | 600 |
| Role | Storage Platform |
| VLAN | Infrastructure |
| IP Address | 10.0.10.70 |

---

## Responsibilities

pax-omv will provide:

```text
SMB Storage

NFS Storage

Backup Storage

Media Storage

Application Storage

Archive Storage
```

---

# Planned Storage Architecture

## Infrastructure Storage

Purpose:

```text
VM Backups

LXC Backups

Configuration Backups
```

---

## Application Storage

Purpose:

```text
Immich

Paperless

Nextcloud

Vaultwarden

BookStack
```

---

## Media Storage

Purpose:

```text
Plex

Audiobookshelf

Navidrome

Media Downloads
```

---

## Archive Storage

Purpose:

```text
Long-Term Retention

Manual Archives

Historical Backups
```

---

# Planned Share Structure

```text
storage/
├── backups/
├── media/
├── documents/
├── photos/
├── applications/
├── downloads/
└── archives/
```

---

# Deployment Order

Follow this sequence exactly.

## Step 1

Deploy:

```text
pax-omv
```

Reference:

```text
pax-omv.md
```

---

## Step 2

Configure Storage Pools

Validate:

- Capacity
- Redundancy
- Performance

---

## Step 3

Configure Network Shares

Deploy:

```text
SMB

NFS
```

---

## Step 4

Configure Backup Repository

Reference:

```text
backup-repository.md
```

---

## Step 5

Configure Monitoring

Reference:

```text
monitoring-standard.md
```

---

## Step 6

Execute Validation

Reference:

```text
validation-checklist.md
```

---

# Storage Standards

## Capacity Management

Warning Threshold:

```text
80%
```

---

Critical Threshold:

```text
90%
```

---

## Recovery

All critical storage must be recoverable from:

```text
Local Backup

Offsite Backup
```

---

# Security Requirements

Storage must comply with:

```text
network-security-standard.md

service-hardening-standard.md
```

---

## Administrative Access

Allowed:

```text
Infrastructure VLAN

Trusted VLAN

Tailscale
```

---

## Denied

```text
Guest VLAN

IoT VLAN
```

unless specifically required.

---

# Monitoring Requirements

The following must be monitored:

## Storage Platform

```text
pax-omv
```

Checks:

- Ping
- HTTPS
- SMB Availability
- NFS Availability

---

## Capacity

Monitor:

```text
Volume Usage

Free Capacity

Growth Trends
```

---

## Backup Repository

Monitor:

```text
Repository Reachability

Backup Completion

Repository Capacity
```

---

# Backup Requirements

Storage services are classified as:

```text
Tier 1 Critical
```

Reference:

```text
backup-standard.md
```

---

## Required Protection

- Configuration Backup
- Share Configuration Backup
- Backup Repository Protection
- Restore Validation

---

# Success Criteria

Sprint 04 is complete when:

- pax-omv Operational
- Storage Pools Configured
- SMB Operational
- NFS Operational
- Backup Repository Operational
- Monitoring Operational
- Capacity Monitoring Active
- Documentation Updated

---

# Exit Criteria

Sprint 04 may only be closed when:

- [ ] pax-omv Deployed
- [ ] Storage Layout Implemented
- [ ] SMB Shares Operational
- [ ] Backup Repository Operational
- [ ] Monitoring Configured
- [ ] Validation Completed
- [ ] Evidence Collected
- [ ] Exports Stored

---

# Expected Outcome

At completion of Sprint 04:

```text
Centralized Storage Exists

Backup Infrastructure Exists

Application Storage Exists

Media Storage Exists

Future Service Storage Exists
```

The platform is now capable of supporting:

```text
Immich

Paperless

Nextcloud

Vaultwarden

Plex

Audiobookshelf

Navidrome
```

---

# Next Sprint

```text
Sprint 05 - Media Platform
```

Primary Objectives:

```text
Deploy jax-plex

Deploy jax-audiobookshelf

Deploy jax-immich

Integrate Storage

Validate Media Workflows
```

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 04 Storage Platform Deployment Guide |