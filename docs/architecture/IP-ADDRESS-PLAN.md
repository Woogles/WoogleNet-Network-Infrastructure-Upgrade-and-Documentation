# IP Address Plan

## Purpose

This document serves as the authoritative source for IP addressing, network segmentation, DHCP allocation, and static address assignments within the WoogleNet environment.

This document defines:

- Network ranges
- VLAN assignments
- Gateway assignments
- DHCP scopes
- Static reservations
- Infrastructure addressing standards

---

# Addressing Strategy

## Supernet

The WoogleNet environment uses the following parent network:

```text
10.0.0.0/16
```

All VLANs are allocated from this address space.

---

# Network Segmentation

| VLAN | Name | Subnet | Gateway | Purpose |
|--------|--------|--------|--------|--------|
| 10 | Infrastructure | 10.0.10.0/24 | 10.0.10.1 | Network and Infrastructure Management |
| 20 | Trusted | 10.0.20.0/24 | 10.0.20.1 | User Devices and Primary Services |
| 30 | IoT | 10.0.30.0/24 | 10.0.30.1 | Smart Home and IoT Devices |
| 40 | Guest | 10.0.40.0/24 | 10.0.40.1 | Temporary and Guest Access |

---

# Address Allocation Standards

## Infrastructure Networks

The Infrastructure VLAN uses static addressing only.

```text
10.0.10.1      Gateway

10.0.10.2-49   Infrastructure
10.0.10.50-99  Servers and Services
10.0.10.100+   Reserved
```

DHCP is not enabled on the Infrastructure VLAN.

---

## Client Networks

The following allocation standard applies to Trusted, IoT, and Guest VLANs.

| Range | Purpose |
|----------|----------|
| .1 | Gateway |
| .2 - .49 | Reserved Infrastructure |
| .50 - .99 | Static Reservations |
| .100 - .249 | DHCP Scope |
| .250 - .254 | Reserved |

---

# Infrastructure VLAN

## Network Details

| Property | Value |
|----------|---------|
| VLAN ID | 10 |
| Network Name | Infrastructure |
| Subnet | 10.0.10.0/24 |
| Gateway | 10.0.10.1 |
| DHCP | Disabled |
| DNS | AdGuard Home HA Pair |

---

## Core Infrastructure

| Device | IP Address |
|----------|----------|
| UDM-Pro | 10.0.10.1 |
| WoogleNetSwitch01 | 10.0.10.10 |
| WoogleNetSwitch02 | 10.0.10.11 |

---

## Wireless Infrastructure

| Device | IP Address |
|----------|----------|
| UniFi Controller | 10.0.10.20 |
| Access Point 01 | 10.0.10.21 |
| Access Point 02 | 10.0.10.22 |
| Access Point 03 | 10.0.10.23 |
| Access Point 04 | 10.0.10.24 |
| Access Point 05 | 10.0.10.25 |
| Access Point 06 | 10.0.10.26 |
| Access Point 07 | 10.0.10.27 |

---

## Compute Infrastructure

| Host | IP Address |
|----------|----------|
| DAX | 10.0.10.30 |
| MAX | 10.0.10.31 |
| PAX | 10.0.10.32 |
| JAX | 10.0.10.33 |

---

## Storage Infrastructure

| Service | IP Address |
|----------|----------|
| OpenMediaVault | 10.0.10.40 |

---

## Core Services

| Service | IP Address |
|----------|----------|
| AdGuard Primary | 10.0.10.50 |
| AdGuard Secondary | 10.0.10.51 |
| Homepage | 10.0.10.60 |
| Uptime Kuma | 10.0.10.61 |

---

# Trusted VLAN

## Network Details

| Property | Value |
|----------|---------|
| VLAN ID | 20 |
| Network Name | Trusted |
| Subnet | 10.0.20.0/24 |
| Gateway | 10.0.20.1 |
| DHCP Scope | 10.0.20.100 - 10.0.20.249 |

---

## Device Types

The Trusted VLAN includes:

- Desktops
- Laptops
- Tablets
- Smart Phones
- Media Streamers
- Personal Devices
- Family Devices

---

## Access Policy

Trusted devices are permitted to access:

- Infrastructure Services
- Self-Hosted Applications
- Media Services
- Storage Services
- DNS Services
- Tailscale Services

---

# IoT VLAN

## Network Details

| Property | Value |
|----------|---------|
| VLAN ID | 30 |
| Network Name | IoT |
| Subnet | 10.0.30.0/24 |
| Gateway | 10.0.30.1 |
| DHCP Scope | 10.0.30.100 - 10.0.30.249 |

---

## Device Types

Examples include:

- Smart Home Devices
- Smart Plugs
- Smart Bulbs
- Sensors
- Cameras (if deployed later)
- Appliances
- Embedded Devices

---

## Access Policy

Default behavior:

```text
IoT → Internet      Allow
IoT → Trusted       Deny
IoT → Infrastructure Deny
IoT → Guest         Deny
```

Exception:

```text
Home Assistant
    →
Approved IoT Devices
```

---

# Guest VLAN

## Network Details

| Property | Value |
|----------|---------|
| VLAN ID | 40 |
| Network Name | Guest |
| Subnet | 10.0.40.0/24 |
| Gateway | 10.0.40.1 |
| DHCP Scope | 10.0.40.100 - 10.0.40.249 |

---

## Device Types

- Guest Phones
- Guest Tablets
- Guest Laptops
- Temporary Devices

---

## Access Policy

```text
Guest → Internet       Allow

Guest → Infrastructure Deny
Guest → Trusted        Deny
Guest → IoT            Deny
```

Guest devices are not permitted to access internal services.

---

# DNS Strategy

## Primary DNS

| Service | Address |
|----------|----------|
| AdGuard Primary | 10.0.10.50 |
| AdGuard Secondary | 10.0.10.51 |

---

## DHCP DNS Assignment

All VLANs should receive:

```text
Primary DNS:
10.0.10.50

Secondary DNS:
10.0.10.51
```

---

# Reserved Address Ranges

## Future Infrastructure

| Range | Purpose |
|----------|----------|
| 10.0.10.70-99 | Future Infrastructure Services |

---

## Future Servers

| Range | Purpose |
|----------|----------|
| 10.0.10.100-149 | Future Server Platforms |

---

## Future Management Services

| Range | Purpose |
|----------|----------|
| 10.0.10.150-199 | Management and Monitoring |

---

# Open Decisions

| Item | Status |
|----------|----------|
| Camera VLAN | Not Required |
| Lab VLAN | Not Required |
| Additional User VLANs | Not Required |
| IPv6 Strategy | TBD |
| Public Service Exposure Strategy | TBD |

---

# Design Principles

1. Management systems live in Infrastructure VLAN.
2. Normal users live in Trusted VLAN.
3. IoT devices remain isolated.
4. Guest devices receive internet-only access.
5. DNS services are redundant.
6. Static assignments are used for infrastructure.
7. DHCP is used for endpoints.
8. Future VLANs should not be created without a documented need.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial IP Address Plan |