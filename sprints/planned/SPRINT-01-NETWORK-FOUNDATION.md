# Sprint 01 - Network Foundation

## Sprint Information

| Property | Value |
|----------|----------|
| Sprint ID | Sprint 01 |
| Name | Network Foundation |
| Status | Planned |
| Priority | Critical |
| Estimated Duration | 1-2 Weeks |
| Owner | Eric Yacoub |

---

# Sprint Goal

Implement the foundational network architecture for WoogleNet.

This sprint establishes:

- VLAN segmentation
- DHCP configuration
- Wireless networks
- DNS assignment
- Firewall policy
- Network security boundaries

Upon completion, the network should support all future infrastructure and service deployments.

---

# Success Criteria

Sprint 01 is complete when:

- VLANs are operational
- DHCP scopes are functioning
- Wireless SSIDs are deployed
- Firewall rules are implemented
- DNS distribution is functional
- Trusted devices function normally
- IoT devices are isolated
- Guest devices have internet-only access

---

# Prerequisites

## Required Sprint Completion

- [ ] Sprint 00 Complete

---

## Required Documentation

- ARCHITECTURE.md
- NETWORK-TOPOLOGY.md
- IP-ADDRESS-PLAN.md
- VLAN-PLAN.md
- FIREWALL-RULES.md
- DNS-ARCHITECTURE.md
- SECURITY-BASELINE.md

---

## Configuration Backups

Verify current backups exist:

- [ ] UDM-Pro Configuration Export
- [ ] Switch Configuration Exports
- [ ] AP Configuration Exports

---

# Phase 1 - UDM-Pro Preparation

## Validation

### Firmware

- [ ] Verify UDM-Pro Firmware Current

### Backup

- [ ] Export Current Configuration
- [ ] Save Backup To Evidence Folder

### Documentation

- [ ] Record Current Firmware Version

---

# Phase 2 - VLAN Creation

## VLAN 10

### Infrastructure

| Property | Value |
|----------|----------|
| VLAN ID | 10 |
| Network | 10.0.10.0/24 |
| Gateway | 10.0.10.1 |
| DHCP | Disabled |

---

### Tasks

- [ ] Create VLAN 10
- [ ] Configure Gateway
- [ ] Disable DHCP

---

## VLAN 20

### Trusted

| Property | Value |
|----------|----------|
| VLAN ID | 20 |
| Network | 10.0.20.0/24 |
| Gateway | 10.0.20.1 |
| DHCP | Enabled |

---

### Tasks

- [ ] Create VLAN 20
- [ ] Configure Gateway
- [ ] Configure DHCP Scope

---

## VLAN 30

### IoT

| Property | Value |
|----------|----------|
| VLAN ID | 30 |
| Network | 10.0.30.0/24 |
| Gateway | 10.0.30.1 |
| DHCP | Enabled |

---

### Tasks

- [ ] Create VLAN 30
- [ ] Configure Gateway
- [ ] Configure DHCP Scope

---

## VLAN 40

### Guest

| Property | Value |
|----------|----------|
| VLAN ID | 40 |
| Network | 10.0.40.0/24 |
| Gateway | 10.0.40.1 |
| DHCP | Enabled |

---

### Tasks

- [ ] Create VLAN 40
- [ ] Configure Gateway
- [ ] Configure DHCP Scope

---

# Phase 3 - DHCP Configuration

## Trusted Network

### Scope

```text
10.0.20.100 - 10.0.20.249
```

Tasks:

- [ ] Configure DHCP Scope
- [ ] Configure DNS Assignment

---

## IoT Network

### Scope

```text
10.0.30.100 - 10.0.30.249
```

Tasks:

- [ ] Configure DHCP Scope
- [ ] Configure DNS Assignment

---

## Guest Network

### Scope

```text
10.0.40.100 - 10.0.40.249
```

Tasks:

- [ ] Configure DHCP Scope
- [ ] Configure DNS Assignment

---

# Phase 4 - DNS Assignment

## Primary DNS

```text
10.0.10.50
```

AdGuard Primary

---

## Secondary DNS

```text
10.0.10.51
```

AdGuard Secondary

---

## Tasks

- [ ] Configure DNS Distribution
- [ ] Verify DHCP DNS Delivery

---

# Phase 5 - Wireless Deployment

## Trusted SSID

### Configuration

```text
SSID:
WoogleNet

VLAN:
20
```

---

### Tasks

- [ ] Create SSID
- [ ] Verify Connectivity

---

## IoT SSID

### Configuration

```text
SSID:
WoogleNet-IoT

VLAN:
30
```

---

### Tasks

- [ ] Create SSID
- [ ] Verify Connectivity

---

## Guest SSID

### Configuration

```text
SSID:
WoogleNet-Guest

VLAN:
40
```

---

### Tasks

- [ ] Create SSID
- [ ] Verify Guest Isolation

---

# Phase 6 - Switch Configuration

## Switch Validation

### Switch 01

- [ ] Verify Trunks
- [ ] Verify VLAN Propagation

---

### Switch 02

- [ ] Verify Trunks
- [ ] Verify VLAN Propagation

---

### Switch 03

- [ ] Validate Usage
- [ ] Configure If Required

---

## Port Review

- [ ] Document Trunk Ports
- [ ] Verify Patch Panel Uplinks

---

# Phase 7 - Firewall Implementation

## Infrastructure Protection

Implement:

- [ ] Block IoT → Infrastructure
- [ ] Block Guest → Infrastructure

---

## Trusted Access

Implement:

- [ ] Trusted → Infrastructure Allow
- [ ] Trusted → Internet Allow

---

## IoT Isolation

Implement:

- [ ] IoT → Trusted Deny
- [ ] IoT → Infrastructure Deny
- [ ] IoT → Guest Deny
- [ ] IoT → Internet Allow

---

## Guest Isolation

Implement:

- [ ] Guest → Infrastructure Deny
- [ ] Guest → Trusted Deny
- [ ] Guest → IoT Deny
- [ ] Guest → Internet Allow

---

## Home Assistant Exception

Create Placeholder Rule:

- [ ] Home Assistant → IoT Allow

Implementation may occur later after deployment.

---

# Validation Testing

## VLAN Testing

### Infrastructure

- [ ] Verify Infrastructure Routing

### Trusted

- [ ] Verify Internet Access
- [ ] Verify DHCP Assignment

### IoT

- [ ] Verify Internet Access
- [ ] Verify Isolation

### Guest

- [ ] Verify Internet Access
- [ ] Verify Isolation

---

# Security Testing

## Trusted VLAN

Confirm:

- [ ] Internet Access
- [ ] Infrastructure Access

---

## IoT VLAN

Confirm:

- [ ] Internet Access
- [ ] No Trusted Access
- [ ] No Infrastructure Access

---

## Guest VLAN

Confirm:

- [ ] Internet Access
- [ ] No Internal Access

---

# DNS Testing

## Client Validation

Verify:

- [ ] Primary DNS Received
- [ ] Secondary DNS Received

---

## Resolution

Verify:

- [ ] Internet Resolution
- [ ] Internal Resolution

---

# Rollback Plan

If deployment fails:

1. Restore UDM-Pro Backup
2. Restore Switch Configurations
3. Restore Wireless Configuration
4. Validate Original Network Operation

---

# Documentation Updates

Update:

- [ ] NETWORK-TOPOLOGY.md
- [ ] VLAN-PLAN.md
- [ ] FIREWALL-RULES.md
- [ ] DNS-ARCHITECTURE.md

if implementation differs from documented design.

---

# Evidence Collection

Store Evidence In:

```text
evidence/sprint-01/
```

---

## Required Evidence

- [ ] VLAN Screenshots
- [ ] DHCP Screenshots
- [ ] SSID Screenshots
- [ ] Firewall Screenshots
- [ ] DNS Screenshots
- [ ] Network Test Results

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

Sprint 01 cannot be closed until:

- [ ] All VLANs Operational
- [ ] DHCP Operational
- [ ] Wireless Operational
- [ ] DNS Distribution Operational
- [ ] Firewall Rules Implemented
- [ ] IoT Isolation Verified
- [ ] Guest Isolation Verified
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
Sprint 01 establishes the network foundation for all future infrastructure and service deployments.
No Proxmox deployment should begin until this sprint is complete.
```