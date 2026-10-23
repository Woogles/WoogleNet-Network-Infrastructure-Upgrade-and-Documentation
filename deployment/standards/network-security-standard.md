# Network Security Standard

## Purpose

This document defines the network security architecture and access control standards for the WoogleNet environment.

The goals of this standard are to:

- Enforce network segmentation
- Protect infrastructure services
- Restrict lateral movement
- Define trusted communication paths
- Standardize firewall implementation
- Support Zero Trust principles

All deployments must comply with this standard unless an approved exception is documented in:

```text
SERVICE-DECISIONS.md
```

---

# Security Model

## Trust Hierarchy

```text
Infrastructure
       ▲
       │
Trusted
       │
       ▼
      IoT

       ▼

     Guest
```

---

## Design Principles

### Principle 1

Infrastructure is protected.

---

### Principle 2

Administrative access is restricted.

---

### Principle 3

IoT devices are isolated.

---

### Principle 4

Guest devices are isolated.

---

### Principle 5

All communication must be explicitly allowed.

---

### Principle 6

Public exposure is minimized.

---

# Network Zones

## VLAN 10

### Infrastructure

Purpose:

```text
Servers
Storage
Management
Monitoring
DNS
```

Network:

```text
10.0.10.0/24
```

Gateway:

```text
10.0.10.1
```

Trust Level:

```text
Highest
```

---

## VLAN 20

### Trusted

Purpose:

```text
Family Devices
Administrative Devices
Workstations
Laptops
Phones
```

Network:

```text
10.0.20.0/24
```

Gateway:

```text
10.0.20.1
```

Trust Level:

```text
High
```

---

## VLAN 30

### IoT

Purpose:

```text
Smart TVs
Home Automation
Streaming Devices
Sensors
Speakers
```

Network:

```text
10.0.30.0/24
```

Gateway:

```text
10.0.30.1
```

Trust Level:

```text
Low
```

---

## VLAN 40

### Guest

Purpose:

```text
Visitors
Temporary Devices
Unknown Devices
```

Network:

```text
10.0.40.0/24
```

Gateway:

```text
10.0.40.1
```

Trust Level:

```text
Untrusted
```

---

# Administrative Access Policy

## Approved Sources

Administrative access is permitted only from:

### Infrastructure VLAN

```text
10.0.10.0/24
```

---

### Trusted VLAN

```text
10.0.20.0/24
```

---

### Tailscale

```text
Approved Tailnet Devices
```

---

## Administrative Targets

Examples:

```text
UDM-Pro

Switches

Access Points

Proxmox

OpenMediaVault

AdGuard

Homepage

Uptime Kuma

Vaultwarden

Home Assistant
```

---

## Prohibited Sources

### IoT VLAN

```text
10.0.30.0/24
```

---

### Guest VLAN

```text
10.0.40.0/24
```

---

# Service Placement Standard

## Infrastructure VLAN

Only the following should exist in VLAN 10:

### Hosts

```text
DAX
MAX
PAX
JAX
```

---

### Infrastructure Services

```text
AdGuard

Homepage

Uptime Kuma

OpenMediaVault

Vaultwarden

Home Assistant
```

---

### Future Services

Documented exceptions only.

---

# East-West Traffic Policy

## Trusted → Infrastructure

```text
Allow
```

Purpose:

```text
Administration
```

---

## Infrastructure → Trusted

```text
Allow
```

When Required.

---

## Trusted → IoT

```text
Allow
```

Purpose:

```text
Management
Media Streaming
Device Control
```

---

## IoT → Trusted

```text
Deny
```

---

## IoT → Infrastructure

```text
Deny
```

except approved services.

---

## Guest → Internal Networks

```text
Deny
```

---

## Guest → Internet

```text
Allow
```

---

# DNS Security Standard

## Authoritative Internal DNS

Primary:

```text
10.0.10.50
```

---

Secondary:

```text
10.0.10.51
```

---

## Client DNS

All VLANs should use:

```text
10.0.10.50

10.0.10.51
```

---

## External DNS Bypass

Preferred:

```text
Blocked
```

when operationally practical.

---

# Home Assistant Exception

## Required Access

Home Assistant must be permitted to communicate with:

```text
IoT VLAN
```

for:

- Discovery
- Automation
- Device Control

---

## Scope

Access should be limited to required ports and protocols whenever practical.

---

# Remote Access Standard

## Approved Method

Primary:

```text
Tailscale
```

---

## Direct Internet Exposure

Avoid whenever possible.

---

## Administrative Services

Public exposure:

```text
Prohibited
```

for:

- Proxmox
- OpenMediaVault
- AdGuard
- Vaultwarden
- Home Assistant

---

# Public Exposure Policy

## Approved Public Services

Current Exception:

```text
Plex
```

---

## Future Public Services

Require:

- Documented Justification
- Security Review
- Monitoring
- Backup Validation

---

# Firewall Standard

## Default Behavior

```text
Deny
```

unless explicitly allowed.

---

## Required Rule Categories

### Management

Administrative Access

---

### Infrastructure Protection

Infrastructure Isolation

---

### IoT Isolation

IoT Restrictions

---

### Guest Isolation

Guest Restrictions

---

### Service Exceptions

Approved Communication Paths

---

# Port Exposure Standard

## Expose Only Required Ports

Examples:

### DNS

```text
53/TCP
53/UDP
```

---

### HTTPS

```text
443/TCP
```

---

### HTTP

```text
80/TCP
```

Only when required.

---

## Disable Unused Services

Required:

```text
Yes
```

---

# Monitoring Requirements

Monitor:

### Infrastructure

- DAX
- MAX
- PAX
- JAX

---

### Network

- DNS Availability
- Gateway Availability
- Internet Reachability

---

### Security

- Authentication Failures
- Service Failures
- DNS Outages

---

# Security Validation

## Trusted VLAN

Verify:

- [ ] Infrastructure Access Works
- [ ] Internet Access Works

---

## IoT VLAN

Verify:

- [ ] Internet Works
- [ ] Trusted Access Blocked
- [ ] Infrastructure Access Blocked

---

## Guest VLAN

Verify:

- [ ] Internet Works
- [ ] Internal Access Blocked

---

## Infrastructure

Verify:

- [ ] Administrative Access Restricted
- [ ] Monitoring Functional

---

# Security Review Schedule

## Quarterly

Review:

- Firewall Rules
- VLAN Design
- Access Policies
- Public Exposure

---

## Annual

Review:

- Security Baseline
- Threat Model
- Remote Access Architecture

---

# Exceptions

All network security exceptions must document:

- Reason
- Risk
- Mitigation
- Review Date

Location:

```text
SERVICE-DECISIONS.md
```

---

# Compliance Checklist

Applies To All Deployments

- [ ] VLAN Placement Reviewed
- [ ] Firewall Rules Reviewed
- [ ] Access Paths Approved
- [ ] Tailscale Configured
- [ ] Public Exposure Reviewed
- [ ] Monitoring Configured

---

# Related Standards

- proxmox-standard.md
- lxc-standard.md
- vm-standard.md
- service-hardening-standard.md
- backup-standard.md
- monitoring-standard.md
- VLAN-PLAN.md
- FIREWALL-RULES.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Network Security Standard |