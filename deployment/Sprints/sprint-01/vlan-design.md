# VLAN Design Sheet

## Purpose

This document serves as the authoritative implementation worksheet for all VLANs within the WoogleNet environment.

This document is intended for deployment and operational use.

The goals of this document are to:

- Standardize VLAN implementation
- Define IP allocations
- Reserve infrastructure addresses
- Support DHCP planning
- Support firewall implementation
- Support future growth

This document overrides assumptions and should be treated as the network source of truth.

---

# Network Summary

## Address Space

```text
10.0.0.0/16
```

---

## VLAN Summary

| VLAN | Name | Network | Gateway | DHCP |
|----------|----------|----------|----------|----------|
| 10 | Infrastructure | 10.0.10.0/24 | 10.0.10.1 | No |
| 20 | Trusted | 10.0.20.0/24 | 10.0.20.1 | Yes |
| 30 | IoT | 10.0.30.0/24 | 10.0.30.1 | Yes |
| 40 | Guest | 10.0.40.0/24 | 10.0.40.1 | Yes |

---

# VLAN 10 - Infrastructure

## Purpose

```text
Servers
Storage
Network Equipment
Management Interfaces
Core Services
```

---

## Network

```text
10.0.10.0/24
```

---

## Gateway

```text
10.0.10.1
```

---

## DHCP

```text
Disabled
```

Static assignments only.

---

## Reserved Address Blocks

### Infrastructure Core

```text
10.0.10.1 - 10.0.10.49
```

Network Infrastructure

---

### DNS Services

```text
10.0.10.50
10.0.10.51
```

AdGuard Primary / Secondary

---

### Core Services

```text
10.0.10.60 - 10.0.10.79
```

Homepage
Uptime Kuma
Future Core Services

---

### Proxmox Hosts

```text
10.0.10.30
10.0.10.31
10.0.10.32
```

DAX
MAX
PAX

---

### Application Host

```text
10.0.10.33
```

JAX

---

### Future Infrastructure

```text
10.0.10.80 - 10.0.10.119
```

Reserved

---

# Infrastructure Allocation Table

| Device | Address |
|----------|----------|
| Gateway | 10.0.10.1 |
| DAX | 10.0.10.30 |
| MAX | 10.0.10.31 |
| PAX | 10.0.10.32 |
| JAX | 10.0.10.33 |
| AdGuard Primary | 10.0.10.50 |
| AdGuard Secondary | 10.0.10.51 |
| Homepage | 10.0.10.60 |
| Uptime Kuma | 10.0.10.61 |

---

# VLAN 20 - Trusted

## Purpose

```text
Administrative Devices

Primary User Devices

Family Devices

Workstations

Laptops

Phones

Tablets
```

---

## Network

```text
10.0.20.0/24
```

---

## Gateway

```text
10.0.20.1
```

---

## DHCP Scope

```text
10.0.20.100
     ↓
10.0.20.249
```

---

## Reserved Addresses

### Static Reservations

```text
10.0.20.2 - 10.0.20.99
```

Reserved

---

### DHCP Pool

```text
10.0.20.100 - 10.0.20.249
```

---

### Future Static Expansion

```text
10.0.20.250 - 10.0.20.254
```

Reserved

---

# VLAN 30 - IoT

## Purpose

```text
Smart Home Devices

Media Devices

Sensors

Switches

IoT Platforms
```

---

## Network

```text
10.0.30.0/24
```

---

## Gateway

```text
10.0.30.1
```

---

## DHCP Scope

```text
10.0.30.100
     ↓
10.0.30.249
```

---

## Reserved Addresses

### Static Devices

```text
10.0.30.2 - 10.0.30.99
```

Reserved

---

### DHCP Pool

```text
10.0.30.100 - 10.0.30.249
```

---

# VLAN 40 - Guest

## Purpose

```text
Visitors

Temporary Devices

Untrusted Devices
```

---

## Network

```text
10.0.40.0/24
```

---

## Gateway

```text
10.0.40.1
```

---

## DHCP Scope

```text
10.0.40.100
     ↓
10.0.40.249
```

---

## Reserved Addresses

### Infrastructure

```text
10.0.40.2 - 10.0.40.99
```

Reserved

---

### DHCP Pool

```text
10.0.40.100 - 10.0.40.249
```

---

# DNS Assignment

## Primary

```text
10.0.10.50
```

AdGuard Primary

---

## Secondary

```text
10.0.10.51
```

AdGuard Secondary

---

## Assigned To

- VLAN 20
- VLAN 30
- VLAN 40

---

# SSID Mapping

| SSID | VLAN |
|----------|----------|
| WoogleNet | 20 |
| WoogleNet-IoT | 30 |
| WoogleNet-Guest | 40 |

---

# Firewall Expectations

## Trusted

Allowed:

```text
Infrastructure

Internet

Services
```

---

## IoT

Allowed:

```text
Internet
```

Denied:

```text
Infrastructure

Trusted

Guest
```

Exception:

```text
Home Assistant
```

---

## Guest

Allowed:

```text
Internet
```

Denied:

```text
Everything Internal
```

---

# Future VLANs

Currently Reserved

| VLAN | Purpose | Status |
|----------|----------|----------|
| 50 | Cameras | Future |
| 60 | Lab | Future |
| 70 | AI | Future |
| 80 | Storage Replication | Future |

---

# Validation Checklist

## VLAN 10

- [ ] Gateway Reachable
- [ ] Infrastructure Hosts Reachable
- [ ] DNS Reachable

---

## VLAN 20

- [ ] DHCP Functional
- [ ] DNS Functional
- [ ] Internet Functional

---

## VLAN 30

- [ ] DHCP Functional
- [ ] DNS Functional
- [ ] Internet Functional
- [ ] Isolation Functional

---

## VLAN 40

- [ ] DHCP Functional
- [ ] DNS Functional
- [ ] Internet Functional
- [ ] Isolation Functional

---

# Related Documents

- IP-ADDRESS-PLAN.md
- VLAN-PLAN.md
- FIREWALL-RULES.md
- DNS-ARCHITECTURE.md
- deployment/sprint-01/firewall-rules.md
- deployment/sprint-01/dhcp-plan.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial VLAN Implementation Worksheet |