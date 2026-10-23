# Network Validation Test Matrix

## Purpose

This document provides the step-by-step validation procedures for Sprint 01.

The goals of testing are:

- Verify network functionality
- Validate VLAN segmentation
- Validate DHCP
- Validate DNS
- Validate firewall policies
- Validate client isolation
- Produce deployment evidence

This document should be executed after all VLANs, SSIDs, DHCP scopes, and firewall rules have been deployed.

---

# Test Status Legend

| Status | Meaning |
|----------|----------|
| PASS | Expected Result Achieved |
| FAIL | Unexpected Result |
| SKIP | Test Not Performed |
| BLOCKED | Dependency Issue |

---

# Test Devices

## Trusted Device

Requirements:

```text
Connected to WoogleNet SSID

Obtains VLAN 20 Address
```

Example:

```text
Laptop
Desktop
```

---

## IoT Device

Requirements:

```text
Connected to WoogleNet-IoT

Obtains VLAN 30 Address
```

Example:

```text
Streaming Device
Smart TV
```

---

## Guest Device

Requirements:

```text
Connected to WoogleNet-Guest

Obtains VLAN 40 Address
```

Example:

```text
Phone
Tablet
```

---

# DHCP Validation

## TEST-001

### VLAN 20 Trusted

Verify:

- [ ] DHCP Address Received

Expected:

```text
10.0.20.x
```

Result:

```text
________________
```

Status:

```text
______
```

---

## TEST-002

### VLAN 30 IoT

Verify:

- [ ] DHCP Address Received

Expected:

```text
10.0.30.x
```

Result:

```text
________________
```

Status:

```text
______
```

---

## TEST-003

### VLAN 40 Guest

Verify:

- [ ] DHCP Address Received

Expected:

```text
10.0.40.x
```

Result:

```text
________________
```

Status:

```text
______
```

---

# DNS Validation

## TEST-010

### Trusted DNS Assignment

Verify:

```text
Primary DNS
Secondary DNS
```

Expected:

```text
10.0.10.50
10.0.10.51
```

Status:

```text
______
```

---

## TEST-011

### IoT DNS Assignment

Expected:

```text
10.0.10.50
10.0.10.51
```

Status:

```text
______
```

---

## TEST-012

### Guest DNS Assignment

Expected:

```text
10.0.10.50
10.0.10.51
```

Status:

```text
______
```

---

## TEST-013

### Internet DNS Resolution

Run:

```bash
nslookup google.com
```

Expected:

```text
Successful Resolution
```

Status:

```text
______
```

---

## TEST-014

### Internal DNS Resolution

Run:

```bash
nslookup dns1.wooglenet.internal
```

Expected:

```text
Successful Resolution
```

Status:

```text
______
```

---

# Internet Connectivity Validation

## TEST-020

### Trusted Internet Access

Verify:

```text
Web Browsing
```

Expected:

```text
Works
```

Status:

```text
______
```

---

## TEST-021

### IoT Internet Access

Expected:

```text
Works
```

Status:

```text
______
```

---

## TEST-022

### Guest Internet Access

Expected:

```text
Works
```

Status:

```text
______
```

---

# Trusted VLAN Access Tests

## TEST-030

### Trusted → Infrastructure

Attempt:

```text
Proxmox
OMV
AdGuard
```

Expected:

```text
Allowed
```

Status:

```text
______
```

---

## TEST-031

### Trusted → JAX

Attempt:

```text
Ping
SSH
Web Interface
```

Expected:

```text
Allowed
```

Status:

```text
______
```

---

## TEST-032

### Trusted → IoT

Attempt:

```text
Access IoT Device
```

Expected:

```text
Allowed
```

Status:

```text
______
```

---

# IoT Isolation Tests

## TEST-040

### IoT → Infrastructure

Attempt:

```text
Ping DAX
Ping MAX
Ping PAX
Ping JAX
```

Expected:

```text
Blocked
```

Status:

```text
______
```

---

## TEST-041

### IoT → AdGuard

Attempt:

```text
DNS Query
```

Expected:

```text
Allowed
```

Status:

```text
______
```

---

## TEST-042

### IoT → Trusted VLAN

Attempt:

```text
Ping Trusted Workstation
```

Expected:

```text
Blocked
```

Status:

```text
______
```

---

## TEST-043

### IoT → Guest VLAN

Attempt:

```text
Ping Guest Device
```

Expected:

```text
Blocked
```

Status:

```text
______
```

---

# Guest Isolation Tests

## TEST-050

### Guest → Infrastructure

Attempt:

```text
Ping DAX
Ping MAX
Ping PAX
Ping JAX
```

Expected:

```text
Blocked
```

Status:

```text
______
```

---

## TEST-051

### Guest → Trusted

Attempt:

```text
Ping Trusted Device
```

Expected:

```text
Blocked
```

Status:

```text
______
```

---

## TEST-052

### Guest → IoT

Attempt:

```text
Ping IoT Device
```

Expected:

```text
Blocked
```

Status:

```text
______
```

---

## TEST-053

### Guest → Internet

Verify:

```text
Web Browsing
```

Expected:

```text
Allowed
```

Status:

```text
______
```

---

# Wireless Validation

## TEST-060

### Trusted SSID

SSID:

```text
WoogleNet
```

Expected VLAN:

```text
20
```

Status:

```text
______
```

---

## TEST-061

### IoT SSID

SSID:

```text
WoogleNet-IoT
```

Expected VLAN:

```text
30
```

Status:

```text
______
```

---

## TEST-062

### Guest SSID

SSID:

```text
WoogleNet-Guest
```

Expected VLAN:

```text
40
```

Status:

```text
______
```

---

# DNS Failover Validation

## TEST-070

### Primary DNS Failure

Action:

```text
Disable AdGuard Primary
```

Expected:

```text
Resolution Continues
```

Using:

```text
10.0.10.51
```

Status:

```text
______
```

---

## TEST-071

### Secondary DNS Failure

Action:

```text
Disable AdGuard Secondary
```

Expected:

```text
Resolution Continues
```

Using:

```text
10.0.10.50
```

Status:

```text
______
```

---

# Evidence Collection

Capture Screenshots For:

- [ ] DHCP Assignments
- [ ] DNS Assignments
- [ ] VLAN Assignments
- [ ] Firewall Results
- [ ] SSID Configurations
- [ ] DNS Failover Testing

---

## Storage Location

```text
deployment/sprint-01/evidence/
```

---

# Test Summary

| Category | Status |
|----------|----------|
| DHCP | ______ |
| DNS | ______ |
| Internet Access | ______ |
| Trusted Access | ______ |
| IoT Isolation | ______ |
| Guest Isolation | ______ |
| Wireless | ______ |
| DNS Failover | ______ |

---

# Sprint 01 Acceptance

Sprint 01 is considered complete when:

- [ ] All Tests Pass
- [ ] Evidence Collected
- [ ] Documentation Updated
- [ ] Configuration Backups Stored
- [ ] No Unexpected Access Paths Exist

---

# Reviewer

Name:

```text
_________________
```

Date:

```text
_________________
```

Result:

```text
PASS / FAIL
```