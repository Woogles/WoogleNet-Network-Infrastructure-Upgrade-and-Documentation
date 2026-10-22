# DHCP Plan

## Purpose

This document serves as the authoritative DHCP implementation worksheet for the WoogleNet environment.

The goals of this plan are to:

- Standardize DHCP configuration
- Prevent IP conflicts
- Reserve infrastructure addresses
- Define static assignment ranges
- Define dynamic assignment ranges
- Simplify troubleshooting

This document is intended for Sprint 01 implementation.

---

# DHCP Architecture

## DHCP Provider

Platform:

```text
UDM-Pro
```

---

## DNS Assignment

Primary DNS:

```text
10.0.10.50
```

AdGuard Primary

---

Secondary DNS:

```text
10.0.10.51
```

AdGuard Secondary

---

## Lease Duration

Standard Lease:

```text
24 Hours
```

---

# DHCP Summary

| VLAN | Name | DHCP | Scope |
|----------|----------|----------|----------|
| 10 | Infrastructure | Disabled | N/A |
| 20 | Trusted | Enabled | 10.0.20.100-249 |
| 30 | IoT | Enabled | 10.0.30.100-249 |
| 40 | Guest | Enabled | 10.0.40.100-249 |

---

# VLAN 10 - Infrastructure

## DHCP Status

```text
Disabled
```

---

## Reason

Infrastructure devices must always maintain predictable static addresses.

Examples:

- Proxmox Hosts
- OpenMediaVault
- AdGuard
- Homepage
- Uptime Kuma
- Network Equipment

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

## DNS

```text
10.0.10.50
10.0.10.51
```

---

# Infrastructure Assignments

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

## DHCP Status

```text
Enabled
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

## DHCP Pool

### Start

```text
10.0.20.100
```

---

### End

```text
10.0.20.249
```

---

## Reserved Range

```text
10.0.20.2
      ↓
10.0.20.99
```

Reserved for future static assignments.

---

## Reserved Expansion Range

```text
10.0.20.250
      ↓
10.0.20.254
```

Reserved.

---

## DNS Assignment

Primary:

```text
10.0.10.50
```

Secondary:

```text
10.0.10.51
```

---

## Typical Devices

- Workstations
- Laptops
- Phones
- Tablets
- Administrative Systems

---

# VLAN 30 - IoT

## DHCP Status

```text
Enabled
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

## DHCP Pool

### Start

```text
10.0.30.100
```

---

### End

```text
10.0.30.249
```

---

## Reserved Range

```text
10.0.30.2
      ↓
10.0.30.99
```

Reserved for static IoT devices.

---

## DNS Assignment

Primary:

```text
10.0.10.50
```

Secondary:

```text
10.0.10.51
```

---

## Typical Devices

- Smart TVs
- Streaming Devices
- Smart Home Devices
- Sensors
- Speakers

---

# VLAN 40 - Guest

## DHCP Status

```text
Enabled
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

## DHCP Pool

### Start

```text
10.0.40.100
```

---

### End

```text
10.0.40.249
```

---

## Reserved Range

```text
10.0.40.2
      ↓
10.0.40.99
```

Reserved.

---

## DNS Assignment

Primary:

```text
10.0.10.50
```

Secondary:

```text
10.0.10.51
```

---

## Typical Devices

- Visitors
- Temporary Devices
- Contractor Devices
- Untrusted Devices

---

# DHCP Reservation Strategy

## Infrastructure

Use:

```text
Static Addressing
```

Not Reservations.

---

## Trusted Devices

Use Reservations For:

- Primary PCs
- Laptops
- Printers

---

## IoT Devices

Use Reservations For:

- Cameras
- Smart Hubs
- Access Points
- Media Devices

---

## Guest Devices

Use:

```text
Dynamic DHCP Only
```

No Reservations.

---

# DHCP Validation Checklist

## VLAN 20

- [ ] Receives 10.0.20.x Address
- [ ] Receives Correct Gateway
- [ ] Receives Correct DNS

---

## VLAN 30

- [ ] Receives 10.0.30.x Address
- [ ] Receives Correct Gateway
- [ ] Receives Correct DNS

---

## VLAN 40

- [ ] Receives 10.0.40.x Address
- [ ] Receives Correct Gateway
- [ ] Receives Correct DNS

---

# Failure Indicators

## Incorrect Address

Examples:

```text
169.254.x.x

Wrong VLAN Range

No Lease
```

---

## Troubleshooting Order

1. Check SSID Mapping
2. Check Switch Port VLAN
3. Check DHCP Scope
4. Check Gateway Assignment
5. Check DNS Assignment

Reference:

```text
test-matrix.md
rollback-procedure.md
```

---

# Configuration Backup Requirement

Before making DHCP changes:

- [ ] Export UDM-Pro Configuration

Store In:

```text
deployment/sprint-01/exports/udm-pro/
```

---

# Related Documents

- vlan-design.md
- firewall-rules.md
- test-matrix.md
- rollback-procedure.md
- IP-ADDRESS-PLAN.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial DHCP Implementation Plan |