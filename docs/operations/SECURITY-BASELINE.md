# Security Baseline

## Purpose

This document defines the minimum security requirements for the WoogleNet environment.

The goals of this baseline are:

- Protect critical data
- Reduce attack surface
- Protect family accounts
- Secure administrative access
- Standardize security practices
- Simplify long-term maintenance

This document establishes the minimum acceptable security configuration for all systems.

---

# Security Philosophy

## Core Principles

1. Simplicity over complexity.
2. Private access preferred over public exposure.
3. Tailscale first.
4. MFA where it provides meaningful value.
5. Least privilege whenever practical.
6. Security should not prevent usability.
7. Recovery is part of security.

---

# Security Classification

## Critical Systems

The following systems are considered critical:

- UDM-Pro
- Proxmox Hosts
- OpenMediaVault
- Vaultwarden
- Tailscale
- Home Assistant
- Immich
- Nextcloud
- Paperless-ngx

---

## Critical Data

The following data is considered irreplaceable:

- Family Photos
- Family Videos
- Password Vault Data
- Personal Documents
- Home Automation Configuration

---

# Remote Access Standard

## Approved Remote Access Method

```text
Tailscale
```

---

## Administrative Access

Permitted Sources:

- Trusted VLAN
- Tailscale Network
- Physical Console

---

## Prohibited Access

Administrative interfaces should not be exposed directly to the Internet.

Examples:

- Proxmox
- OpenMediaVault
- AdGuard
- Homepage
- Uptime Kuma
- Home Assistant
- Vaultwarden
- Paperless
- Nextcloud

---

# Authentication Policy

## Password Requirements

Minimum Length:

```text
16 Characters
```

---

## Password Standards

Passwords should:

- Be unique
- Be randomly generated
- Be stored in Vaultwarden
- Never be reused

---

## Credential Storage

### Source of Truth

```text
Vaultwarden
```

All administrative credentials should be stored in Vaultwarden.

Examples:

- UDM-Pro
- Proxmox
- OMV
- Switches
- Access Points
- Service Accounts
- API Keys

---

# MFA Policy

## Required MFA

MFA should be enabled for:

- Vaultwarden
- Tailscale
- Home Assistant

---

## Optional MFA

MFA may be enabled for:

- Immich
- Nextcloud

---

## Administrative Accounts

When MFA is available on an administrative platform, it should be enabled.

---

# Network Security

## VLAN Separation

| VLAN | Purpose |
|----------|----------|
| 10 | Infrastructure |
| 20 | Trusted |
| 30 | IoT |
| 40 | Guest |

---

## Trusted VLAN

Allowed:

- Internal Services
- Storage Services
- Administrative Access

---

## IoT VLAN

Allowed:

- Internet Access
- Home Assistant Integration

Denied:

- Infrastructure Access
- Trusted Device Access

---

## Guest VLAN

Allowed:

- Internet Access

Denied:

- All Internal Resources

---

# Firewall Requirements

## Internet Exposure

Approved Internet-Facing Services:

```text
Plex
```

Only.

---

## Tailscale Protected Services

- Vaultwarden
- Home Assistant
- Immich
- Nextcloud
- Paperless
- Homepage
- Uptime Kuma
- BookStack

---

## Administrative Interfaces

Must remain:

```text
Private
```

---

# SSH Security

## Default Policy

```text
Disabled Unless Needed
```

---

## When SSH Is Enabled

Requirements:

- Key Authentication Preferred
- Strong Passwords
- Limited Access
- Logging Enabled

---

## Root SSH

Policy:

```text
Disabled
```

---

# Endpoint Security

## Server Requirements

All servers should:

- Receive security updates
- Use strong passwords
- Use unique credentials
- Participate in monitoring

---

## Administrative Workstations

Administrative systems should:

- Use screen locks
- Use MFA where practical
- Store credentials only in Vaultwarden

---

# Intrusion Protection

## Fail2Ban

Policy:

```text
Enabled Where Supported
```

Examples:

- Vaultwarden
- Nextcloud
- SSH Services
- Other Web Applications

---

# Service Security

## Vaultwarden

Requirements:

- MFA Enabled
- Daily Backups
- Offsite Backups
- Strong Administrative Passwords

---

## Immich

Requirements:

- Daily Backups
- Storage Monitoring
- Account Review

---

## Home Assistant

Requirements:

- MFA Enabled
- Backups Enabled
- Remote Access Through Tailscale

---

## Nextcloud

Requirements:

- Backups Enabled
- Strong Password Policy

---

## Paperless-ngx

Requirements:

- Backups Enabled
- Restricted Access

---

# Monitoring Requirements

## Uptime Kuma

Monitor:

- Service Availability
- DNS Resolution
- Certificate Expiration

---

## Alert Delivery

Methods:

- Email
- Mobile Notifications

---

## High Priority Alerts

Examples:

- Service Offline
- DNS Failure
- Storage Failure
- Backup Failure
- Certificate Expiration

---

# Backup Security

## Backup Software

```text
Kopia
```

---

## Local Repository

```text
OpenMediaVault
```

---

## Offsite Repository

```text
OneDrive
```

---

## Backup Encryption

Requirement:

```text
Enabled
```

---

# Logging Requirements

The following should be logged when supported:

- Authentication Failures
- Administrative Logins
- Firewall Events
- Service Failures
- Backup Failures

---

# Security Review Schedule

## Monthly

Review:

- Failed Login Attempts
- Service Health
- Backup Status
- Expiring Certificates

---

## Quarterly

Review:

- User Accounts
- Administrative Access
- Tailscale Devices
- Recovery Procedures

---

## Annual

Review:

- Security Baseline
- Password Policies
- MFA Coverage
- Firewall Rules
- Documentation

---

# User Access Review

## Plex

Approved Users:

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

## Immich

Approved Users:

- Eric
- Beth
- Amara

---

## Audiobookshelf

Approved Users:

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

## Vaultwarden

Approved Users:

- Eric
- Beth
- Amara

---

# Prohibited Practices

The following are not permitted:

- Shared Administrative Passwords
- Password Reuse
- Internet Exposed Management Interfaces
- Root SSH Access
- Untracked Infrastructure Changes
- Undocumented Critical Services

---

# Security Checklist

## Initial Build

- [ ] Tailscale Installed
- [ ] Firewall Rules Applied
- [ ] VLANs Configured
- [ ] Vaultwarden Deployed
- [ ] MFA Enabled Where Required
- [ ] DNS Redundancy Configured
- [ ] Backups Configured

---

## Quarterly Review

- [ ] Accounts Reviewed
- [ ] Tailscale Devices Reviewed
- [ ] MFA Reviewed
- [ ] Backup Verification Completed
- [ ] Restore Testing Completed

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Authentik Deployment | Optional |
| IDS/IPS Tuning | Future Review |
| GeoIP Filtering | Future Review |
| IPv6 Security Policy | TBD |
| SSO Strategy | Future Review |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Security Baseline |