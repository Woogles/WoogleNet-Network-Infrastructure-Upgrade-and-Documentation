# Sprint 03 - Core Infrastructure

## Sprint Information

| Property | Value |
|----------|----------|
| Sprint ID | Sprint 03 |
| Name | Core Infrastructure |
| Status | Planned |
| Priority | Critical |
| Estimated Duration | 1 Week |
| Owner | Eric Yacoub |

---

# Sprint Goal

Deploy the core infrastructure services that support the entire WoogleNet environment.

This sprint establishes:

- High-availability DNS
- Monitoring
- Alerting
- Dashboard Services
- Secure Remote Access
- Core Management Platform

At completion, WoogleNet becomes an operational environment capable of supporting storage and application deployments.

---

# Success Criteria

Sprint 03 is complete when:

- AdGuard Primary is operational
- AdGuard Secondary is operational
- DNS failover is validated
- Homepage is operational
- Uptime Kuma is operational
- Tailscale is fully integrated
- Monitoring and alerting are functional
- All infrastructure services are documented

---

# Prerequisites

## Required Sprint Completion

- [ ] Sprint 00 Complete
- [ ] Sprint 01 Complete
- [ ] Sprint 02 Complete

---

## Required Documentation

- CORE-INFRASTRUCTURE.md
- DNS-ARCHITECTURE.md
- REMOTE-ACCESS.md
- MONITORING-AND-ALERTING.md
- SECURITY-BASELINE.md
- SERVICE-DEPENDENCIES.md

---

# Phase 1 - AdGuard Primary Deployment

## Platform

| Property | Value |
|----------|----------|
| Host | DAX |
| Platform | LXC |
| Role | Primary DNS |

---

## Installation

- [ ] Create LXC Container
- [ ] Configure Networking
- [ ] Configure Static IP

### IP Assignment

```text
10.0.10.50
```

---

## AdGuard Configuration

- [ ] Install AdGuard Home
- [ ] Configure Web Interface
- [ ] Configure Admin Account
- [ ] Configure DNS Service

---

## Upstream Resolvers

Primary:

```text
Quad9
```

Secondary:

```text
Cloudflare
```

---

## Validation

- [ ] DNS Resolution Functional
- [ ] Web UI Accessible
- [ ] Client Query Testing Successful

---

# Phase 2 - AdGuard Secondary Deployment

## Platform

| Property | Value |
|----------|----------|
| Host | MAX |
| Platform | LXC |
| Role | Secondary DNS |

---

## Installation

- [ ] Create LXC Container
- [ ] Configure Networking
- [ ] Configure Static IP

### IP Assignment

```text
10.0.10.51
```

---

## Configuration

- [ ] Install AdGuard Home
- [ ] Match Primary Configuration
- [ ] Configure DNS Service

---

## Validation

- [ ] DNS Resolution Functional
- [ ] Administrative Access Verified
- [ ] Independent Query Testing Successful

---

# Phase 3 - DNS Validation

## Client Testing

Verify From:

- [ ] Trusted VLAN
- [ ] IoT VLAN
- [ ] Guest VLAN

---

## Resolution Testing

Verify:

- [ ] External Resolution
- [ ] Internal Resolution
- [ ] DNS Filtering

---

## High Availability Testing

### Primary Failure Test

- [ ] Disable Primary DNS
- [ ] Verify Secondary DNS Usage
- [ ] Confirm Resolution Continues

---

### Secondary Failure Test

- [ ] Disable Secondary DNS
- [ ] Verify Primary DNS Usage

---

# Phase 4 - Homepage Deployment

## Platform

| Property | Value |
|----------|----------|
| Host | DAX |
| Platform | LXC |

---

## Installation

- [ ] Create LXC Container
- [ ] Install Homepage
- [ ] Configure Networking

---

## Dashboard Configuration

Create Categories:

### Infrastructure

- [ ] UDM-Pro
- [ ] DAX
- [ ] MAX
- [ ] PAX
- [ ] JAX

---

### Core Services

- [ ] AdGuard Primary
- [ ] AdGuard Secondary
- [ ] Uptime Kuma

---

### Future Services

Create placeholders for:

- [ ] OpenMediaVault
- [ ] Plex
- [ ] Immich
- [ ] Vaultwarden
- [ ] Home Assistant

---

## Validation

- [ ] Homepage Accessible
- [ ] Dashboard Organized
- [ ] Links Functional

---

# Phase 5 - Uptime Kuma Deployment

## Platform

| Property | Value |
|----------|----------|
| Host | DAX |
| Platform | LXC |

---

## Installation

- [ ] Create LXC Container
- [ ] Install Uptime Kuma
- [ ] Configure Networking

---

## Monitoring Configuration

### Infrastructure Monitors

- [ ] UDM-Pro
- [ ] DAX
- [ ] MAX
- [ ] PAX
- [ ] JAX

---

### DNS Monitors

- [ ] AdGuard Primary
- [ ] AdGuard Secondary

---

## Validation

- [ ] Monitors Online
- [ ] Monitoring Data Visible

---

# Phase 6 - Alerting Configuration

## Email Alerts

- [ ] Configure SMTP
- [ ] Configure Email Notifications
- [ ] Send Test Alert

---

## Mobile Notifications

- [ ] Configure Mobile Integration
- [ ] Validate Notifications
- [ ] Send Test Alert

---

## Alert Categories

### Critical

- [ ] UDM-Pro
- [ ] AdGuard
- [ ] DNS Failure

---

### Important

- [ ] Homepage
- [ ] Uptime Kuma

---

# Phase 7 - Tailscale Integration

## Infrastructure Hosts

Verify:

- [ ] DAX Connected
- [ ] MAX Connected
- [ ] PAX Connected

---

## Network Connectivity

Validate:

- [ ] Remote DNS Access
- [ ] Remote Homepage Access
- [ ] Remote Uptime Kuma Access

---

## Security

- [ ] MFA Enabled
- [ ] Device Inventory Updated

---

# Phase 8 - Documentation Update

## Core Infrastructure

Review:

- [ ] CORE-INFRASTRUCTURE.md

---

## DNS

Review:

- [ ] DNS-ARCHITECTURE.md

---

## Monitoring

Review:

- [ ] MONITORING-AND-ALERTING.md

---

## Remote Access

Review:

- [ ] REMOTE-ACCESS.md

---

# Validation Testing

## DNS

Verify:

- [ ] Resolution Works
- [ ] Filtering Works
- [ ] Failover Works

---

## Homepage

Verify:

- [ ] Dashboard Loads
- [ ] Services Display Correctly

---

## Uptime Kuma

Verify:

- [ ] Monitors Running
- [ ] Notifications Successful

---

## Tailscale

Verify:

- [ ] Remote Connectivity
- [ ] Administrative Access

---

# Evidence Collection

Store In:

```text
evidence/sprint-03/
```

---

## Required Evidence

- [ ] AdGuard Screenshots
- [ ] DNS Testing Results
- [ ] Homepage Dashboard Screenshots
- [ ] Uptime Kuma Screenshots
- [ ] Alert Test Results
- [ ] Tailscale Validation Results

---

# Lessons Learned

## What Worked

```text
(To be completed during execution)
```

---

## What Failed

```text
(To be completed during execution)
```

---

## Documentation Corrections

```text
(To be completed during execution)
```

---

# Exit Criteria

Sprint 03 cannot be closed until:

- [ ] AdGuard Primary Operational
- [ ] AdGuard Secondary Operational
- [ ] DNS High Availability Tested
- [ ] Homepage Operational
- [ ] Uptime Kuma Operational
- [ ] Email Alerts Functional
- [ ] Mobile Alerts Functional
- [ ] Tailscale Validated
- [ ] Documentation Updated
- [ ] Evidence Collected

---

# Sprint Outcome

## Start Date

```text
TBD
```

## Completion Date

```text
TBD
```

## Final Status

```text
Planned
```

## Notes

```text
Sprint 03 is the first sprint that makes WoogleNet operational.

Upon completion, the environment gains:
- DNS
- Monitoring
- Alerting
- Dashboarding
- Remote Management

All subsequent services will depend on the infrastructure deployed during this sprint.
```