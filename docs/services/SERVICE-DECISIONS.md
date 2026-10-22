# Service Decisions

## Purpose

This document records the architectural and operational decisions made during the design of the WoogleNet environment.

The goals of this document are:

- Preserve decision history
- Prevent future re-evaluation of settled topics
- Explain design rationale
- Support future troubleshooting
- Support future expansion
- Reduce documentation drift

This document answers the question:

```text
Why was this decision made?
```

rather than:

```text
How is it implemented?
```

Implementation details belong in other documents.

---

# Decision Framework

## Evaluation Criteria

Decisions were primarily based on:

1. Simplicity
2. Recoverability
3. Security
4. Maintainability
5. Family Usability
6. Cost
7. Existing Hardware

Enterprise features were generally rejected when they significantly increased complexity.

---

# Platform Decisions

---

## DEC-001

### Decision

```text
Independent Proxmox Hosts
```

### Options Considered

- Proxmox Cluster
- Independent Hosts

### Selected

```text
Independent Hosts
```

### Reason

The environment prioritizes:

- Simplicity
- Easy Recovery
- Reduced Operational Complexity

High Availability was not required.

### Impact

- No Shared Storage Requirement
- No Cluster Management
- Easier Recovery
- Reduced Complexity

---

## DEC-002

### Decision

```text
Recovery Over High Availability
```

### Selected

```text
Recoverability
```

### Reason

Home lab workloads do not justify the complexity of:

- HA Clustering
- Shared Storage
- Live Migration

### Impact

Focus placed on:

- Backups
- Documentation
- Disaster Recovery

---

## DEC-003

### Decision

```text
OpenMediaVault
```

### Options Considered

- OpenMediaVault
- TrueNAS
- Unraid

### Selected

```text
OpenMediaVault
```

### Reason

- Simpler Management
- Lower Resource Usage
- Fits Existing Requirements
- Easy Integration With Existing Design

### Impact

Storage Architecture is built around OMV.

---

# Network Decisions

---

## DEC-004

### Decision

```text
10.0.0.0/16
```

### Selected

```text
10.0.0.0/16
```

### Reason

Provides:

- Simple Organization
- Future Growth
- Easy VLAN Allocation

---

## DEC-005

### Decision

```text
Network Segmentation
```

### Selected

| VLAN | Purpose |
|--------|--------|
| 10 | Infrastructure |
| 20 | Trusted |
| 30 | IoT |
| 40 | Guest |

### Reason

Provides:

- Security
- Isolation
- Simplicity

---

## DEC-006

### Decision

```text
Guest Isolation
```

### Selected

```text
Internet Only
```

### Reason

Guest devices should never access internal resources.

---

## DEC-007

### Decision

```text
IoT Isolation
```

### Selected

```text
IoT Segmentation
```

### Reason

IoT devices are considered lower trust.

### Exception

```text
Home Assistant
```

may access approved IoT devices.

---

# DNS Decisions

---

## DEC-008

### Decision

```text
AdGuard Home HA Pair
```

### Selected

```text
Primary + Secondary Deployment
```

### Hosts

- DAX
- MAX

### Reason

Provides DNS redundancy without significant complexity.

---

## DEC-009

### Decision

```text
DNS Filtering
```

### Selected

```text
AdGuard Home
```

### Reason

Provides:

- Ad Blocking
- Malware Protection
- Centralized DNS

---

## DEC-010

### Decision

```text
Quad9 Upstream DNS
```

### Selected

```text
Quad9
```

### Secondary

```text
Cloudflare
```

### Reason

Privacy-focused DNS service.

---

# Remote Access Decisions

---

## DEC-011

### Decision

```text
Tailscale First
```

### Options Considered

- Reverse Proxy
- VPN
- Tailscale

### Selected

```text
Tailscale
```

### Reason

- Simpler
- More Secure
- Less Maintenance
- Reduces Internet Exposure

---

## DEC-012

### Decision

```text
No Public Access
```

### Selected

```text
Tailscale Access
```

for nearly all services.

### Exception

```text
Plex
```

### Reason

Family remote streaming requirements.

---

## DEC-013

### Decision

```text
Nginx Proxy Manager
```

### Selected

```text
Removed From Scope
```

### Reason

Tailscale replaced the need for a reverse proxy solution.

---

# Service Placement Decisions

---

## DEC-014

### Decision

```text
JAX Hosts Application Services
```

### Selected

```text
JAX
```

### Reason

Centralize:

- Media
- Family Services
- Knowledge Services
- AI Services

on a single application platform.

---

## DEC-015

### Decision

```text
DAX Infrastructure Host
```

### Services

- AdGuard Primary
- Homepage
- Uptime Kuma

### Reason

Infrastructure separation.

---

## DEC-016

### Decision

```text
MAX Infrastructure Host
```

### Services

- AdGuard Secondary
- Home Assistant

### Reason

Distribute critical services.

---

## DEC-017

### Decision

```text
PAX Storage Host
```

### Services

- OpenMediaVault

### Reason

Dedicated storage responsibilities.

---

# AI Decisions

---

## DEC-018

### Decision

```text
AI Managed Separately
```

### Selected

External Repository:

```text
My_Local_AI_Config
```

### Reason

AI architecture evolves independently of WoogleNet.

### Impact

WoogleNet documents infrastructure dependencies only.

---

## DEC-019

### Decision

```text
JAX Hosts AI Workloads
```

### Hardware

- RTX 3060 (12GB)
- GTX 1070 (8GB)

### Reason

Existing GPU availability.

---

# Security Decisions

---

## DEC-020

### Decision

```text
MFA Required
```

### Services

- Vaultwarden
- Tailscale
- Home Assistant

### Reason

Critical systems require enhanced protection.

---

## DEC-021

### Decision

```text
Root SSH Disabled
```

### Reason

Reduces attack surface.

---

## DEC-022

### Decision

```text
Vaultwarden Source Of Truth
```

### Selected

All credentials stored in:

```text
Vaultwarden
```

### Reason

Centralized credential management.

---

## DEC-023

### Decision

```text
16 Character Minimum Password Length
```

### Reason

Improved password security.

---

# Backup Decisions

---

## DEC-024

### Decision

```text
Kopia
```

### Selected

Backup Platform

### Reason

Simple and flexible backup management.

---

## DEC-025

### Decision

```text
OneDrive
```

### Selected

Offsite Backup Target

### Reason

Existing platform availability.

---

## DEC-026

### Decision

```text
Critical Data First
```

### Priority Services

- Immich
- Vaultwarden
- Paperless
- Nextcloud
- Home Assistant
- BookStack

### Reason

Data is more important than services.

---

## DEC-027

### Decision

```text
No Plex Metadata Backup
```

### Reason

Can be rebuilt.

---

## DEC-028

### Decision

```text
No ARR Configuration Backup
```

### Reason

Configurations are considered disposable.

---

# Monitoring Decisions

---

## DEC-029

### Decision

```text
Homepage + Uptime Kuma
```

### Reason

Separation of:

- Dashboard
- Monitoring

responsibilities.

---

## DEC-030

### Decision

```text
Email + Mobile Notifications
```

### Reason

Improved awareness of outages.

---

# Documentation Decisions

---

## DEC-031

### Decision

```text
Documentation Before Deployment
```

### Reason

Infrastructure should be designed before implementation.

---

## DEC-032

### Decision

```text
TBD Instead Of Guessing
```

### Reason

Unknown values are better than incorrect values.

---

## DEC-033

### Decision

```text
Domain-Based Documentation Structure
```

### Selected Structure

```text
Architecture
Infrastructure
Services
Operations
```

### Reason

Supports long-term maintenance.

---

# Future Review Decisions

These decisions may be revisited later.

| Decision | Status |
|----------|----------|
| IPv6 Deployment | Future Review |
| Authentik Deployment | Future Review |
| Tailscale ACLs | Future Review |
| AI Expansion | Future Review |
| Additional Storage Hosts | Future Review |
| Grafana | Future Review |
| Prometheus | Future Review |

---

# Decision Statistics

| Category | Count |
|----------|----------|
| Platform Decisions | 3 |
| Network Decisions | 4 |
| DNS Decisions | 3 |
| Remote Access Decisions | 3 |
| Service Placement Decisions | 4 |
| AI Decisions | 2 |
| Security Decisions | 4 |
| Backup Decisions | 5 |
| Monitoring Decisions | 2 |
| Documentation Decisions | 3 |

Total Architectural Decisions:

```text
33
```

---

# Related Documents

- ARCHITECTURE.md
- SERVICE-INVENTORY.md
- SERVICE-DEPENDENCIES.md
- SECURITY-BASELINE.md
- OPERATIONS-RUNBOOK.md
- SPRINT-PLAN.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Architectural Decision Record |