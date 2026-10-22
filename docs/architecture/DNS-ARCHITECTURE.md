# DNS Architecture

## Purpose

This document defines the Domain Name System (DNS) architecture for the WoogleNet environment.

The goals of the DNS platform are:

- Provide reliable name resolution
- Improve client performance
- Block unwanted content
- Simplify service access
- Support local service discovery
- Provide DNS redundancy
- Support future expansion

This document should be updated whenever DNS servers, hostnames, domains, or service locations change.

---

# DNS Design Principles

## Core Principles

1. DNS should remain highly available.
2. Local services should be addressable by name.
3. Clients should never require static DNS entries.
4. DNS filtering should be centralized.
5. Redundancy should exist whenever practical.
6. DNS failures should be highly visible.
7. DNS should remain simple to troubleshoot.

---

# DNS Architecture Overview

## Design

```text
Client
   │
   ▼
AdGuard Primary
   │
   ▼
Upstream DNS

Failover

Client
   │
   ▼
AdGuard Secondary
   │
   ▼
Upstream DNS
```

---

# DNS Infrastructure

## AdGuard Primary

| Property | Value |
|-----------|----------|
| Host | DAX |
| Platform | LXC |
| IP Address | 10.0.10.50 |
| Role | Primary DNS |
| VLAN | Infrastructure |

---

## AdGuard Secondary

| Property | Value |
|-----------|----------|
| Host | MAX |
| Platform | LXC |
| IP Address | 10.0.10.51 |
| Role | Secondary DNS |
| VLAN | Infrastructure |

---

# Client DNS Assignment

## Primary DNS

```text
10.0.10.50
```

---

## Secondary DNS

```text
10.0.10.51
```

---

## Assigned To

- Infrastructure VLAN
- Trusted VLAN
- IoT VLAN
- Guest VLAN

---

# DHCP Integration

## DNS Distribution

The UDM-Pro is responsible for DHCP.

DHCP should distribute:

```text
Primary DNS
10.0.10.50

Secondary DNS
10.0.10.51
```

---

## DHCP Role

```text
UDM-Pro
```

### Responsibilities

- DHCP Services
- DNS Server Distribution
- Gateway Distribution

---

# Upstream DNS

## Preferred Resolver

```text
Quad9
```

---

## Secondary Resolver

```text
Cloudflare
```

---

## Future Alternatives

- Quad9
- Cloudflare
- Google DNS
- OpenDNS

---

# Internal DNS Namespace

## Local Domain

Recommended:

```text
wooglenet.internal
```

Status:

```text
Proposed
```

---

## Service Naming Standard

Format:

```text
service.wooglenet.internal
```

---

# Infrastructure Hostnames

| Host | DNS Name |
|----------|----------|
| UDM-Pro | udm.wooglenet.internal |
| DAX | dax.wooglenet.internal |
| MAX | max.wooglenet.internal |
| PAX | pax.wooglenet.internal |
| JAX | jax.wooglenet.internal |

---

# Infrastructure Services

| Service | DNS Name |
|----------|----------|
| AdGuard Primary | dns1.wooglenet.internal |
| AdGuard Secondary | dns2.wooglenet.internal |
| Homepage | homepage.wooglenet.internal |
| Uptime Kuma | uptime.wooglenet.internal |
| OpenMediaVault | omv.wooglenet.internal |

---

# Day 1 Service Records

| Service | DNS Name |
|----------|----------|
| Plex | plex.wooglenet.internal |
| Immich | immich.wooglenet.internal |
| Audiobookshelf | audiobooks.wooglenet.internal |

---

# Day 2 Service Records

| Service | DNS Name |
|----------|----------|
| Home Assistant | homeassistant.wooglenet.internal |
| Vaultwarden | vaultwarden.wooglenet.internal |
| Navidrome | navidrome.wooglenet.internal |
| Stirling-PDF | pdf.wooglenet.internal |
| MeTube | metube.wooglenet.internal |
| Tautulli | tautulli.wooglenet.internal |

---

# ARR Stack Records

| Service | DNS Name |
|----------|----------|
| qBittorrent | qbittorrent.wooglenet.internal |
| Prowlarr | prowlarr.wooglenet.internal |
| Sonarr | sonarr.wooglenet.internal |
| Radarr | radarr.wooglenet.internal |
| Lidarr | lidarr.wooglenet.internal |
| Readarr | readarr.wooglenet.internal |
| Bazarr | bazarr.wooglenet.internal |
| Overseerr | overseerr.wooglenet.internal |

---

# Day 4 Service Records

| Service | DNS Name |
|----------|----------|
| Paperless | paperless.wooglenet.internal |
| Nextcloud | nextcloud.wooglenet.internal |
| Syncthing | syncthing.wooglenet.internal |
| BookStack | bookstack.wooglenet.internal |

---

# DNS Filtering

## Platform

```text
AdGuard Home
```

---

## Objectives

- Block Ads
- Block Malware
- Block Tracking Domains
- Provide Safe DNS Resolution

---

## Scope

Applied To:

- Trusted VLAN
- IoT VLAN
- Guest VLAN

---

# DNS Redundancy

## Failover Design

```text
Primary DNS
    ↓
AdGuard Primary

Secondary DNS
    ↓
AdGuard Secondary
```

---

## Failure Scenarios

### AdGuard Primary Failure

Result:

```text
Clients Use Secondary DNS
```

Expected Impact:

```text
Minimal
```

---

### AdGuard Secondary Failure

Result:

```text
Clients Use Primary DNS
```

Expected Impact:

```text
Minimal
```

---

### Complete DNS Failure

Affected Services:

- Immich
- Plex
- Vaultwarden
- Nextcloud
- Home Assistant
- Paperless
- BookStack

Severity:

```text
High
```

Reference:

```text
DISASTER-RECOVERY.md
```

---

# Monitoring Requirements

## Monitor

### AdGuard Primary

Checks:

- Ping
- HTTP
- DNS Resolution

---

### AdGuard Secondary

Checks:

- Ping
- HTTP
- DNS Resolution

---

### Test Records

Examples:

```text
google.com
github.com
microsoft.com
```

---

# DNS Security

## Direct DNS

Policy:

```text
Blocked
```

when practical.

---

## DNS Source

All clients should use:

```text
AdGuard Primary
AdGuard Secondary
```

---

## DNS Administration

Allowed From:

- Infrastructure VLAN
- Trusted VLAN
- Tailscale

---

# Remote Access DNS

## Tailscale

Primary Remote Access Method.

Remote users should access services using:

```text
Tailscale Connectivity
```

before local DNS becomes a dependency.

---

# Recovery Procedures

## DNS Failure

### Step 1

Determine:

```text
Primary
or
Secondary
```

failure.

---

### Step 2

Verify:

- Network
- Host Availability
- AdGuard Availability

---

### Step 3

Restore affected service.

---

### Step 4

Validate:

- Local Resolution
- Internet Resolution
- Client Connectivity

---

# Future Enhancements

## Possible Enhancements

- DNS-over-HTTPS
- DNS-over-TLS
- Conditional Forwarders
- Split DNS
- DNS Analytics
- DNS Event Correlation

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Internal Domain Selection | Proposed |
| DNS-over-HTTPS | Future Review |
| Split DNS | Future Review |
| Conditional Forwarding | Future Review |
| Advanced DNS Logging | Future Review |

---

# DNS Validation Checklist

- [ ] AdGuard Primary Operational
- [ ] AdGuard Secondary Operational
- [ ] DHCP Distributing DNS
- [ ] Local Hostnames Resolve
- [ ] Service Hostnames Resolve
- [ ] DNS Failover Tested
- [ ] Uptime Kuma Monitoring DNS
- [ ] Clients Using Approved DNS Servers

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial DNS Architecture |