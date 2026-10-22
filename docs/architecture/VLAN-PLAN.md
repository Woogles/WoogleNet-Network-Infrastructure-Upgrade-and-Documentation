# VLAN Plan

## Purpose

This document defines the VLAN architecture, segmentation strategy, security boundaries, and intended traffic flows for the WoogleNet environment.

The goals of the VLAN design are:

- Network segmentation
- Improved security
- Reduced broadcast traffic
- Simplified management
- Service isolation
- Future scalability

This document should be reviewed before making changes to VLAN assignments, wireless networks, or firewall rules.

---

# Design Principles

## Core Principles

1. Infrastructure is isolated from user devices.
2. Trusted devices can access internal services.
3. IoT devices are restricted by default.
4. Guest devices receive internet access only.
5. Explicit allow rules are preferred over implicit trust.
6. Tailscale is the primary remote access method.
7. New VLANs should only be created when a documented requirement exists.

---

# VLAN Summary

| VLAN | Name | Subnet | Gateway | DHCP | Purpose |
|--------|--------|--------|--------|--------|--------|
| 10 | Infrastructure | 10.0.10.0/24 | 10.0.10.1 | No | Network and Server Management |
| 20 | Trusted | 10.0.20.0/24 | 10.0.20.1 | Yes | User Devices and Services |
| 30 | IoT | 10.0.30.0/24 | 10.0.30.1 | Yes | Smart Home and IoT Devices |
| 40 | Guest | 10.0.40.0/24 | 10.0.40.1 | Yes | Guest Internet Access |

---

# VLAN 10 - Infrastructure

## Purpose

The Infrastructure VLAN contains devices responsible for managing and operating the environment.

Users should not normally reside within this VLAN.

---

## Devices

### Network Infrastructure

- UDM-Pro
- TP-Link Switches
- Access Points

### Compute Infrastructure

- DAX
- MAX
- PAX
- JAX

### Storage Infrastructure

- OpenMediaVault

### Core Services

- AdGuard Home Primary
- AdGuard Home Secondary
- Homepage
- Uptime Kuma

---

## Network Details

| Property | Value |
|-----------|----------|
| VLAN ID | 10 |
| Subnet | 10.0.10.0/24 |
| Gateway | 10.0.10.1 |
| DHCP | Disabled |
| DNS | AdGuard HA Pair |

---

## Security Policy

| Source | Action |
|----------|----------|
| Infrastructure → Any Internal VLAN | Allow |
| Trusted → Infrastructure | Allow |
| IoT → Infrastructure | Deny |
| Guest → Infrastructure | Deny |

---

# VLAN 20 - Trusted

## Purpose

The Trusted VLAN contains all approved personal devices.

This is the primary user network.

---

## Device Types

### Wired Devices

- Desktops
- Workstations
- Servers requiring user access

### Wireless Devices

- Phones
- Tablets
- Laptops

### Media Devices

- Media Streamers
- Smart TVs
- Audio Devices

### Family Devices

- Approved family-owned devices

---

## Network Details

| Property | Value |
|-----------|----------|
| VLAN ID | 20 |
| Subnet | 10.0.20.0/24 |
| Gateway | 10.0.20.1 |
| DHCP | Enabled |

---

## Approved Service Access

Trusted devices are allowed access to:

- Plex
- Immich
- Audiobookshelf
- Vaultwarden
- Nextcloud
- Paperless-ngx
- Home Assistant
- BookStack
- Homepage
- Uptime Kuma
- DNS Services
- Storage Services

---

## Security Policy

| Source | Action |
|----------|----------|
| Trusted → Infrastructure | Allow |
| Trusted → Trusted | Allow |
| Trusted → IoT | Restricted |
| Trusted → Guest | Deny |
| Trusted → Internet | Allow |

---

# VLAN 30 - IoT

## Purpose

The IoT VLAN contains devices that should not have unrestricted access to the internal network.

Devices in this VLAN are assumed to be less trusted and are isolated accordingly.

---

## Device Types

- Smart Switches
- Smart Plugs
- Smart Lights
- Sensors
- Appliances
- Smart Displays
- Future Cameras
- Other Embedded Devices

---

## Network Details

| Property | Value |
|-----------|----------|
| VLAN ID | 30 |
| Subnet | 10.0.30.0/24 |
| Gateway | 10.0.30.1 |
| DHCP | Enabled |

---

## Security Policy

Default behavior:

```text
IoT → Internet            Allow
IoT → Infrastructure      Deny
IoT → Trusted             Deny
IoT → Guest               Deny
```

---

## Home Assistant Exception

The only planned exception is for Home Assistant.

Example:

```text
Home Assistant
    →
Approved IoT Devices
```

All other traffic should remain denied.

---

# VLAN 40 - Guest

## Purpose

The Guest VLAN provides internet access for visitors and temporary devices.

No access to internal services is permitted.

---

## Device Types

- Guest Phones
- Guest Tablets
- Guest Laptops
- Temporary Devices

---

## Network Details

| Property | Value |
|-----------|----------|
| VLAN ID | 40 |
| Subnet | 10.0.40.0/24 |
| Gateway | 10.0.40.1 |
| DHCP | Enabled |

---

## Security Policy

```text
Guest → Internet           Allow

Guest → Infrastructure     Deny
Guest → Trusted            Deny
Guest → IoT                Deny
```

---

# Wireless Network Mapping

| SSID | VLAN | Purpose |
|----------|----------|----------|
| WoogleNet | 20 | Trusted Devices |
| WoogleNet-IoT | 30 | IoT Devices |
| WoogleNet-Guest | 40 | Guest Devices |

---

# DHCP Strategy

## Infrastructure

```text
No DHCP
Static Assignments Only
```

---

## Trusted

```text
DHCP Enabled
10.0.20.100 - 10.0.20.249
```

---

## IoT

```text
DHCP Enabled
10.0.30.100 - 10.0.30.249
```

---

## Guest

```text
DHCP Enabled
10.0.40.100 - 10.0.40.249
```

---

# DNS Strategy

## Primary DNS

```text
10.0.10.50
AdGuard Primary
```

---

## Secondary DNS

```text
10.0.10.51
AdGuard Secondary
```

---

## DNS Assignment

All VLANs should receive:

| DNS Server | Address |
|------------|----------|
| Primary | 10.0.10.50 |
| Secondary | 10.0.10.51 |

---

# Inter-VLAN Policy Matrix

| Source | Infrastructure | Trusted | IoT | Guest | Internet |
|----------|----------|----------|----------|----------|----------|
| Infrastructure | Allow | Allow | Allow | Deny | Allow |
| Trusted | Allow | Allow | Limited | Deny | Allow |
| IoT | Deny | Deny | Allow | Deny | Allow |
| Guest | Deny | Deny | Deny | Allow | Allow |

---

# Future VLANs

No additional VLANs are currently required.

Potential future VLANs may include:

| VLAN | Purpose | Status |
|--------|--------|--------|
| Cameras | Camera Isolation | Not Approved |
| Lab | Testing Environment | Not Approved |
| Servers | Dedicated Server Network | Not Approved |

Additional VLANs should only be created when supported by documented requirements.

---

# Open Decisions

| Item | Status |
|----------|----------|
| Camera VLAN | Deferred |
| IPv6 Segmentation | TBD |
| Future VLAN Expansion | TBD |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial VLAN Plan |