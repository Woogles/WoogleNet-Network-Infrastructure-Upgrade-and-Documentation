# Rack Layout

## Purpose

This document serves as the authoritative reference for the physical rack layout within the WoogleNet environment.

The goals of this document are:

- Document rack organization
- Document equipment placement
- Support troubleshooting
- Support maintenance activities
- Support cabling documentation
- Support power planning
- Simplify hardware replacement

This document should be updated whenever rack equipment is added, removed, relocated, or replaced.

---

# Rack Information

| Property | Value |
|----------|----------|
| Rack Size | 42U |
| Rack Type | 4-Post Rack |
| Status | Active |
| Documentation Status | Current |

---

# Rack Design Principles

## Layout Strategy

Equipment is organized using the following approach:

```text
Top:
Network Infrastructure

Middle:
Management

Lower Middle:
Compute

Bottom:
Power
```

---

## Design Goals

- Keep networking equipment accessible
- Minimize cable lengths
- Centralize patching
- Isolate power infrastructure
- Provide room for future growth

---

# Rack Layout Overview

| Rack Units | Equipment | Notes |
|------------|------------|------------|
| U01 | UDM-Pro | Router / Gateway |
| U02 | Patch Panel | Network Termination |
| U03 | TP-Link Switch | Distribution Switch |
| U04 | Patch Panel | Network Termination |
| U05 | TP-Link Switch | Distribution Switch |
| U06 | Patch Panel | Network Termination |
| U07 | Switch | Future / Auxiliary Switch |
| U08 | Patch Panel | Network Termination |
| U09-U11 | Reserved | Future Expansion |
| U12 | Rack Monitor | Console Access |
| U13-U15 | Reserved | Future Expansion |
| U16 | Shelf | Keyboard and Mouse |
| U17-U20 | Reserved | Future Expansion |
| U21 | Shelf | Accessories |
| U22 | Reserved | Future Expansion |
| U23 | KVM | Server Access |
| U24-U25 | DAX | Proxmox Host |
| U26-U27 | MAX | Proxmox Host |
| U28-U29 | JAX / Alternate System Position | Non-Rack System Support Area |
| U30-U31 | PAX | Proxmox Host |
| U32-U39 | UPS Infrastructure | Rack Mounted UPS Units |
| U40-U42 | Reserved | Future Expansion |

---

# Network Infrastructure Section

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

- Internet Connection
- Switching Infrastructure

---

## U02

### Patch Panel

Purpose:

```text
Horizontal Cabling Termination
```

---

## U03

### TP-Link Switch 01

Role:

```text
Core Distribution
```

---

## U04

### Patch Panel

Purpose:

```text
Horizontal Cabling Termination
```

---

## U05

### TP-Link Switch 02

Role:

```text
Core Distribution
```

---

## U06

### Patch Panel

Purpose:

```text
Horizontal Cabling Termination
```

---

## U07

### Auxiliary Switch

Status:

```text
Reserved / Future Use
```

---

## U08

### Patch Panel

Purpose:

```text
Horizontal Cabling Termination
```

---

# Console Management Section

## U12

### Rack Monitor

Purpose:

- Host Management
- Console Access
- Recovery Operations

---

## U16

### Management Shelf

Contents:

- Keyboard
- Mouse

---

## U21

### Accessory Shelf

Contents:

- Spare Components
- Small Accessories
- Temporary Equipment

---

## U23

### KVM

Purpose:

- Local Server Management
- Emergency Access
- Operating System Installation

---

# Compute Section

## DAX

### Rack Location

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

---

## MAX

### Rack Location

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

---

## JAX

### Current Status

The final physical location of JAX requires validation.

Known:

```text
If JAX is the Dell T5810,
it is not rack mountable.
```

Status:

```text
Requires Physical Verification
```

---

## PAX

### Rack Location

```text
U30-U31
```

### Role

```text
Storage Platform Host
```

Primary Services:

- OpenMediaVault VM

---

# Power Section

## UPS Area

### Rack Units

```text
U32-U39
```

---

## Installed UPS Units

### Tripp Lite SMART1500LCD

Quantity:

```text
3
```

---

### APC Back-UPS Pro 1500VA

Quantity:

```text
2
```

---

## Responsibilities

- Runtime Protection
- Graceful Shutdown
- Power Conditioning

---

# Reserved Rack Space

## Expansion Capacity

### Upper Rack

```text
U09-U11
```

Reserved for:

- Network Expansion
- Future Appliances

---

### Mid Rack

```text
U13-U15
U17-U20
U22
```

Reserved for:

- Additional Servers
- Future Equipment

---

### Lower Rack

```text
U40-U42
```

Reserved for:

- Future UPS
- Additional Storage
- Expansion Hardware

---

# Physical Asset Mapping

| System | Rack Position |
|----------|----------|
| UDM-Pro | U01 |
| Switch 01 | U03 |
| Switch 02 | U05 |
| Auxiliary Switch | U07 |
| Monitor | U12 |
| KVM | U23 |
| DAX | U24-U25 |
| MAX | U26-U27 |
| JAX | TBD |
| PAX | U30-U31 |
| UPS Infrastructure | U32-U39 |

---

# Validation Checklist

- [ ] Verify DAX Location
- [ ] Verify MAX Location
- [ ] Verify PAX Location
- [ ] Verify JAX Location
- [ ] Verify UPS Positions
- [ ] Verify Patch Panel Count
- [ ] Verify KVM Connectivity
- [ ] Verify Cable Management

---

# Open Decisions

| Item | Status |
|----------|----------|
| Final JAX Position | Requires Validation |
| Auxiliary Switch Usage | TBD |
| Rack Expansion Strategy | Future Review |
| Additional Storage Hardware | Future Review |

---

# Related Documents

- ARCHITECTURE.md
- HARDWARE-INVENTORY.md
- NETWORK-TOPOLOGY.md
- CABLING.md
- POWER-AND-UPS.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Rack Layout Documentation |