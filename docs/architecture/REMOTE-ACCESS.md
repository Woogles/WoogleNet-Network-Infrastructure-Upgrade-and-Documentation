# Remote Access

## Purpose

This document defines the remote access architecture, standards, approved access methods, and security requirements for the WoogleNet environment.

The goals of the remote access platform are:

- Secure remote administration
- Secure family access
- Eliminate unnecessary public exposure
- Simplify access to internal services
- Reduce firewall complexity
- Support future growth

This document should be updated whenever remote access mechanisms or exposed services change.

---

# Remote Access Philosophy

## Core Principles

1. Private access is preferred over public exposure.
2. Tailscale is the primary remote access platform.
3. Administrative interfaces should not be internet accessible.
4. MFA should protect critical remote access systems.
5. Services should remain accessible without port forwarding whenever possible.
6. Public exposure should be minimized.

---

# Approved Access Methods

## Priority Order

### 1. Local Network

```text
Preferred
```

Used when connected to the Trusted VLAN.

---

### 2. Tailscale

```text
Primary Remote Method
```

Used when remote.

---

### 3. Physical Console

```text
Emergency Access
```

Used during recovery or major outages.

---

# Tailscale Architecture

## Purpose

Tailscale provides:

- Remote administration
- Secure service access
- Encrypted connectivity
- Simplified access control

---

## Installation Policy

Tailscale should be installed on:

### Infrastructure Hosts

- DAX
- MAX
- PAX
- JAX

---

### Virtual Machines

- OpenMediaVault
- Home Assistant

---

### Containers

Where practical and beneficial.

---

## Administrative Devices

### Primary Administrator Devices

- Desktop Systems
- Laptops
- Phones
- Tablets

---

# Tailscale Protected Services

The following services should be accessible through Tailscale.

## Infrastructure

- Proxmox
- OpenMediaVault
- AdGuard
- Homepage
- Uptime Kuma

---

## Family Services

- Immich
- Vaultwarden
- Audiobookshelf

---

## Knowledge Services

- Paperless-ngx
- Nextcloud
- BookStack
- Syncthing

---

## Automation Services

- Home Assistant

---

# Administrative Access

## Approved Sources

Administrative access is allowed from:

- Trusted VLAN
- Tailscale Network
- Physical Console

---

## Approved Administrative Targets

### Network Infrastructure

- UDM-Pro
- TP-Link Switches
- Access Points

---

### Compute Systems

- DAX
- MAX
- PAX
- JAX

---

### Platform Services

- OpenMediaVault
- AdGuard
- Homepage
- Uptime Kuma

---

# Public Access Policy

## Approved Internet-Facing Services

### Plex

Status:

```text
Approved
```

Purpose:

Family remote media access.

---

## All Other Services

Status:

```text
Not Approved
```

Access Method:

```text
Tailscale
```

---

# Service Access Matrix

| Service | Local | Tailscale | Internet |
|----------|----------|----------|----------|
| Plex | Yes | Yes | Yes |
| Immich | Yes | Yes | No |
| Vaultwarden | Yes | Yes | No |
| Audiobookshelf | Yes | Yes | No |
| Home Assistant | Yes | Yes | No |
| Nextcloud | Yes | Yes | No |
| Paperless | Yes | Yes | No |
| BookStack | Yes | Yes | No |
| Homepage | Yes | Yes | No |
| Uptime Kuma | Yes | Yes | No |
| OpenMediaVault | Yes | Yes | No |
| Proxmox | Yes | Yes | No |

---

# Family Access

## Plex

Approved Users

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

## Audiobookshelf

Approved Users

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

## Immich

Approved Users

- Eric
- Beth
- Amara

---

## Vaultwarden

Approved Users

- Eric
- Beth
- Amara

---

# Authentication Requirements

## MFA Required

### Services

- Tailscale
- Vaultwarden
- Home Assistant

---

## MFA Optional

### Services

- Immich
- Nextcloud

---

# Remote Administration Standards

## Proxmox

Access:

```text
Trusted VLAN
Tailscale
Physical Console
```

---

## OpenMediaVault

Access:

```text
Trusted VLAN
Tailscale
Physical Console
```

---

## UDM-Pro

Access:

```text
Trusted VLAN
Tailscale
Physical Console
```

---

# Emergency Access Procedures

## Tailscale Failure

### Access Order

1. Local Network
2. Physical Console

---

## DNS Failure

### Access Method

Continue using:

```text
Tailscale IPs
```

until DNS is restored.

---

## UDM-Pro Failure

### Recovery Device

```text
USG Pro
```

Procedure:

1. Deploy USG Pro.
2. Restore configuration.
3. Restore routing.
4. Restore remote access.

Reference:

```text
DISASTER-RECOVERY.md
```

---

# Device Enrollment Standards

## Administrator Devices

Requirements:

- Screen Lock Enabled
- Software Updates Enabled
- MFA Enabled
- Tailscale Installed

---

## Family Devices

Recommended:

- Tailscale Installed
- Device Locked
- OS Updated

---

# Security Requirements

## Prohibited

The following are not permitted:

- Direct Internet access to Proxmox
- Direct Internet access to OMV
- Direct Internet access to Vaultwarden
- Direct Internet access to Home Assistant
- Direct Internet access to DNS infrastructure

---

## Remote Access Logging

When supported, log:

- User Authentication
- Device Enrollment
- Access Failures
- Administrative Access

---

# Monitoring Requirements

Monitor:

- Tailscale Connectivity
- Tailscale Node Availability
- Plex Remote Access
- Critical Service Availability

Reference:

```text
MONITORING-AND-ALERTING.md
```

---

# Recovery Considerations

If remote access fails:

1. Verify Internet connectivity.
2. Verify DNS functionality.
3. Verify Tailscale connectivity.
4. Verify endpoint availability.
5. Fall back to local or console access.

Reference:

```text
DISASTER-RECOVERY.md
```

---

# Future Enhancements

## Under Evaluation

- Tailscale ACLs
- Device Tags
- Exit Nodes
- Funnel
- Tailnet Lock

Status:

```text
Future Review
```

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Tailscale ACL Strategy | Future Review |
| Tailnet Lock | Future Review |
| Exit Node Deployment | Future Review |
| Mobile Device Enrollment Standards | Future Review |

---

# Validation Checklist

- [ ] Tailscale Installed On DAX
- [ ] Tailscale Installed On MAX
- [ ] Tailscale Installed On PAX
- [ ] Tailscale Installed On JAX
- [ ] Tailscale Installed On Home Assistant
- [ ] Tailscale Installed On OMV
- [ ] MFA Enabled On Tailscale
- [ ] Plex Remote Access Functional
- [ ] Administrative Access Validated
- [ ] Family Service Access Validated

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Remote Access Architecture |