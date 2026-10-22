# Sprint 03 - Core Infrastructure

## Purpose

Sprint 03 establishes the core infrastructure services required by every subsequent WoogleNet service deployment.

This sprint transforms the Proxmox platform from Sprint 02 into a usable infrastructure environment by deploying:

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma
- Infrastructure Monitoring
- DNS Services
- Core Service Visibility

Upon completion, WoogleNet becomes operational and capable of supporting storage and application services.

---

# Sprint Objectives

## Primary Goals

- Deploy Primary DNS
- Deploy Secondary DNS
- Deploy Internal Dashboard
- Deploy Monitoring Platform
- Validate DNS Redundancy
- Validate Monitoring
- Establish Service Visibility

---

## Secondary Goals

- Standardize LXC Deployments
- Establish Monitoring Standards
- Build Core Operational Tooling
- Prepare For Sprint 04

---

# Sprint Deliverables

Upon completion, the following services should be operational:

```text
AdGuard Primary

AdGuard Secondary

Homepage

Uptime Kuma
```

In addition:

```text
DNS High Availability

Infrastructure Monitoring

Homepage Dashboard

Remote Administrative Access

Monitoring Alerts
```

---

# Directory Structure

```text
deployment/
└── sprint-03/
    │
    ├── README.md
    ├── adguard-primary.md
    ├── adguard-secondary.md
    ├── homepage.md
    ├── uptime-kuma.md
    ├── validation-checklist.md
    ├── rollback-procedure.md
    │
    ├── exports/
    │   ├── adguard-primary/
    │   ├── adguard-secondary/
    │   ├── homepage/
    │   └── uptime-kuma/
    │
    └── evidence/
        ├── adguard-primary/
        ├── adguard-secondary/
        ├── homepage/
        ├── uptime-kuma/
        ├── monitoring/
        └── dns/
```

---

# References

## Required Documentation

- CORE-INFRASTRUCTURE.md
- DNS-ARCHITECTURE.md
- REMOTE-ACCESS.md
- MONITORING-AND-ALERTING.md
- SERVICE-DEPENDENCIES.md
- NETWORK-TOPOLOGY.md

---

## Required Sprint Documentation

```text
SPRINT-03-CORE-INFRASTRUCTURE.md
```

---

# Deployment Targets

## AdGuard Primary

Host:

```text
DAX
```

Type:

```text
LXC Container
```

Hostname:

```text
adguard-primary
```

Address:

```text
10.0.10.50
```

Purpose:

```text
Primary DNS
DNS Filtering
Local DNS
```

---

## AdGuard Secondary

Host:

```text
MAX
```

Type:

```text
LXC Container
```

Hostname:

```text
adguard-secondary
```

Address:

```text
10.0.10.51
```

Purpose:

```text
DNS Redundancy
DNS Failover
```

---

## Homepage

Host:

```text
DAX
```

Type:

```text
LXC Container
```

Hostname:

```text
homepage
```

Address:

```text
10.0.10.60
```

Purpose:

```text
Service Dashboard
Infrastructure Management
```

---

## Uptime Kuma

Host:

```text
DAX
```

Type:

```text
LXC Container
```

Hostname:

```text
uptime-kuma
```

Address:

```text
10.0.10.61
```

Purpose:

```text
Monitoring
Alerting
Health Checks
```

---

# Deployment Order

Follow this sequence exactly.

## Step 1

Deploy:

```text
AdGuard Primary
```

Validate:

- DNS Resolution
- UI Access
- Upstream Connectivity

---

## Step 2

Deploy:

```text
AdGuard Secondary
```

Validate:

- DNS Resolution
- Independent Operation

---

## Step 3

Perform DNS Failover Testing

Validate:

```text
Primary Failure

Secondary Failure
```

---

## Step 4

Deploy:

```text
Homepage
```

Configure:

```text
Infrastructure Services
Service Categories
Dashboard Layout
```

---

## Step 5

Deploy:

```text
Uptime Kuma
```

Configure:

```text
Infrastructure Monitoring
Alerting
Notifications
```

---

## Step 6

Execute Validation

Reference:

```text
validation-checklist.md
```

---

# Service Standards

## Container Type

Default:

```text
Unprivileged LXC
```

---

## Network

All services reside on:

```text
VLAN 10
Infrastructure
```

---

## Static Addressing

Required:

```text
Yes
```

No DHCP permitted.

---

## DNS

All services use:

```text
10.0.10.50

10.0.10.51
```

---

# Monitoring Standards

## Uptime Kuma Must Monitor

### Infrastructure

- DAX
- MAX
- PAX

---

### DNS

- AdGuard Primary
- AdGuard Secondary

---

### Core Services

- Homepage
- Uptime Kuma

---

# DNS Validation Requirements

## Verify Resolution

External:

```text
google.com
microsoft.com
cloudflare.com
```

---

## Verify Internal Resolution

When implemented:

```text
wooglenet.internal
```

---

## Verify Failover

Primary DNS Failure:

```text
Resolution Continues
```

---

Secondary DNS Failure:

```text
Resolution Continues
```

---

# Homepage Standards

## Infrastructure Category

Include:

- UDM-Pro
- DAX
- MAX
- PAX
- JAX

---

## Core Services Category

Include:

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

---

## Future Services Category

Create placeholders for:

- OpenMediaVault
- Plex
- Immich
- Vaultwarden
- Home Assistant

---

# Configuration Backup Requirements

Export:

## AdGuard

- Configuration
- Filters
- DNS Settings

---

## Homepage

- Configuration
- Dashboard Layout

---

## Uptime Kuma

- Monitor Configuration
- Notification Settings

---

Store In:

```text
deployment/sprint-03/exports/
```

---

# Evidence Requirements

Capture:

### AdGuard

- Dashboard
- DNS Settings
- Query Logs

---

### Homepage

- Dashboard Layout
- Service Categories

---

### Uptime Kuma

- Monitors
- Alerts
- Status Dashboard

---

### DNS Testing

- Resolution Tests
- Failover Tests

---

Store In:

```text
deployment/sprint-03/evidence/
```

---

# Validation Requirements

Verify:

## DNS

- Primary Operational
- Secondary Operational
- Failover Operational

---

## Monitoring

- Monitors Functional
- Alerts Functional

---

## Homepage

- Dashboard Accessible
- Links Functional

---

## Remote Access

- Tailscale Access Functional

---

# Success Criteria

Sprint 03 is complete when:

- AdGuard Primary Operational
- AdGuard Secondary Operational
- DNS Failover Validated
- Homepage Operational
- Uptime Kuma Operational
- Monitoring Operational
- Alerting Operational
- Documentation Updated
- Evidence Collected

---

# Exit Criteria

Sprint 03 can only be closed when:

- [ ] All Services Deployed
- [ ] DNS Failover Tested
- [ ] Monitoring Functional
- [ ] Alerts Functional
- [ ] Exports Collected
- [ ] Evidence Collected
- [ ] Validation Completed

---

# Expected Outcome

At completion of Sprint 03:

```text
WoogleNet becomes operational.

Core infrastructure services exist.

Monitoring exists.

DNS redundancy exists.

Operational visibility exists.
```

The environment is now ready for:

```text
Sprint 04 - Storage Platform
```

---

# Next Sprint

```text
Sprint 04 - Storage Platform
```

Primary Objective:

```text
Deploy OpenMediaVault

Create Shared Storage

Prepare Backup Repository

Prepare Media Storage
```

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 03 Deployment Guide |