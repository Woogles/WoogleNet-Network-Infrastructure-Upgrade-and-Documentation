# RACK-LAYOUT

## Purpose

This document serves as the authoritative reference for the physical rack layout within the WoogleNet environment.

The purpose of this document is to:

- Document Physical Equipment Placement
- Document Rack Utilization
- Document Infrastructure Locations
- Support Troubleshooting
- Support Maintenance Activities
- Support Power Planning
- Support Cabling Management
- Support Hardware Replacement
- Support Recovery Planning
- Support Certification Activities

This document should always reflect the current physical infrastructure deployment.

Reference Documents:

- ARCHITECTURE.md
- HARDWARE-INVENTORY.md
- NETWORK-ARCHITECTURE.md
- CABLING.md
- POWER-AND-UPS.md
- DISASTER-RECOVERY.md
- ENVIRONMENT-CERTIFICATION.md

---

# Rack Information

| Property | Value |
|----------|----------|
| Rack Size | 42U |
| Rack Type | 4-Post Rack |
| Status | Operational |
| Documentation Status | Controlled |

---

# Design Principles

## Rack Organization Strategy

Equipment is organized using the following structure:

```text
Top
        ↓
Network Infrastructure

Middle
        ↓
Management & Operations

Lower Middle
        ↓
Compute Infrastructure

Bottom
        ↓
Power Infrastructure
```

---

## Design Goals

- Minimize Cable Lengths
- Simplify Troubleshooting
- Simplify Maintenance
- Improve Airflow
- Centralize Network Infrastructure
- Isolate Power Infrastructure
- Maintain Expansion Capacity

---

# Rack Layout Overview

| Rack Units | Equipment | Purpose |
|------------|------------|------------|
| U01 | UDM-Pro | Gateway / Firewall |
| U02 | Patch Panel 01 | Network Termination |
| U03 | TP-Link Switch 01 | Core Switching |
| U04 | Patch Panel 02 | Network Termination |
| U05 | TP-Link Switch 02 | Core Switching |
| U06 | Patch Panel 03 | Network Termination |
| U07 | Auxiliary Switch | Expansion Capacity |
| U08 | Patch Panel 04 | Network Termination |
| U09-U11 | Reserved | Expansion Capacity |
| U12 | Rack Monitor | Console Access |
| U13-U15 | Reserved | Expansion Capacity |
| U16 | Management Shelf | Keyboard / Mouse |
| U17-U20 | Reserved | Expansion Capacity |
| U21 | Accessory Shelf | Spare Components |
| U22 | Reserved | Expansion Capacity |
| U23 | KVM | Local Management |
| U24-U25 | DAX | Infrastructure Host |
| U26-U27 | MAX | Infrastructure Host |
| U28-U29 | Reserved Compute Area | Future Expansion |
| U30-U31 | PAX | Storage Host |
| U32-U39 | UPS Infrastructure | Power Protection |
| U40-U42 | Reserved | Future Growth |

---

# Network Infrastructure Zone

## U01

### UDM-Pro

Role:

```text
Gateway
Firewall
Router
DHCP
```

Dependencies:

- Internet Connectivity
- Switching Infrastructure

Classification:

```text
Critical
```

---

## U03

### TP-Link Switch 01

Role:

```text
Core Distribution
```

Classification:

```text
Critical
```

---

## U05

### TP-Link Switch 02

Role:

```text
Core Distribution
```

Classification:

```text
Critical
```

---

## U07

### Auxiliary Switch

Role:

```text
Expansion Capacity
```

Classification:

```text
Standard
```

---

# Patch Panel Infrastructure

## Patch Panel 01

Location:

```text
U02
```

Purpose:

```text
Structured Cabling Termination
```

---

## Patch Panel 02

Location:

```text
U04
```

Purpose:

```text
Structured Cabling Termination
```

---

## Patch Panel 03

Location:

```text
U06
```

Purpose:

```text
Structured Cabling Termination
```

---

## Patch Panel 04

Location:

```text
U08
```

Purpose:

```text
Structured Cabling Termination
```

Reference:

CABLING.md

---

# Management Infrastructure

## U12

### Rack Monitor

Purpose:

- Local Console Access
- Infrastructure Recovery
- Maintenance Activities

---

## U16

### Management Shelf

Contents:

- Keyboard
- Mouse

Purpose:

```text
Local Administration
```

---

## U21

### Accessory Shelf

Contents:

- Spare Components
- Temporary Equipment
- Replacement Hardware

---

## U23

### KVM

Purpose:

- Local Infrastructure Management
- Operating System Installation
- Recovery Operations
- Emergency Access

Classification:

```text
Critical
```

---

# Compute Infrastructure

## DAX

### Location

```text
U24-U25
```

### Role

```text
Infrastructure Host
```

Primary Services:

- AdGuard Primary
- Homepage
- Uptime Kuma

Reference:

SERVICE-INVENTORY.md

---

## MAX

### Location

```text
U26-U27
```

### Role

```text
Infrastructure Host
```

Primary Services:

- AdGuard Secondary
- Home Assistant

Reference:

SERVICE-INVENTORY.md

---

## PAX

### Location

```text
U30-U31
```

### Role

```text
Storage Host
```

Primary Services:

- OpenMediaVault

Reference:

STORAGE-ARCHITECTURE.md

---

## JAX

### Role

```text
Application Platform
```

Primary Services:

- Media Platform
- Automation Platform
- Knowledge Platform
- Security Platform

Current Deployment:

```text
Non-Rack-Mounted System
```

Reference:

HARDWARE-INVENTORY.md

---

# Power Infrastructure

## UPS Zone

### Rack Location

```text
U32-U39
```

Purpose:

```text
Power Protection
```

Reference:

POWER-AND-UPS.md

---

## Installed UPS Systems

### Tripp Lite SMART1500LCD

Quantity:

```text
3
```

---

### APC Back-UPS Pro

Quantity:

```text
2
```

---

# Physical Asset Mapping

| Asset | Location | Criticality |
|----------|----------|----------|
| UDM-Pro | U01 | Critical |
| Patch Panel 01 | U02 | Critical |
| Switch 01 | U03 | Critical |
| Patch Panel 02 | U04 | Critical |
| Switch 02 | U05 | Critical |
| Patch Panel 03 | U06 | Critical |
| Auxiliary Switch | U07 | Standard |
| Patch Panel 04 | U08 | Critical |
| Rack Monitor | U12 | Important |
| Management Shelf | U16 | Standard |
| Accessory Shelf | U21 | Standard |
| KVM | U23 | Critical |
| DAX | U24-U25 | Critical |
| MAX | U26-U27 | Critical |
| PAX | U30-U31 | Critical |
| UPS Infrastructure | U32-U39 | Critical |

---

# Recovery Considerations

## Recovery Priority

Physical infrastructure should be restored in the following order:

```text
Power Infrastructure
        ↓
Network Infrastructure
        ↓
Storage Infrastructure
        ↓
Compute Infrastructure
        ↓
Application Services
```

Reference:

DISASTER-RECOVERY.md

---

## Critical Recovery Components

The following rack assets directly support Tier 1 recovery:

- UDM-Pro
- Switch 01
- Switch 02
- DAX
- MAX
- PAX
- UPS Infrastructure

---

# Capacity Management

## Utilized Rack Space

Approximate Utilized Rack Units:

```text
24U
```

---

## Reserved Capacity

Approximate Reserved Rack Units:

```text
18U
```

Purpose:

- Future Infrastructure
- Additional Storage
- Additional Compute
- Additional UPS Capacity

---

# Maintenance Requirements

## Monthly

Verify:

- Equipment Mounted Securely
- Airflow Unobstructed
- Cable Management Intact
- UPS Status Normal

---

## Quarterly

Verify:

- Rack Inventory Accuracy
- Device Placement Accuracy
- Label Visibility
- Console Access Functionality

---

## Annual

Review:

- Capacity Utilization
- Expansion Planning
- Physical Infrastructure Condition

Reference:

OPERATIONS-RUNBOOK.md

---

# Operational Readiness Requirements

Physical infrastructure is considered operationally ready when:

✅ Equipment Locations Verified

✅ Power Protection Operational

✅ Network Connectivity Verified

✅ Recovery Dependencies Documented

✅ Asset Inventory Current

Reference:

operations-readiness-assessment.md

---

# Certification Requirements

Rack certification requires:

✅ Device Locations Verified

✅ Power Infrastructure Verified

✅ Network Infrastructure Verified

✅ Asset Inventory Current

✅ Documentation Accurate

Reference:

ENVIRONMENT-CERTIFICATION.md

---

# Validation Checklist

- [ ] UDM-Pro Location Verified
- [ ] Switch Locations Verified
- [ ] Patch Panel Locations Verified
- [ ] DAX Location Verified
- [ ] MAX Location Verified
- [ ] PAX Location Verified
- [ ] JAX Deployment Location Verified
- [ ] KVM Connectivity Verified
- [ ] UPS Locations Verified
- [ ] Documentation Current

---

# Success Criteria

The rack layout is considered current when:

- Equipment Locations Are Accurate
- Physical Inventory Is Accurate
- Recovery Dependencies Are Documented
- Power Infrastructure Is Documented
- Expansion Capacity Is Documented
- Certification Requirements Are Satisfied
- Documentation Reflects Reality

The rack layout serves as the authoritative physical infrastructure reference for the WoogleNet environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Rewritten to align with operational readiness framework, power architecture, recovery model, asset inventory, and certification requirements |
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Rack Layout Documentation |
