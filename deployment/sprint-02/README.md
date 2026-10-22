# Sprint 02 - Proxmox Platform

## Purpose

Sprint 02 establishes the virtualization foundation for the WoogleNet environment.

This sprint converts the validated physical hardware from Sprint 00 into a fully operational virtualization platform capable of hosting all future infrastructure and application services.

The objective is to deploy:

- DAX
- MAX
- PAX
- Proxmox VE
- Infrastructure networking
- Remote management
- Host hardening
- Host monitoring preparation

Upon completion, the environment will be ready for Sprint 03 Core Infrastructure deployment.

---

# Sprint Objectives

## Primary Goals

- Install Proxmox VE
- Configure DAX
- Configure MAX
- Configure PAX
- Configure Management Networking
- Configure DNS
- Configure NTP
- Configure Tailscale
- Establish Operational Standards

---

## Secondary Goals

- Document Final Hardware Specifications
- Standardize Host Configuration
- Capture Installation Evidence
- Export Host Configuration

---

# Sprint Deliverables

Upon completion, the following should exist:

```text
Operational DAX Host

Operational MAX Host

Operational PAX Host

Verified Infrastructure Connectivity

Verified DNS Connectivity

Verified Tailscale Access

Host Build Documentation

Host Validation Results

Configuration Backups

Evidence Package
```

---

# Directory Structure

```text
deployment/
└── sprint-02/
    │
    ├── README.md
    ├── proxmox-standard.md
    ├── dax-build-sheet.md
    ├── max-build-sheet.md
    ├── pax-build-sheet.md
    ├── validation-checklist.md
    ├── rollback-procedure.md
    │
    ├── exports/
    │   ├── dax/
    │   ├── max/
    │   └── pax/
    │
    └── evidence/
        ├── dax/
        ├── max/
        ├── pax/
        └── network/
```

---

# References

## Architecture Documents

Required Reading:

- HARDWARE-INVENTORY.md
- NETWORK-TOPOLOGY.md
- REMOTE-ACCESS.md
- CORE-INFRASTRUCTURE.md
- SERVICE-DEPENDENCIES.md
- SECURITY-BASELINE.md

---

## Sprint Documentation

Required:

```text
SPRINT-02-PROXMOX-PLATFORM.md
```

---

# Target Host Layout

## DAX

Purpose:

```text
Infrastructure Host
```

Planned Services:

- AdGuard Primary
- Homepage
- Uptime Kuma

Management Address:

```text
10.0.10.30
```

---

## MAX

Purpose:

```text
Infrastructure Host
```

Planned Services:

- AdGuard Secondary
- Home Assistant

Management Address:

```text
10.0.10.31
```

---

## PAX

Purpose:

```text
Storage Host
```

Planned Services:

- OpenMediaVault

Management Address:

```text
10.0.10.32
```

---

# Recommended Execution Order

Follow this order exactly.

## Step 1

Validate Hardware

Verify:

- CPU
- RAM
- Storage
- NICs
- Firmware

Reference:

```text
Sprint 00 Inventory
```

---

## Step 2

Install Proxmox VE

Install:

```text
DAX
MAX
PAX
```

Do not continue until all hosts are operational.

---

## Step 3

Configure Management Networking

Configure:

```text
Static IP

Gateway

DNS

NTP
```

Verify connectivity.

---

## Step 4

Apply Proxmox Standards

Reference:

```text
proxmox-standard.md
```

Apply:

- Updates
- Security Settings
- User Accounts
- SSH Policies

---

## Step 5

Install Tailscale

Install On:

```text
DAX
MAX
PAX
```

Verify remote connectivity.

---

## Step 6

Execute Validation

Reference:

```text
validation-checklist.md
```

---

## Step 7

Capture Evidence

Store evidence in:

```text
evidence/
```

---

# Host Standards

## Hostnames

| Host | Hostname |
|----------|----------|
| DAX | dax |
| MAX | max |
| PAX | pax |

---

## DNS

Primary:

```text
10.0.10.50
```

Secondary:

```text
10.0.10.51
```

---

## Time Synchronization

All hosts will use:

```text
NTP
```

with consistent time synchronization.

---

## Administrative Access

Permitted Through:

```text
Trusted VLAN

Tailscale

Physical Console
```

---

# Validation Requirements

## Host Reachability

Verify:

- DAX Reachable
- MAX Reachable
- PAX Reachable

---

## DNS

Verify:

- Name Resolution
- External Resolution

---

## Management Access

Verify:

- Proxmox UI
- SSH Access
- Tailscale Access

---

## Network Connectivity

Verify:

- Gateway Reachability
- DNS Reachability
- Internet Reachability

---

# Configuration Backups

Upon completion:

Export:

### DAX

- Configuration
- Version Information

---

### MAX

- Configuration
- Version Information

---

### PAX

- Configuration
- Version Information

---

Store in:

```text
deployment/sprint-02/exports/
```

---

# Evidence Requirements

Capture:

## DAX

- Installation Screenshots
- Networking Configuration
- Proxmox Summary

---

## MAX

- Installation Screenshots
- Networking Configuration
- Proxmox Summary

---

## PAX

- Installation Screenshots
- Networking Configuration
- Storage Summary

---

Store in:

```text
deployment/sprint-02/evidence/
```

---

# Common Failure Points

## DNS

Symptoms:

```text
Unable To Resolve Names
```

Verify:

- DNS Servers
- Gateway
- Routing

---

## Management Access

Symptoms:

```text
Unable To Reach Web UI
```

Verify:

- IP Configuration
- Browser Access
- Firewall

---

## Tailscale

Symptoms:

```text
Remote Access Failure
```

Verify:

- Tailnet Enrollment
- Authentication
- ACL Configuration

---

# Success Criteria

Sprint 02 is complete when:

- DAX Operational
- MAX Operational
- PAX Operational
- Network Connectivity Verified
- DNS Connectivity Verified
- Tailscale Operational
- Configuration Exports Complete
- Evidence Collected

---

# Exit Criteria

Sprint 02 can only be closed when:

- [ ] DAX Passes Validation
- [ ] MAX Passes Validation
- [ ] PAX Passes Validation
- [ ] DNS Functional
- [ ] Tailscale Functional
- [ ] Documentation Updated
- [ ] Exports Stored
- [ ] Evidence Stored

---

# Expected Outcome

At completion of Sprint 02:

```text
The Proxmox platform becomes the operational
foundation for all infrastructure services.

The environment is ready for:

Sprint 03 - Core Infrastructure
```

---

# Next Sprint

```text
Sprint 03 - Core Infrastructure
```

Objective:

```text
Deploy

AdGuard

Homepage

Uptime Kuma

Monitoring

Remote Management
```

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 02 Deployment Guide |