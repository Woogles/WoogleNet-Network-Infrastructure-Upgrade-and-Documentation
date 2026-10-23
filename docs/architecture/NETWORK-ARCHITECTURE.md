# NETWORK-ARCHITECTURE

## Purpose

This document serves as the authoritative network architecture reference for the WoogleNet environment.

The purpose of this document is to:

- Document network design
- Define network segmentation
- Define VLAN strategy
- Define security boundaries
- Define administrative access paths
- Support troubleshooting
- Support disaster recovery
- Support operational readiness reviews
- Support certification activities

This document provides the logical network architecture used throughout the WoogleNet environment.

Reference Documents:

- ARCHITECTURE.md
- HARDWARE-INVENTORY.md
- DNS-ARCHITECTURE.md
- VPN-ARCHITECTURE.md
- SECURITY-BASELINE.md
- SSH-STANDARD.md

---

# Design Principles

The WoogleNet network is designed around the following principles:

1. Segmentation Before Convenience
2. Tailscale Before Public Exposure
3. Simplicity Over Complexity
4. Recovery Over High Availability
5. Infrastructure Isolation
6. Least Privilege Access
7. Family Usability

---

# Network Overview

## High-Level Topology

```text
Internet
    │
    ▼
UDM-Pro
    │
    ▼
TP-Link Core Switching
    │
    ├── Infrastructure VLAN
    ├── Trusted VLAN
    ├── IoT VLAN
    └── Guest VLAN
            │
            ▼
      UniFi Wireless
            │
            ▼
       Client Devices
```

---

# Core Network Components

## Gateway Layer

| Component | Purpose |
|------------|------------|
| UDM-Pro | Routing |
| UDM-Pro | Firewall |
| UDM-Pro | DHCP |
| UDM-Pro | VLAN Gateway |
| UDM-Pro | Internet Connectivity |

Status:

```text
Production
```

---

## Switching Layer

| Component | Purpose |
|------------|------------|
| TP-Link Switch 01 | Core Switching |
| TP-Link Switch 02 | Distribution Switching |

Status:

```text
Production
```

---

## Wireless Layer

| Component | Purpose |
|------------|------------|
| UniFi AP Infrastructure | Wireless Coverage |
| UniFi AP Infrastructure | VLAN Distribution |
| UniFi AP Infrastructure | Client Connectivity |

Status:

```text
Production
```

---

# Addressing Strategy

## Private Address Space

Network:

```text
10.0.0.0/16
```

Usage:

```text
10.0.X.0/24
```

allocated per VLAN.

---

# VLAN Architecture

## VLAN Summary

| VLAN | Name | Purpose |
|----------|----------|----------|
| 10 | Infrastructure | Servers, Network Equipment, Administrative Systems |
| 20 | Trusted | Family Devices |
| 30 | IoT | Smart Devices |
| 40 | Guest | Internet Access Only |

---

# VLAN 10 - Infrastructure

## Purpose

Dedicated network for:

- Servers
- Hypervisors
- Storage Systems
- Infrastructure Services
- Administrative Platforms

---

## Example Systems

- DAX
- MAX
- PAX
- JAX
- OpenMediaVault
- UDM-Pro
- TP-Link Switches

---

## Security Requirements

Allowed Access:

```text
Infrastructure ↔ Infrastructure
```

Administrative Access:

```text
Allowed
```

Internet Access:

```text
Restricted To Operational Requirements
```

---

# VLAN 20 - Trusted

## Purpose

Primary network for family-owned devices.

Examples:

- Desktops
- Laptops
- Mobile Phones
- Tablets

---

## Security Requirements

May Access:

- Infrastructure Services
- Media Services
- Home Automation
- Knowledge Platform

Administrative Access:

```text
Allowed
```

subject to security controls.

---

# VLAN 30 - IoT

## Purpose

Isolation network for smart devices.

Examples:

- Smart Switches
- Cameras
- Smart TVs
- Streaming Devices
- Voice Assistants

---

## Security Requirements

Default Access:

```text
IoT → Internet
```

Restricted Access:

```text
IoT ↛ Infrastructure
```

Exception-Based Access:

```text
IoT → Home Assistant
```

where required.

---

# VLAN 40 - Guest

## Purpose

Internet-only access for guests.

Examples:

- Visitor Devices
- Temporary Devices

---

## Security Requirements

Allowed:

```text
Guest → Internet
```

Blocked:

```text
Guest ↛ Infrastructure
Guest ↛ Trusted
Guest ↛ IoT
```

---

# Administrative Access Architecture

## Authorized Access Methods

Administrative access is permitted through:

```text
Trusted VLAN
Tailscale
Physical Console
```

---

## Administrative Priority

Preferred access methods:

```text
1. Local Trusted VLAN

2. Tailscale

3. Physical Console
```

---

## Prohibited Access

The following administrative paths are prohibited:

```text
Direct Internet SSH

Direct Internet Administration

Unauthenticated Administrative Access
```

Reference:

SSH-STANDARD.md

---

# Remote Access Architecture

## Primary Remote Access Platform

```text
Tailscale
```

Purpose:

- Encrypted Administrative Access
- Secure Service Access
- Remote Troubleshooting
- Remote Recovery Operations

---

## Remote Access Requirements

All Infrastructure Hosts:

- DAX
- MAX
- PAX
- JAX

must participate in:

```text
Tailscale Tailnet
```

Reference:

VPN-ARCHITECTURE.md

---

# DNS Architecture Integration

## Primary Resolver

```text
AdGuard Primary
```

Hosted On:

```text
DAX
```

---

## Secondary Resolver

```text
AdGuard Secondary
```

Hosted On:

```text
MAX
```

---

## Client Configuration

Primary DNS:

```text
AdGuard Primary
```

Secondary DNS:

```text
AdGuard Secondary
```

Reference:

DNS-ARCHITECTURE.md

---

# Service Placement Architecture

## Infrastructure Platform

Hosted On:

```text
DAX
MAX
```

Services:

- AdGuard
- Homepage
- Uptime Kuma
- Home Assistant

---

## Storage Platform

Hosted On:

```text
PAX
```

Services:

- OpenMediaVault

---

## Application Platform

Hosted On:

```text
JAX
```

Services:

- Media Platform
- Automation Platform
- Knowledge Platform
- Security Platform

Reference:

SERVICE-INVENTORY.md

---

# Traffic Flow Model

## Family Device Access

```text
Trusted VLAN
     ↓
DNS
     ↓
Application Services
```

---

## IoT Device Access

```text
IoT VLAN
     ↓
Home Assistant
     ↓
Approved Services
```

---

## Guest Access

```text
Guest VLAN
     ↓
Internet Only
```

---

## Remote Administration

```text
Internet
     ↓
Tailscale
     ↓
Infrastructure VLAN
     ↓
Services
```

---

# Security Architecture

## Network Security Controls

Controls include:

- VLAN Segmentation
- Firewall Policies
- Tailscale Access Controls
- DNS Filtering
- MFA Protection
- SSH Restrictions

Reference:

- SECURITY-BASELINE.md
- MFA-STANDARD.md
- SSH-STANDARD.md

---

# Monitoring Requirements

The following network components must be monitored:

## Infrastructure

- UDM-Pro
- DAX
- MAX
- PAX
- JAX

---

## Core Services

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

---

## Storage

- OpenMediaVault

Reference:

service-readiness-matrix.md

---

# Disaster Recovery Considerations

## Critical Components

Recovery Priority:

```text
Tier 1
```

Components:

- UDM-Pro
- DNS
- OpenMediaVault
- Infrastructure VLAN

---

## Single Points of Failure

| Component | Impact | Mitigation |
|------------|------------|------------|
| UDM-Pro | Loss Of Routing | Configuration Backups |
| Internet Provider | Loss Of Remote Access | Local Administration |
| PAX | Storage Services Impact | Recovery Procedures |
| OpenMediaVault | Storage Availability Impact | Backup Strategy |
| Core Switching | Partial Network Disruption | Spare Hardware Planning |

Reference:

DISASTER-RECOVERY.md

---

# Operational Readiness Requirements

Network validation occurs during:

- Service Readiness Reviews
- Operations Readiness Assessments
- Disaster Recovery Exercises
- Production Readiness Reviews
- Certification Reviews

Reference Documents:

- service-readiness-matrix.md
- operations-readiness-assessment.md
- production-readiness-review.md
- ENVIRONMENT-CERTIFICATION.md

---

# Success Criteria

The network architecture is considered operational when:

- VLAN Segmentation Is Functional
- DNS Services Are Operational
- Tailscale Access Is Operational
- Infrastructure Hosts Are Reachable
- Monitoring Is Active
- Firewall Policies Are Enforced
- Documentation Reflects Reality
- Recovery Procedures Are Validated

The architecture must always reflect the production environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial network architecture aligned with Sprint 01-10 implementation, security governance, recovery framework, and operational certification model |