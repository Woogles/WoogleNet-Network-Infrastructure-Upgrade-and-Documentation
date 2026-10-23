# LXC Standard

## Purpose

This document defines the standard configuration for all Linux Containers (LXC) deployed within the WoogleNet environment.

The goals of this standard are to:

- Standardize deployments
- Reduce configuration drift
- Improve security
- Simplify maintenance
- Simplify troubleshooting
- Improve recoverability

All LXC deployments must comply with this standard unless an approved exception exists in:

```text
SERVICE-DECISIONS.md
```

---

# Scope

This standard applies to:

```text
AdGuard Primary
AdGuard Secondary
Homepage
Uptime Kuma
Vaultwarden
Paperless-ngx
BookStack
Navidrome
MeTube
Stirling-PDF
```

It may also apply to future services deployed as LXC containers.

---

# LXC Policy

## Preferred Deployment Type

Default:

```text
Unprivileged Container
```

---

## Privileged Containers

Not permitted unless:

- Technical constraint exists
- Exception documented

Reference:

```text
SERVICE-DECISIONS.md
```

---

# Base Operating System

## Standard Template

Preferred:

```text
Debian 12
```

---

## Alternative Templates

Allowed when required:

```text
Ubuntu LTS
```

---

## Unsupported

Avoid:

```text
End of Life Distributions
```

---

# Naming Standard

## Container Name

Format:

```text
service-name
```

Examples:

```text
adguard-primary

adguard-secondary

homepage

uptime-kuma

vaultwarden

paperless
```

---

## Hostname

Hostname must match:

```text
Container Name
```

---

# Container ID Standard

## Infrastructure Services

Reserved:

```text
100 - 199
```

---

## Storage Services

Reserved:

```text
200 - 299
```

---

## Application Services

Reserved:

```text
300 - 399
```

---

## Utility Services

Reserved:

```text
400 - 499
```

---

# Resource Allocation Standard

## Small Service

Recommended:

| Resource | Value |
|----------|----------|
| CPU | 1-2 vCPU |
| RAM | 1-2 GB |
| Storage | 8-16 GB |

Examples:

```text
Homepage

MeTube

Stirling-PDF
```

---

## Medium Service

Recommended:

| Resource | Value |
|----------|----------|
| CPU | 2 vCPU |
| RAM | 2-4 GB |
| Storage | 16-32 GB |

Examples:

```text
AdGuard

Uptime Kuma

Vaultwarden
```

---

## Large Service

Recommended:

| Resource | Value |
|----------|----------|
| CPU | 4+ vCPU |
| RAM | 4+ GB |
| Storage | Service Specific |

Examples:

```text
Paperless-ngx
```

---

# Networking Standard

## VLAN

Default:

```text
VLAN 10
Infrastructure
```

---

## Addressing

Required:

```text
Static IP
```

---

## DHCP

```text
Not Allowed
```

for infrastructure containers.

---

## Gateway

```text
10.0.10.1
```

---

# DNS Standard

Primary DNS:

```text
10.0.10.50
```

---

Secondary DNS:

```text
10.0.10.51
```

---

## Name Resolution

Required:

```text
Functional
```

before deployment completion.

---

# Time Synchronization

Required:

```text
NTP Enabled
```

---

## Validation

```bash
timedatectl
```

must show synchronized.

---

# Update Standard

## Initial Deployment

Execute:

```bash
apt update
apt upgrade -y
```

---

## Ongoing Maintenance

Install:

```bash
unattended-upgrades
```

---

## Validation

Verify:

- Security Updates Active
- Automatic Updates Enabled

---

# User Management

## Root Account

Allowed:

```text
Local Console Only
```

---

## SSH Root Login

```text
Disabled
```

---

## Administrative Account

Create:

```text
eric-admin
```

or standard administrative account.

---

## Password Requirements

Minimum:

```text
16 Characters
```

---

## Password Storage

Store In:

```text
Vaultwarden
```

---

# SSH Standard

## Service

```text
Enabled
```

---

## Root Login

```text
Disabled
```

---

## Authentication

Initially:

```text
Password
```

Future Migration:

```text
SSH Keys
```

---

# Firewall Standard

## Default Policy

```text
Deny Unnecessary Access
```

---

## Allowed Sources

### Infrastructure VLAN

```text
10.0.10.0/24
```

---

### Trusted VLAN

```text
10.0.20.0/24
```

When required.

---

### Tailscale

```text
Allowed
```

---

## Blocked Sources

### Guest VLAN

```text
10.0.40.0/24
```

---

### IoT VLAN

```text
10.0.30.0/24
```

unless explicitly required.

---

# Logging Standard

## System Logs

Retain:

```text
90 Days
```

minimum.

---

## Application Logs

Retain:

```text
90 Days
```

minimum.

---

## Security Events

Capture:

- Authentication Failures
- Service Restarts
- Configuration Changes

---

# Monitoring Standard

All containers must be monitored by:

```text
Uptime Kuma
```

---

## Required Checks

- Ping
- HTTP/HTTPS
- Service Availability

---

## Alerts

Required:

- Email
- Mobile Notification

---

# Backup Standard

## Configuration Backups

Required:

```text
Yes
```

---

## Application Backups

Required:

```text
Yes
```

where applicable.

---

## Export Storage

Store In:

```text
deployment/sprint-xx/exports/
```

and

```text
/ storage / backups
```

---

# Evidence Collection Standard

Every deployment must capture:

- Installation Evidence
- Configuration Screenshots
- Network Configuration
- Validation Results

---

## Storage Location

```text
deployment/sprint-xx/evidence/
```

---

# Validation Standard

Every container deployment must verify:

- [ ] Container Running
- [ ] Static IP Configured
- [ ] DNS Functional
- [ ] NTP Functional
- [ ] Updates Installed
- [ ] Monitoring Configured
- [ ] Backups Configured
- [ ] Documentation Complete

---

# Compliance Checklist

This checklist applies to all LXCs.

- [ ] Debian 12
- [ ] Unprivileged
- [ ] Static IP
- [ ] DNS Configured
- [ ] Updates Applied
- [ ] SSH Hardened
- [ ] Monitoring Enabled
- [ ] Backup Enabled
- [ ] Evidence Collected

---

# Exceptions

Any deviation from this standard must be documented in:

```text
SERVICE-DECISIONS.md
```

and referenced by the deployment guide.

---

# Related Standards

- proxmox-standard.md
- vm-standard.md
- service-hardening-standard.md
- network-security-standard.md
- backup-standard.md
- monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial LXC Standard |
