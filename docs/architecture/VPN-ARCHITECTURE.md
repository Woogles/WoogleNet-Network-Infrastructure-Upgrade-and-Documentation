# VPN-ARCHITECTURE

## Purpose

This document serves as the authoritative remote access architecture reference for the WoogleNet environment.

The purpose of this document is to:

- Define secure remote access architecture
- Define administrative access methods
- Define VPN security controls
- Document remote access standards
- Support operational management
- Support disaster recovery operations
- Support security audits
- Support operational readiness reviews
- Support certification activities

Remote access is a critical security function and provides secure administrative and user access to WoogleNet services.

Reference Documents:

- ARCHITECTURE.md
- NETWORK-ARCHITECTURE.md
- SECURITY-BASELINE.md
- MFA-STANDARD.md
- SSH-STANDARD.md
- CREDENTIAL-MANAGEMENT-STANDARD.md
- SECURITY-AUDIT-PROGRAM.md

---

# Design Principles

The WoogleNet VPN architecture follows the following principles:

1. Tailscale First
2. Zero Trust Access
3. MFA Required
4. No Public Administrative Access
5. Simplicity Over Complexity
6. Secure By Default
7. Recovery Before Convenience

---

# Remote Access Strategy

## Primary Remote Access Method

The WoogleNet environment utilizes:

```text
Tailscale
```

as the primary remote access platform.

Purpose:

- Administrative Access
- Service Access
- Remote Management
- Troubleshooting
- Emergency Recovery Operations

---

## Access Philosophy

The preferred administrative access paths are:

```text
Local Network
       ↓
Tailscale
       ↓
Physical Console
```

Administrative access should occur through trusted and authenticated paths only.

---

# VPN Platform

## Primary Platform

| Property | Value |
|----------|----------|
| Platform | Tailscale |
| Type | Mesh VPN |
| Status | Operational |
| Authentication | SSO + MFA |
| Encryption | End-to-End |
| Administrative Approval | Required |

---

## Tailscale Functions

Tailscale provides:

- Remote Administrative Access
- Secure Service Access
- Device Connectivity
- Recovery Access
- Encrypted Communications

---

# Protected Infrastructure

## Infrastructure Hosts

The following hosts participate in the Tailnet.

| Host | Role |
|----------|----------|
| DAX | Infrastructure Services |
| MAX | Infrastructure Services |
| PAX | Storage Services |
| JAX | Application Services |

---

## Infrastructure Services

Accessible through Tailscale:

- AdGuard
- Homepage
- Uptime Kuma
- Vaultwarden
- Home Assistant
- OpenMediaVault

---

## Application Services

Accessible through Tailscale:

- Immich
- Audiobookshelf
- Navidrome
- Paperless-ngx
- Nextcloud
- Syncthing
- BookStack
- ARR Platform Services

---

# Administrative Access Architecture

## Approved Administrative Access

Administrative access is permitted from:

```text
Trusted VLAN
Tailscale
Physical Console
```

---

## Administrative Access Requirements

Administrative access requires:

- Valid Account
- MFA Enrollment
- Authorized Device
- Appropriate Permissions

Reference:

MFA-STANDARD.md

---

## Prohibited Administrative Access

The following methods are prohibited:

```text
Direct Internet SSH

Direct Internet RDP

Port-Forwarded Administrative Interfaces

Unauthenticated Administrative Access
```

Reference:

SSH-STANDARD.md

---

# Internet Exposure Model

## Approved Public Exposure

Approved internet-facing services:

```text
Plex
```

Internet-facing service approval must be documented and reviewed.

---

## Protected Services

The following services must not be publicly exposed:

- Vaultwarden
- Home Assistant
- OpenMediaVault
- Proxmox
- Homepage
- Uptime Kuma
- Paperless-ngx
- Nextcloud
- BookStack

These services are accessed through:

```text
Tailscale
```

Reference:

SECURITY-BASELINE.md

---

# Identity & Authentication

## Authentication Provider

Authentication is managed through:

```text
Tailscale Identity Platform
```

using approved accounts.

---

## MFA Requirements

Administrative MFA is required for:

- Tailscale
- Vaultwarden
- Infrastructure Administration
- Home Assistant Administration
- Nextcloud Administration

Reference:

MFA-STANDARD.md

---

## Credential Requirements

Administrative credentials must be:

- Unique
- Strong
- Stored In Vaultwarden

Reference:

CREDENTIAL-MANAGEMENT-STANDARD.md

---

# Device Enrollment

## Approved Devices

Examples:

- Administrative Workstations
- Personal Laptops
- Authorized Mobile Devices
- Infrastructure Systems

---

## Enrollment Requirements

Prior to joining the Tailnet:

- Device Ownership Verified
- Security Review Completed
- MFA Verified
- Administrative Approval Granted

---

## Device Removal

Devices must be removed when:

- Decommissioned
- Lost
- Stolen
- Ownership Changes
- Security Incident Occurs

Reference:

SECURITY-AUDIT-PROGRAM.md

---

# Remote Administration Workflow

## Standard Administrative Access

```text
Administrator
      ↓
Internet
      ↓
Tailscale
      ↓
Infrastructure VLAN
      ↓
Target System
```

---

## Service Administration

```text
Administrator
      ↓
Tailscale
      ↓
Service Interface
```

Examples:

- Vaultwarden
- Home Assistant
- OpenMediaVault
- Proxmox

---

# SSH Architecture

## Administrative SSH

SSH is permitted only through:

```text
Trusted VLAN

or

Tailscale
```

---

## SSH Controls

Requirements:

- Root Login Disabled
- Strong Authentication
- Administrative Approval
- Audit Review

Reference:

SSH-STANDARD.md

---

## Internet SSH

Status:

```text
Prohibited
```

Reference:

SSH-STANDARD.md

---

# Security Monitoring

## Monitoring Requirements

The following components shall be monitored:

- Tailscale Connectivity
- Administrative Hosts
- Infrastructure Hosts
- Critical Services

Monitoring Platform:

```text
Uptime Kuma
```

---

## Security Reviews

Review:

- Active Devices
- Administrative Accounts
- MFA Status
- Tailnet Membership
- Access Patterns

Reference:

SECURITY-AUDIT-PROGRAM.md

---

# Recovery Architecture

## Recovery Classification

Remote access services are classified as:

```text
Tier 1 Infrastructure
```

---

## Recovery Dependency Chain

```text
Network
     ↓
DNS
     ↓
Tailscale
     ↓
Infrastructure
     ↓
Application Services
```

Reference:

DISASTER-RECOVERY.md

---

## Failure Scenarios

### Internet Failure

Impact:

```text
Remote Access Unavailable
```

Local administration remains available.

---

### Tailscale Failure

Impact:

```text
Remote Administrative Access Unavailable
```

Local administration remains available.

---

### Device Failure

Impact:

```text
Single Device Access Lost
```

Tailnet operations continue.

---

# Operational Readiness Requirements

VPN validation occurs during:

- Service Readiness Reviews
- Security Audits
- Operations Readiness Assessments
- Disaster Recovery Exercises
- Production Readiness Reviews

Reference Documents:

- service-readiness-matrix.md
- operations-readiness-assessment.md
- production-readiness-review.md
- SECURITY-AUDIT-PROGRAM.md

---

# Certification Requirements

VPN certification requires:

- Tailnet Operational
- MFA Operational
- Remote Access Functional
- SSH Controls Validated
- Administrative Accounts Reviewed
- Security Reviews Current
- Recovery Procedures Current

Reference:

ENVIRONMENT-CERTIFICATION.md

---

# Security Exceptions

Any exception to the following requirements must be formally approved:

- MFA Enforcement
- Tailscale Usage
- Administrative Access Control
- Internet Access Restrictions
- SSH Restrictions

Exceptions must be documented and reviewed during certification activities.

---

# Success Criteria

The VPN architecture is considered operational when:

- Tailscale Is Operational
- Administrative MFA Is Enforced
- Remote Access Is Functional
- Internet Administrative Access Is Eliminated
- Device Enrollment Is Controlled
- Security Reviews Are Current
- Recovery Procedures Are Validated
- Documentation Reflects Reality

Remote access is a foundational security component and must remain operational to support secure administration of the WoogleNet environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial VPN architecture aligned with Sprint 01-10 implementation, security governance framework, operational readiness framework, and certification model |