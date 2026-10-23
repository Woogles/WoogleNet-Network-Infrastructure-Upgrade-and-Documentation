# Firewall Rules

## Purpose

This document defines the firewall policies for the WoogleNet environment.

The goals of these rules are:

- Protect infrastructure systems
- Limit unnecessary lateral movement
- Isolate IoT devices
- Restrict guest access
- Preserve service functionality
- Maintain simple administration

These rules should be implemented on the UDM-Pro.

---

# Design Principles

## Default Security Model

```text
Allow what is required
Block what is not required
```

## Security Priorities

1. Infrastructure Protection
2. Service Availability
3. IoT Isolation
4. Guest Isolation
5. Ease of Management

---

# Network Zones

| VLAN | Name | Trust Level |
|--------|--------|--------|
| 10 | Infrastructure | High |
| 20 | Trusted | High |
| 30 | IoT | Low |
| 40 | Guest | Untrusted |
| WAN | Internet | Untrusted |

---

# Rule Processing Order

Firewall rules should be processed in this order:

```text
1. Infrastructure Protection
2. DNS Rules
3. Home Assistant Exceptions
4. Trusted Network Rules
5. IoT Restrictions
6. Guest Restrictions
7. Internet Access Rules
```

---

# Infrastructure Protection Rules

## Rule INF-001

| Property | Value |
|------------|------------|
| Name | Block IoT to Infrastructure |
| Source | VLAN 30 IoT |
| Destination | VLAN 10 Infrastructure |
| Protocol | Any |
| Action | Deny |

### Purpose

Prevent IoT devices from reaching infrastructure systems.

---

## Rule INF-002

| Property | Value |
|------------|------------|
| Name | Block Guest to Infrastructure |
| Source | VLAN 40 Guest |
| Destination | VLAN 10 Infrastructure |
| Protocol | Any |
| Action | Deny |

### Purpose

Prevent guest devices from reaching infrastructure systems.

---

## Rule INF-003

| Property | Value |
|------------|------------|
| Name | Allow Trusted to Infrastructure |
| Source | VLAN 20 Trusted |
| Destination | VLAN 10 Infrastructure |
| Protocol | Any |
| Action | Allow |

### Purpose

Allow management and service access.

---

# DNS Rules

## Rule DNS-001

| Property | Value |
|------------|------------|
| Name | Allow DNS to AdGuard |
| Source | Internal Networks |
| Destination | AdGuard Primary |
| Ports | TCP/UDP 53 |
| Action | Allow |

---

## Rule DNS-002

| Property | Value |
|------------|------------|
| Name | Allow DNS to AdGuard Secondary |
| Source | Internal Networks |
| Destination | AdGuard Secondary |
| Ports | TCP/UDP 53 |
| Action | Allow |

---

## Rule DNS-003

| Property | Value |
|------------|------------|
| Name | Block Direct DNS |
| Source | Internal Networks |
| Destination | Any |
| Ports | TCP/UDP 53 |
| Action | Deny |

### Notes

Enable only after AdGuard validation.

---

# Trusted Network Rules

## Rule TRUST-001

| Property | Value |
|------------|------------|
| Name | Trusted to Internet |
| Source | VLAN 20 |
| Destination | WAN |
| Action | Allow |

---

## Rule TRUST-002

| Property | Value |
|------------|------------|
| Name | Trusted to Services |
| Source | VLAN 20 |
| Destination | Approved Services |
| Action | Allow |

### Approved Services

- Plex
- Immich
- Audiobookshelf
- Vaultwarden
- Nextcloud
- Paperless-ngx
- BookStack
- Homepage
- Uptime Kuma
- Home Assistant

---

## Rule TRUST-003

| Property | Value |
|------------|------------|
| Name | Trusted to IoT |
| Source | VLAN 20 |
| Destination | VLAN 30 |
| Action | Deny |

### Notes

Exceptions should be created only when required.

---

# IoT Rules

## Rule IOT-001

| Property | Value |
|------------|------------|
| Name | IoT Internet Access |
| Source | VLAN 30 |
| Destination | WAN |
| Action | Allow |

---

## Rule IOT-002

| Property | Value |
|------------|------------|
| Name | IoT to Trusted |
| Source | VLAN 30 |
| Destination | VLAN 20 |
| Action | Deny |

---

## Rule IOT-003

| Property | Value |
|------------|------------|
| Name | IoT to Infrastructure |
| Source | VLAN 30 |
| Destination | VLAN 10 |
| Action | Deny |

---

## Rule IOT-004

| Property | Value |
|------------|------------|
| Name | IoT to Guest |
| Source | VLAN 30 |
| Destination | VLAN 40 |
| Action | Deny |

---

# Home Assistant Exceptions

## Rule HA-001

| Property | Value |
|------------|------------|
| Name | Home Assistant to IoT |
| Source | Home Assistant |
| Destination | Approved IoT Devices |
| Action | Allow |

---

## Rule HA-002

| Property | Value |
|------------|------------|
| Name | IoT Return Traffic |
| Source | Approved IoT Devices |
| Destination | Home Assistant |
| Action | Allow Established/Related |

---

# Guest Rules

## Rule GUEST-001

| Property | Value |
|------------|------------|
| Name | Guest Internet Access |
| Source | VLAN 40 |
| Destination | WAN |
| Action | Allow |

---

## Rule GUEST-002

| Property | Value |
|------------|------------|
| Name | Guest to Infrastructure |
| Source | VLAN 40 |
| Destination | VLAN 10 |
| Action | Deny |

---

## Rule GUEST-003

| Property | Value |
|------------|------------|
| Name | Guest to Trusted |
| Source | VLAN 40 |
| Destination | VLAN 20 |
| Action | Deny |

---

## Rule GUEST-004

| Property | Value |
|------------|------------|
| Name | Guest to IoT |
| Source | VLAN 40 |
| Destination | VLAN 30 |
| Action | Deny |

---

# Remote Access Rules

## Rule VPN-001

| Property | Value |
|------------|------------|
| Name | Tailscale Access |
| Source | Tailscale |
| Destination | Approved Internal Services |
| Action | Allow |

### Approved Services

- Homepage
- Uptime Kuma
- Vaultwarden
- Nextcloud
- Paperless-ngx
- Home Assistant
- Immich
- Audiobookshelf
- BookStack

---

## Rule VPN-002

| Property | Value |
|------------|------------|
| Name | Administrative Access |
| Source | Tailscale Admin Devices |
| Destination | Infrastructure Services |
| Action | Allow |

---

# Public Access Rules

## Current Approved Exposure

| Service | Public Access |
|----------|----------|
| Plex | Yes |
| Everything Else | No |

---

## Rule WAN-001

| Property | Value |
|------------|------------|
| Name | Plex Access |
| Source | WAN |
| Destination | Plex |
| Action | Allow |

### Notes

Use Plex's native remote access functionality whenever practical.

---

## Rule WAN-002

| Property | Value |
|------------|------------|
| Name | Block Management Services |
| Source | WAN |
| Destination | Infrastructure |
| Action | Deny |

### Protected Services

- UDM-Pro
- AdGuard Home
- Homepage
- Uptime Kuma
- Vaultwarden
- Home Assistant
- OpenMediaVault
- Proxmox

---

# Service Access Matrix

| Service | Trusted | IoT | Guest | Tailscale | Internet |
|------------|------------|------------|------------|------------|------------|
| Plex | Yes | No | No | Yes | Yes |
| Immich | Yes | No | No | Yes | No |
| Audiobookshelf | Yes | No | No | Yes | No |
| Vaultwarden | Yes | No | No | Yes | No |
| Homepage | Yes | No | No | Yes | No |
| Uptime Kuma | Yes | No | No | Yes | No |
| Home Assistant | Yes | No | No | Yes | No |
| Nextcloud | Yes | No | No | Yes | No |
| Paperless | Yes | No | No | Yes | No |
| BookStack | Yes | No | No | Yes | No |

---

# Administrative Access

## Approved Management Sources

- Trusted Network
- Tailscale Administrative Devices

---

## Approved Management Targets

- UDM-Pro
- TP-Link Switches
- Access Points
- Proxmox Hosts
- OpenMediaVault
- Infrastructure Services

---

# Logging

All firewall events should log:

- Rule Name
- Source Address
- Destination Address
- Port
- Protocol
- Timestamp

---

# Future Considerations

| Item | Status |
|----------|----------|
| Camera VLAN | Deferred |
| Dedicated Management VLAN | Not Required |
| Dedicated Server VLAN | Not Required |
| IDS/IPS Tuning | TBD |
| GeoIP Filtering | TBD |
| IPv6 Security Rules | TBD |

---

# Validation Checklist

Before production rollout:

- [ ] Trusted devices access all required services
- [ ] IoT devices cannot reach Infrastructure VLAN
- [ ] IoT devices cannot reach Trusted VLAN
- [ ] Guest devices have internet access only
- [ ] Home Assistant communicates with approved IoT devices
- [ ] AdGuard redundancy validated
- [ ] Tailscale access validated
- [ ] Plex remote access validated
- [ ] Infrastructure management reachable from Trusted VLAN
- [ ] Firewall logs reviewed

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Firewall Rules |
