# HARDWARE-INVENTORY

## Purpose

This document serves as the authoritative inventory for all physical infrastructure supporting the WoogleNet environment.

The purpose of this document is to:

- Track physical assets
- Track infrastructure roles
- Support operational planning
- Support capacity planning
- Support lifecycle management
- Support disaster recovery planning
- Support certification reviews
- Support hardware replacement processes

This document should reflect the current production environment.

Reference Documents:

- ARCHITECTURE.md
- STORAGE-ARCHITECTURE.md
- NETWORK-ARCHITECTURE.md
- DISASTER-RECOVERY.md
- service-readiness-matrix.md
- ENVIRONMENT-CERTIFICATION.md

---

# Infrastructure Summary

## Physical Asset Inventory

| Category | Quantity |
|-----------|-----------|
| Gateway | 1 |
| Managed Switches | 2 |
| Wireless Access Points | 7 |
| Proxmox Hosts | 3 |
| Ubuntu Hosts | 1 |
| NAS Platforms | 1 |
| UPS Units | 5 |

---

# Environment Infrastructure

## Network Layer

| Device | Role | Status |
|----------|----------|----------|
| UDM-Pro | Gateway, Routing, Firewall, DHCP | Operational |
| TP-Link Switch 01 | Core Switching | Operational |
| TP-Link Switch 02 | Core Switching | Operational |
| UniFi Wireless Infrastructure | Wireless Access | Operational |

---

# Compute Infrastructure

## Platform Overview

| Host | Platform | Role | Status |
|----------|----------|----------|----------|
| DAX | Proxmox VE | Infrastructure Host | Operational |
| MAX | Proxmox VE | Infrastructure Host | Operational |
| PAX | Proxmox VE | Storage Host | Operational |
| JAX | Ubuntu Server | Application Host | Operational |

---

# DAX

## Host Information

| Property | Value |
|----------|----------|
| Platform | Dell PowerEdge R720 |
| Operating System | Proxmox VE |
| Primary Role | Infrastructure Services |
| Status | Operational |
| Monitoring | Enabled |
| Backup Coverage | Configuration Backups |
| Recovery Documented | Yes |

### Hosted Services

- AdGuard Primary
- Homepage
- Uptime Kuma

---

# MAX

## Host Information

| Property | Value |
|----------|----------|
| Platform | Dell PowerEdge R720 |
| Operating System | Proxmox VE |
| Primary Role | Infrastructure Services |
| Status | Operational |
| Monitoring | Enabled |
| Backup Coverage | Configuration Backups |
| Recovery Documented | Yes |

### Hosted Services

- AdGuard Secondary
- Home Assistant

---

# PAX

## Host Information

| Property | Value |
|----------|----------|
| Platform | Dell PowerEdge R720 |
| Operating System | Proxmox VE |
| Primary Role | Storage Services |
| Status | Operational |
| Monitoring | Enabled |
| Backup Coverage | Configuration Backups |
| Recovery Documented | Yes |

### Hosted Services

- OpenMediaVault

---

# JAX

## Host Information

| Property | Value |
|----------|----------|
| Operating System | Ubuntu Server |
| Primary Role | Application Platform |
| Status | Operational |
| Monitoring | Enabled |
| Backup Coverage | Yes |
| Recovery Documented | Yes |

### Hosted Service Categories

- Media Platform
- Automation Platform
- Knowledge Platform
- Security Platform
- Backup Platform

---

# GPU Resources

## GPU-01

| Property | Value |
|----------|----------|
| Model | NVIDIA RTX 3060 |
| VRAM | 12 GB |
| Primary Usage | AI Inference |
| Status | Operational |

---

## GPU-02

| Property | Value |
|----------|----------|
| Model | NVIDIA GTX 1070 |
| VRAM | 8 GB |
| Primary Usage | AI Inference |
| Status | Operational |

---

# Storage Infrastructure

## Storage Platform

| Property | Value |
|----------|----------|
| Platform | OpenMediaVault |
| Host | PAX |
| Deployment Type | Virtual Machine |
| Status | Operational |

---

## Storage Functions

- Application Storage
- Media Storage
- Document Storage
- Backup Repository Storage
- Shared Storage

Reference:

- STORAGE-ARCHITECTURE.md
- STORAGE-MAP.md

---

# Power Infrastructure

## UPS Inventory

### Tripp Lite SMART1500LCD

| Property | Value |
|----------|----------|
| Quantity | 3 |
| Capacity | 1500VA |
| Output Power | 900W |
| Status | Operational |

---

### APC Back-UPS Pro

| Property | Value |
|----------|----------|
| Quantity | 2 |
| Capacity | 1500VA |
| Output Power | 900W |
| Status | Operational |

---

## UPS Management

| Property | Value |
|----------|----------|
| Platform | NUT |
| Monitoring | Enabled |
| Shutdown Automation | Configured |
| Operational Status | Active |

---

# Hardware Recovery Classification

## Tier 1 Critical Components

Recovery Priority:

Immediate

Components:

- UDM-Pro
- OpenMediaVault
- PAX
- DAX
- MAX
- JAX

---

## Tier 2 Important Components

Recovery Priority:

72 Hours

Components:

- Core Switching
- Wireless Infrastructure
- UPS Management

---

# Single Points of Failure

| Component | Impact | Mitigation |
|----------|----------|----------|
| UDM-Pro | Network Loss | Configuration Backups |
| PAX | Storage Loss | Kopia + OneDrive Protection |
| OpenMediaVault | Storage Services Loss | Recovery Procedures |
| Internet Service | Remote Access Impact | Local Operations Continue |
| JAX | Application Platform Loss | Backup And Recovery Procedures |

Reference:

DISASTER-RECOVERY.md

---

# Monitoring Coverage

The following infrastructure must be monitored:

- UDM-Pro
- DAX
- MAX
- PAX
- JAX
- OpenMediaVault
- AdGuard
- Homepage
- Uptime Kuma
- Critical Services

Reference:

service-readiness-matrix.md

---

# Lifecycle Management

Hardware inventory updates are required when:

- Equipment Added
- Equipment Removed
- Equipment Replaced
- Host Roles Changed
- Capacity Increased
- Infrastructure Retired

Reference:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

# Annual Review Requirements

Review:

- Asset Inventory Accuracy
- Capacity Utilization
- Hardware Lifecycle Status
- Recovery Readiness
- Monitoring Coverage
- Replacement Planning

Reference:

SECURITY-AUDIT-PROGRAM.md

---

# Success Criteria

This document is considered current when:

- All infrastructure assets are recorded
- Host roles are accurate
- Recovery classifications are assigned
- Monitoring coverage is documented
- Operational status reflects reality
- Lifecycle records are maintained

Documentation must always reflect the current production environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Reconciled with completed Sprint 01-10 program, operational readiness framework, governance standards, and certification model |