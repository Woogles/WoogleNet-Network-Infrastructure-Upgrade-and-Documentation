# Service Hardening Standard

## Purpose

This document defines the minimum security and hardening requirements for all services deployed within the WoogleNet environment.

The goals of this standard are to:

- Minimize attack surface
- Standardize security controls
- Improve recoverability
- Reduce operational risk
- Prevent configuration drift
- Support long-term maintenance

All services must comply with this standard unless an approved exception is documented in:

```text
SERVICE-DECISIONS.md
```

---

# Scope

This standard applies to:

## Infrastructure Services

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

---

## Storage Services

- OpenMediaVault

---

## Application Services

- Plex
- Audiobookshelf
- Immich
- Vaultwarden
- BookStack
- Nextcloud
- Paperless-ngx
- Home Assistant

---

## Utility Services

- Navidrome
- Tautulli
- MeTube
- Stirling-PDF
- ARR Stack

---

# Security Principles

All deployments should follow:

```text
Least Privilege

Deny By Default

Defense In Depth

Secure By Default

Document Exceptions
```

---

# Administrative Access

## Approved Access Paths

Administrative access is permitted only from:

### Infrastructure VLAN

```text
10.0.10.0/24
```

---

### Trusted VLAN

```text
10.0.20.0/24
```

when required.

---

### Tailscale

```text
Approved Devices Only
```

---

## Prohibited Access Paths

### Guest VLAN

```text
10.0.40.0/24
```

---

### IoT VLAN

```text
10.0.30.0/24
```

unless specifically required.

---

# Account Management

## Administrative Accounts

Create named accounts whenever possible.

Example:

```text
eric-admin
```

---

## Shared Accounts

```text
Not Allowed
```

except vendor-required accounts.

---

## Default Accounts

Required Action:

```text
Disable

Remove

Rename
```

when supported.

---

## Account Review

Perform:

```text
Quarterly
```

Review:

- Unused Accounts
- Temporary Accounts
- Test Accounts

---

# Password Standard

## Minimum Length

```text
16 Characters
```

---

## Password Generation

Required:

```text
Random Generation
```

---

## Password Reuse

```text
Not Allowed
```

for administrative accounts.

---

## Password Storage

Required:

```text
Vaultwarden
```

---

# Multi-Factor Authentication

## Required Services

Must Enable MFA:

- Vaultwarden
- Tailscale
- Home Assistant

---

## Strongly Recommended

Enable MFA When Supported:

- Nextcloud
- Immich
- BookStack

---

## Recovery Procedures

Document:

- Recovery Codes
- Recovery Contacts
- Recovery Process

---

# Operating System Hardening

## Updates

Immediately After Installation:

```bash
apt update
apt upgrade -y
```

---

## Automatic Updates

Install:

```bash
unattended-upgrades
```

---

## Validation

Verify:

```text
Security Updates Automatically Applied
```

---

## Reboot Policy

Maintenance Window:

```text
Monthly Minimum
```

---

# Service Hardening

## Remove Unused Packages

Review:

```bash
apt list --installed
```

Remove unnecessary software.

---

## Remove Unused Services

Review:

```bash
systemctl list-unit-files
```

Disable unused services.

---

## Disable Sample Content

Remove:

- Example Dashboards
- Demo Users
- Test Content
- Default API Keys

---

# SSH Hardening

## Root Login

```text
Disabled
```

---

## Password Authentication

Initially:

```text
Allowed
```

---

Future Goal:

```text
SSH Key Authentication
```

---

## Administrative Accounts

Use:

```text
Named Administrative Accounts
```

---

## Validation

Verify:

- Root Login Disabled
- SSH Functional
- Admin Login Functional

---

# Firewall Standard

## Default Rule

```text
Deny Unnecessary Traffic
```

---

## Allowed Sources

Only defined operational sources should reach service management interfaces.

---

## Blocked Sources

Always Block:

### Guest VLAN

```text
10.0.40.0/24
```

---

### IoT VLAN

```text
10.0.30.0/24
```

unless documented.

---

## Service Ports

Expose only:

```text
Required Application Ports
```

No unused listeners.

---

# TLS / HTTPS Standard

## Preferred

```text
HTTPS
```

for all web services.

---

## Internal Services

HTTP allowed initially if:

- Access Restricted
- Internal Only

---

## Future Goal

```text
TLS Everywhere
```

using internal certificates.

---

# Logging Standard

## System Logs

Retention:

```text
90 Days Minimum
```

---

## Application Logs

Retention:

```text
90 Days Minimum
```

---

## Security Logs

Capture:

- Login Failures
- Account Changes
- Configuration Changes
- Service Restarts

---

# Monitoring Standard

Every service must be monitored.

Platform:

```text
Uptime Kuma
```

---

## Monitoring Requirements

Minimum:

- Ping
- HTTP/HTTPS
- Service Availability

---

## Alerting

Required:

- Email Alert
- Mobile Alert

---

# Backup Standard

## Configuration Backup

Required:

```text
Yes
```

for all services.

---

## Data Backup

Required:

```text
Yes
```

for all production services.

---

## Backup Location

Primary:

```text
/storage/backups
```

---

## Offsite Copy

Critical Services:

```text
OneDrive
```

---

# Tier Classification

## Tier 1 - Critical

Examples:

- Vaultwarden
- Home Assistant
- Nextcloud
- Paperless
- Immich
- OpenMediaVault

---

### Requirements

- Daily Backups
- Monitoring
- Restore Testing

---

## Tier 2 - Important

Examples:

- Plex
- Audiobookshelf
- BookStack
- ARR Stack

---

### Requirements

- Weekly Backups
- Monitoring

---

## Tier 3 - Utility

Examples:

- Homepage
- Tautulli
- MeTube

---

### Requirements

- Configuration Backups

---

# Configuration Management

## Documentation Required

Every service must have:

- Purpose
- Host Location
- IP Address
- Backup Status
- Monitoring Status
- Dependencies

---

## Change Control

Significant changes must update:

```text
SERVICE-DECISIONS.md
```

when architectural impact exists.

---

# Security Validation Checklist

## Access

- [ ] Administrative Access Restricted
- [ ] Guest Access Blocked
- [ ] IoT Access Restricted

---

## Authentication

- [ ] Strong Passwords
- [ ] MFA Enabled Where Required

---

## Host Security

- [ ] Updates Applied
- [ ] Automatic Updates Enabled
- [ ] Root Access Restricted

---

## Monitoring

- [ ] Uptime Kuma Monitoring Enabled
- [ ] Alerting Configured

---

## Backup

- [ ] Backups Configured
- [ ] Recovery Procedure Documented

---

# Exceptions

Any security exception requires documentation of:

- Business Justification
- Risk
- Mitigations
- Review Date

Location:

```text
SERVICE-DECISIONS.md
```

---

# Related Standards

- proxmox-standard.md
- lxc-standard.md
- vm-standard.md
- network-security-standard.md
- backup-standard.md
- monitoring-standard.md
- logging-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Service Hardening Standard |
