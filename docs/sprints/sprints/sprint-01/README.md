# Sprint 01 - Network Foundation

## Purpose

Sprint 01 establishes the foundational network architecture for the WoogleNet environment.

This sprint converts the documented network design into a functional implementation.

The objective is to deploy:

- VLAN segmentation
- DHCP services
- DNS assignment
- Wireless networks
- Firewall policies
- Network isolation

Upon completion, the network will be ready to support Proxmox, infrastructure services, storage services, and application workloads.

---

# Sprint Objectives

## Primary Goals

- Deploy VLANs
- Deploy DHCP scopes
- Deploy SSIDs
- Deploy firewall rules
- Configure DNS distribution
- Validate segmentation

---

## Secondary Goals

- Improve network security
- Isolate IoT devices
- Isolate guest devices
- Establish Infrastructure VLAN
- Prepare for future service deployment

---

# Sprint Deliverables

Upon completion, the following should exist:

```text
Functional Infrastructure VLAN

Functional Trusted VLAN

Functional IoT VLAN

Functional Guest VLAN

Wireless SSIDs

Firewall Policies

Documented Validation Results

Configuration Backups

Evidence Package
```

---

# Directory Structure

```text
deployment/
└── sprint-01/
    │
    ├── README.md
    ├── vlan-design.md
    ├── dhcp-plan.md
    ├── ssid-plan.md
    ├── firewall-rules.md
    ├── validation-checklist.md
    ├── rollback-procedure.md
    ├── test-matrix.md
    ├── exports/
    └── evidence/
```

---

# References

## Architecture Documents

Required reading before implementation:

- VLAN-PLAN.md
- FIREWALL-RULES.md
- NETWORK-TOPOLOGY.md
- IP-ADDRESS-PLAN.md
- DNS-ARCHITECTURE.md
- SECURITY-BASELINE.md

---

## Sprint Documents

- SPRINT-01-NETWORK-FOUNDATION.md

---

# Network Design

## VLAN 10

### Infrastructure

Purpose:

```text
Servers
Infrastructure Services
Network Equipment
Storage
Management
```

Network:

```text
10.0.10.0/24
```

Gateway:

```text
10.0.10.1
```

DHCP:

```text
Disabled
```

---

## VLAN 20

### Trusted

Purpose:

```text
Family Devices
Administrative Devices
Laptops
Phones
Tablets
```

Network:

```text
10.0.20.0/24
```

Gateway:

```text
10.0.20.1
```

DHCP:

```text
Enabled
```

---

## VLAN 30

### IoT

Purpose:

```text
Smart Home Devices
Cameras
Media Devices
Sensors
```

Network:

```text
10.0.30.0/24
```

Gateway:

```text
10.0.30.1
```

DHCP:

```text
Enabled
```

---

## VLAN 40

### Guest

Purpose:

```text
Temporary Devices
Guest Access
```

Network:

```text
10.0.40.0/24
```

Gateway:

```text
10.0.40.1
```

DHCP:

```text
Enabled
```

---

# Implementation Order

Follow this order exactly.

## Step 1

Create VLANs

```text
10
20
30
40
```

---

## Step 2

Create DHCP Scopes

For:

```text
20
30
40
```

---

## Step 3

Configure DNS Distribution

Primary:

```text
10.0.10.50
```

Secondary:

```text
10.0.10.51
```

---

## Step 4

Create SSIDs

```text
WoogleNet

WoogleNet-IoT

WoogleNet-Guest
```

---

## Step 5

Configure Firewall Rules

Apply isolation policies.

---

## Step 6

Validate Functionality

Execute testing matrix.

---

# Validation Requirements

## Infrastructure VLAN

Verify:

- Routing
- Host Reachability
- DNS Reachability

---

## Trusted VLAN

Verify:

- DHCP
- DNS
- Internet
- Infrastructure Access

---

## IoT VLAN

Verify:

- DHCP
- DNS
- Internet

Confirm denied:

- Trusted Access
- Infrastructure Access

---

## Guest VLAN

Verify:

- DHCP
- DNS
- Internet

Confirm denied:

- Internal Access

---

# Evidence Collection

Store in:

```text
deployment/sprint-01/evidence/
```

---

## Required Screenshots

### UDM-Pro

- VLAN Configuration
- DHCP Configuration
- Firewall Configuration

---

### Access Points

- SSID Configuration

---

### Client Devices

- DHCP Assignment
- DNS Assignment
- Connectivity Tests

---

# Configuration Backups

Before Changes:

- Export UDM-Pro Configuration
- Export Switch Configurations
- Export AP Configurations

Store:

```text
deployment/sprint-01/exports/
```

---

# Rollback Requirements

If implementation fails:

1. Restore UDM-Pro Backup
2. Restore Switch Backup
3. Restore Wireless Configuration
4. Verify Original Connectivity

Reference:

```text
rollback-procedure.md
```

---

# Success Criteria

Sprint 01 is complete when:

- VLANs Operational
- DHCP Operational
- DNS Assignment Operational
- SSIDs Operational
- Firewall Rules Operational
- IoT Isolation Verified
- Guest Isolation Verified
- Documentation Updated
- Evidence Collected

---

# Common Failure Points

## DNS

Usually caused by:

```text
Incorrect DHCP DNS Configuration
```

Check:

```text
DNS Assignment
Gateway Assignment
```

---

## Wireless

Usually caused by:

```text
Incorrect VLAN Assignment
```

Check:

```text
SSID Mapping
Switch Trunks
```

---

## Inter-VLAN Routing

Usually caused by:

```text
Missing Firewall Rules
```

Check:

```text
Allow Rules
Deny Rules
Rule Order
```

---

# Expected Outcome

At completion of Sprint 01:

```text
Network Segmentation Exists

Infrastructure Is Protected

IoT Is Isolated

Guest Access Is Restricted

Future Infrastructure Deployment Can Begin
```

---

# Exit Criteria

Sprint 01 can only be closed when:

- [ ] Validation Complete
- [ ] Firewall Testing Complete
- [ ] Backup Exports Stored
- [ ] Evidence Stored
- [ ] Documentation Updated
- [ ] Lessons Learned Recorded

---

# Next Sprint

```text
Sprint 02 - Proxmox Platform
```

Objective:

```text
Deploy DAX
Deploy MAX
Deploy PAX

Create Virtualization Platform
```

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 01 Deployment Guide |