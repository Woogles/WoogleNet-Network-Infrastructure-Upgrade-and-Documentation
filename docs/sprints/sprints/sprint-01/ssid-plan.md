# SSID Plan

## Purpose

This document serves as the authoritative wireless network implementation guide for WoogleNet.

The goals of this document are to:

- Standardize wireless deployment
- Map SSIDs to VLANs
- Support network segmentation
- Improve security
- Simplify wireless administration
- Support future expansion

This document is intended for Sprint 01 implementation.

---

# Wireless Architecture

## Wireless Platform

```text
UniFi
```

---

## Access Point Inventory

Current Inventory:

```text
4x UniFi AC LR

3x UniFi AC Pro
```

---

## Initial Deployment

### Hallway AP

Purpose:

```text
Primary Coverage
```

---

### Main Room AP

Purpose:

```text
Primary Coverage
```

---

### Additional APs

Status:

```text
Future Deployment
```

---

# SSID Summary

| SSID | VLAN | Purpose |
|----------|----------|----------|
| WoogleNet | 20 | Trusted Devices |
| WoogleNet-IoT | 30 | Smart Devices |
| WoogleNet-Guest | 40 | Guest Access |

---

# SSID 01

## WoogleNet

### Purpose

Primary wireless network for:

- Family Devices
- Administrative Devices
- Laptops
- Desktops
- Phones
- Tablets

---

### VLAN

```text
20
```

---

### Network

```text
10.0.20.0/24
```

---

### Security

Authentication:

```text
WPA3 Preferred
```

Fallback:

```text
WPA2/WPA3 Mixed
```

if device compatibility requires.

---

### Client Isolation

```text
Disabled
```

---

### Internet Access

```text
Allowed
```

---

### Infrastructure Access

```text
Allowed
```

---

### DNS Assignment

```text
10.0.10.50
10.0.10.51
```

---

# SSID 02

## WoogleNet-IoT

### Purpose

Wireless network for:

- Smart TVs
- Streaming Devices
- Smart Speakers
- Sensors
- Smart Home Devices

---

### VLAN

```text
30
```

---

### Network

```text
10.0.30.0/24
```

---

### Security

Authentication:

```text
WPA2/WPA3 Mixed
```

Reason:

```text
Improved Device Compatibility
```

---

### Client Isolation

```text
Disabled
```

Reason:

Some smart device ecosystems require device-to-device communication.

---

### Internet Access

```text
Allowed
```

---

### Trusted VLAN Access

```text
Denied
```

---

### Infrastructure Access

```text
Denied
```

Exception:

```text
AdGuard DNS
```

and future

```text
Home Assistant
```

integration.

---

# SSID 03

## WoogleNet-Guest

### Purpose

Network for:

- Visitors
- Temporary Devices
- Contractors
- Untrusted Devices

---

### VLAN

```text
40
```

---

### Network

```text
10.0.40.0/24
```

---

### Security

Authentication:

```text
WPA2/WPA3 Mixed
```

---

### Client Isolation

```text
Enabled
```

---

### Internet Access

```text
Allowed
```

---

### Internal Access

```text
Denied
```

---

### Infrastructure Access

```text
Denied
```

---

### Trusted Access

```text
Denied
```

---

### IoT Access

```text
Denied
```

---

# Wireless Security Standards

## Minimum Requirements

### Trusted Network

```text
Strong Password
```

---

### IoT Network

```text
Separate Password
```

---

### Guest Network

```text
Separate Password
```

---

## Password Storage

All wireless credentials must be stored in:

```text
Vaultwarden
```

Reference:

```text
SERVICE-DECISIONS.md
```

---

# Fast Roaming

## Current Recommendation

```text
Disabled
```

during initial deployment.

---

## Future Review

Enable only if testing confirms:

- Stable Connections
- Seamless Roaming

---

# Band Steering

## Current Recommendation

```text
Enabled
```

---

## Purpose

Encourage:

```text
5 GHz Usage
```

when supported.

---

# Wi-Fi Optimization

## Radio Power

### Initial Recommendation

```text
Medium
```

for all APs.

---

## Channel Strategy

Use:

```text
Automatic
```

during initial deployment.

---

## Future Optimization

Conduct wireless survey after deployment.

---

# Coverage Validation

## Hallway AP

Verify Coverage:

- Hallway
- Adjacent Bedrooms
- Common Areas

---

## Main Room AP

Verify Coverage:

- Living Room
- Family Areas
- Office Areas

---

## Validation Requirement

Dead zones should be documented.

Store findings in:

```text
deployment/sprint-01/evidence/wireless/
```

---

# Validation Tests

## Trusted SSID

Verify:

- [ ] Correct VLAN
- [ ] DHCP Assignment
- [ ] DNS Assignment
- [ ] Internet Access
- [ ] Infrastructure Access

---

## IoT SSID

Verify:

- [ ] Correct VLAN
- [ ] DHCP Assignment
- [ ] DNS Assignment
- [ ] Internet Access
- [ ] Trusted Access Blocked
- [ ] Infrastructure Access Blocked

---

## Guest SSID

Verify:

- [ ] Correct VLAN
- [ ] DHCP Assignment
- [ ] DNS Assignment
- [ ] Internet Access
- [ ] Internal Access Blocked
- [ ] Client Isolation Working

---

# Future SSIDs

Reserved:

| SSID | Purpose | Status |
|----------|----------|----------|
| WoogleNet-Lab | Testing | Future |
| WoogleNet-AI | AI Infrastructure | Future |
| WoogleNet-Cameras | Camera Network | Future |

---

# Deployment Checklist

- [ ] WoogleNet Created
- [ ] WoogleNet-IoT Created
- [ ] WoogleNet-Guest Created
- [ ] VLAN Mapping Verified
- [ ] Security Settings Verified
- [ ] DNS Verified
- [ ] Validation Testing Completed

---

# Evidence Requirements

Capture Screenshots Of:

- SSID Configuration
- VLAN Mapping
- Security Configuration
- Client Connections

Store In:

```text
deployment/sprint-01/evidence/wireless/
```

---

# Related Documents

- vlan-design.md
- dhcp-plan.md
- firewall-rules.md
- test-matrix.md
- NETWORK-TOPOLOGY.md
- VLAN-PLAN.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Wireless Deployment Plan |