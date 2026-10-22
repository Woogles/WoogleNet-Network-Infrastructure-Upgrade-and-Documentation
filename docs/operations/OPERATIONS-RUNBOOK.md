# Operations Runbook

## Purpose

This document defines the operational procedures used to manage, maintain, update, and recover the WoogleNet environment.

The goals of this runbook are:

- Standardize administration
- Reduce downtime
- Maintain documentation accuracy
- Simplify maintenance
- Support recovery operations
- Ensure repeatable procedures

This document should be reviewed annually and updated whenever operational processes change.

---

# Operations Principles

## Core Rules

1. Documentation must reflect reality.
2. Backups must exist before major changes.
3. Critical changes should be tested when possible.
4. Infrastructure credentials belong in Vaultwarden.
5. Services should be monitored.
6. Recovery procedures must remain documented.
7. Simplicity is preferred over complexity.

---

# Administrative Standards

## Primary Administration Method

```text
Tailscale
```

Preferred order:

```text
Local Access
    ↓
Tailscale
    ↓
Physical Console
```

---

## Credential Management

All infrastructure credentials should be stored in:

```text
Vaultwarden
```

Examples:

- UDM-Pro
- TP-Link Switches
- Proxmox
- OpenMediaVault
- Home Assistant
- Tailscale
- Service Administrative Accounts

---

# Change Management

## Documentation Requirement

Documentation updates are required when:

- New service is deployed
- Service is removed
- Network configuration changes
- Storage layout changes
- New VLAN is created
- Major upgrade performed
- Critical hardware is replaced

---

## Required Documents to Update

Review as applicable:

```text
README.md
HARDWARE-INVENTORY.md
SERVICE-INVENTORY.md
IP-ADDRESS-PLAN.md
VLAN-PLAN.md
NETWORK-TOPOLOGY.md
FIREWALL-RULES.md
STORAGE-ARCHITECTURE.md
STORAGE-MAP.md
```

---

# Service Deployment Standard

## Preferred Platform Order

### First Choice

```text
LXC
```

---

### Second Choice

```text
Docker
```

---

### Third Choice

```text
Virtual Machine
```

---

## Selection Guidelines

### Use LXC When

- Application supports LXC
- Minimal complexity
- Lightweight service
- Infrastructure focused

Examples:

- AdGuard
- Homepage
- Uptime Kuma

---

### Use Docker When

- Official containers exist
- Multiple application dependencies exist
- Application ecosystem expects Docker

Examples:

- Immich
- Plex
- Vaultwarden
- BookStack
- ARR Stack

---

### Use VM When

- Full OS isolation is preferred
- Application officially recommends VM deployment
- Appliance style application

Examples:

- Home Assistant
- OpenMediaVault

---

# New Service Deployment Procedure

## Step 1

Review service requirements.

Document:

- Purpose
- Storage requirements
- Backup requirements
- User access requirements
- Network access requirements

---

## Step 2

Determine hosting platform.

Choose:

```text
LXC
Docker
VM
```

---

## Step 3

Update Documentation

Required:

```text
SERVICE-INVENTORY.md
STORAGE-MAP.md
```

---

## Step 4

Implement Service

---

## Step 5

Verify

Confirm:

- Service starts
- Storage mounts correctly
- Backup strategy exists
- Monitoring exists

---

# New User Onboarding

## Supported Services

### Plex

Users:

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

### Audiobookshelf

Users:

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

### Immich

Users:

- Eric
- Beth
- Amara

---

### Vaultwarden

Users:

- Eric
- Beth
- Amara

---

## User Provisioning Steps

1. Create user account.
2. Verify user access.
3. Confirm login.
4. Record account creation if required.

---

# Monthly Maintenance

## Infrastructure Review

Verify:

- UDM-Pro healthy
- Switches healthy
- Access Points healthy
- UPS healthy

---

## Service Review

Verify:

- Services running
- Logs reviewed
- Storage healthy
- Backups healthy

---

## Capacity Review

Verify:

- Storage usage
- Memory usage
- CPU usage
- UPS status

---

# Update Policy

## Operating Systems

Policy:

```text
Automatic Updates
```

unless application-specific guidance requires otherwise.

---

## Docker Containers

Policy:

```text
As Needed
```

Update when:

- Security issue exists
- New feature required
- Bug impacts operation

---

## Proxmox

Policy:

```text
As Needed
```

Update only after:

- Reading release notes
- Confirming backups
- Verifying rollback options

---

# Maintenance Window

## Preferred Window

```text
Late Night
```

Maintenance activities should be performed when household impact is lowest.

---

# Backup Operations

## Before Major Changes

Required:

```text
Backup First
Change Second
```

---

## Verify

Before proceeding:

- Backup completed
- Backup repository healthy
- Restore path known

---

# Restore Operations

When restoring:

1. Infrastructure first.
2. Storage second.
3. Critical services third.
4. Remaining services last.

Reference:

```text
DISASTER-RECOVERY.md
BACKUP-AND-RESTORE.md
```

---

# Monitoring Operations

## Monitoring Platform

- Homepage
- Uptime Kuma

---

## Alert Destinations

```text
Email
+
Mobile Notifications
```

---

## Alert Review

Review:

- Failed services
- Certificate warnings
- DNS warnings
- Storage warnings
- Backup failures

---

# Configuration Backup Operations

Configuration exports should be created immediately after major configuration changes.

## Components

### UDM-Pro

Backup:

```text
After Initial Configuration
After Major Changes
```

---

### TP-Link Switches

Backup:

```text
After Initial Configuration
After Major Changes
```

---

### Proxmox

Backup:

```text
After Initial Build
After Significant VM Changes
```

---

### Home Assistant

Backup:

```text
After Major Configuration Changes
```

---

# Hardware Replacement Procedure

## Step 1

Identify failed hardware.

---

## Step 2

Determine impact.

---

## Step 3

Consult:

```text
HARDWARE-INVENTORY.md
DISASTER-RECOVERY.md
```

---

## Step 4

Replace hardware.

---

## Step 5

Restore configuration.

---

## Step 6

Validate operation.

---

# UPS Operations

## Platform

```text
NUT
```

---

## Shutdown Timer

```text
5 Minutes
```

On battery before shutdown process starts.

---

## Quarterly Tasks

Verify:

- Battery status
- Load status
- Runtime estimates

---

# Annual Review

## Documentation

Review:

- Hardware Inventory
- Service Inventory
- Network Documentation
- Backup Documentation
- DR Documentation

---

## Infrastructure

Review:

- Storage Growth
- UPS Capacity
- VLAN Design
- Service Placement
- Monitoring Coverage

---

## Security

Review:

- Passwords
- MFA Usage
- Tailscale Access
- Account List

---

# Operational Checklists

## New Service Checklist

- [ ] Purpose documented
- [ ] Host selected
- [ ] Storage assigned
- [ ] Backup strategy assigned
- [ ] Monitoring configured
- [ ] Documentation updated

---

## Change Checklist

- [ ] Backup completed
- [ ] Documentation reviewed
- [ ] Change implemented
- [ ] Service validated
- [ ] Documentation updated

---

## Recovery Checklist

- [ ] Failure identified
- [ ] Backups verified
- [ ] Recovery executed
- [ ] Service tested
- [ ] Documentation updated

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Infrastructure Automation | Future Review |
| AI-Assisted Operations | Future Review |
| Automated Documentation Validation | Future Review |
| Automated Backup Verification | Future Review |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Operations Runbook |
