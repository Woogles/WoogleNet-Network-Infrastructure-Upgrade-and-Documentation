# Sprint 02 Validation Checklist

## Purpose

This document provides the final validation checklist for Sprint 02.

The goal of validation is to confirm that:

- DAX is operational
- MAX is operational
- PAX is operational
- Proxmox standards have been applied
- Networking functions correctly
- DNS functions correctly
- Tailscale connectivity exists
- Hosts are ready for Sprint 03

This checklist must be completed before Sprint 02 can be closed.

---

# Validation Information

## Validator

Name:

```text
_____________________
```

---

## Date

```text
_____________________
```

---

## Sprint

```text
Sprint 02 - Proxmox Platform
```

---

# DAX Validation

## Hardware

Verify:

- [ ] CPU Detected
- [ ] RAM Detected
- [ ] Network Interfaces Present
- [ ] Storage Present

---

## Host Identity

Verify:

- [ ] Hostname = dax
- [ ] Management IP = 10.0.10.30

---

## Network

Verify:

- [ ] Gateway Reachable
- [ ] DNS Functional
- [ ] Internet Reachable

---

### Test Commands

```bash
ping 10.0.10.1
```

```bash
ping 1.1.1.1
```

```bash
nslookup google.com
```

---

## Administration

Verify:

- [ ] Proxmox UI Accessible
- [ ] SSH Accessible
- [ ] Tailscale Accessible

---

## Security

Verify:

- [ ] Root SSH Disabled
- [ ] Administrative Account Exists

---

## Status

```text
PASS / FAIL
```

---

# MAX Validation

## Hardware

Verify:

- [ ] CPU Detected
- [ ] RAM Detected
- [ ] Network Interfaces Present
- [ ] Storage Present

---

## Host Identity

Verify:

- [ ] Hostname = max
- [ ] Management IP = 10.0.10.31

---

## Network

Verify:

- [ ] Gateway Reachable
- [ ] DNS Functional
- [ ] Internet Reachable

---

## Administration

Verify:

- [ ] Proxmox UI Accessible
- [ ] SSH Accessible
- [ ] Tailscale Accessible

---

## Security

Verify:

- [ ] Root SSH Disabled
- [ ] Administrative Account Exists

---

## Status

```text
PASS / FAIL
```

---

# PAX Validation

## Hardware

Verify:

- [ ] CPU Detected
- [ ] RAM Detected
- [ ] Storage Present
- [ ] RAID Controller Present

---

## Host Identity

Verify:

- [ ] Hostname = pax
- [ ] Management IP = 10.0.10.32

---

## Network

Verify:

- [ ] Gateway Reachable
- [ ] DNS Functional
- [ ] Internet Reachable

---

## Administration

Verify:

- [ ] Proxmox UI Accessible
- [ ] SSH Accessible
- [ ] Tailscale Accessible

---

## Storage

Verify:

- [ ] RAID Healthy
- [ ] No Degraded Arrays
- [ ] No Failed Disks
- [ ] Cache Battery Healthy

---

## Security

Verify:

- [ ] Root SSH Disabled
- [ ] Administrative Account Exists

---

## Status

```text
PASS / FAIL
```

---

# DNS Validation

## AdGuard Reachability

Verify:

```text
10.0.10.50
10.0.10.51
```

reachable from:

- [ ] DAX
- [ ] MAX
- [ ] PAX

---

## Resolution Testing

Run:

```bash
nslookup google.com
```

Expected:

```text
Successful Resolution
```

---

## Internal Resolution

Run:

```bash
nslookup dax
```

Expected:

```text
Successful Resolution
```

(if configured)

---

## Result

```text
PASS / FAIL
```

---

# Network Validation

## Gateway Reachability

Verify:

- [ ] DAX → Gateway
- [ ] MAX → Gateway
- [ ] PAX → Gateway

---

## Inter-Host Reachability

Verify:

- [ ] DAX ↔ MAX
- [ ] DAX ↔ PAX
- [ ] MAX ↔ PAX

---

## Internet Reachability

Verify:

- [ ] DAX
- [ ] MAX
- [ ] PAX

---

## Result

```text
PASS / FAIL
```

---

# Tailscale Validation

## Enrollment

Verify:

- [ ] DAX In Tailnet
- [ ] MAX In Tailnet
- [ ] PAX In Tailnet

---

## Remote Access

Verify:

- [ ] DAX Accessible
- [ ] MAX Accessible
- [ ] PAX Accessible

---

## Management Access

Verify:

- [ ] Proxmox UI Reachable Remotely
- [ ] SSH Reachable Remotely

---

## Result

```text
PASS / FAIL
```

---

# Proxmox Standard Validation

Reference:

```text
proxmox-standard.md
```

---

## DAX

- [ ] Compliant

---

## MAX

- [ ] Compliant

---

## PAX

- [ ] Compliant

---

## Result

```text
PASS / FAIL
```

---

# Storage Validation

## Local Storage

Verify:

### DAX

- [ ] local
- [ ] local-lvm

---

### MAX

- [ ] local
- [ ] local-lvm

---

### PAX

- [ ] local
- [ ] local-lvm

---

## Capacity Recording

| Host | Capacity Verified |
|----------|----------|
| DAX | [ ] |
| MAX | [ ] |
| PAX | [ ] |

---

# Configuration Export Validation

## Verify Exports Exist

### DAX

- [ ] Configuration Export
- [ ] Version Information

---

### MAX

- [ ] Configuration Export
- [ ] Version Information

---

### PAX

- [ ] Configuration Export
- [ ] Version Information

---

## Storage Location

```text
deployment/sprint-02/exports/
```

---

## Result

```text
PASS / FAIL
```

---

# Evidence Validation

Verify Evidence Exists In:

```text
deployment/sprint-02/evidence/
```

---

## DAX

- [ ] Complete

---

## MAX

- [ ] Complete

---

## PAX

- [ ] Complete

---

## Network

- [ ] Complete

---

## Result

```text
PASS / FAIL
```

---

# Sprint Acceptance Review

## Requirements

| Requirement | Status |
|------------|---------|
| DAX Operational | [ ] |
| MAX Operational | [ ] |
| PAX Operational | [ ] |
| Proxmox Standards Applied | [ ] |
| DNS Working | [ ] |
| Internet Access Working | [ ] |
| Tailscale Working | [ ] |
| Exports Collected | [ ] |
| Evidence Collected | [ ] |

---

# Final Sprint Result

## Validation Outcome

```text
PASS / FAIL
```

---

## Approved By

```text
_____________________
```

---

## Date

```text
_____________________
```

---

# Sprint Exit Criteria

Sprint 02 may only be closed when:

- [ ] All Validation Sections Pass
- [ ] No Critical Findings Remain
- [ ] Documentation Updated
- [ ] Exports Stored
- [ ] Evidence Stored
- [ ] Sprint 03 Ready To Begin

---

# Next Sprint

```text
Sprint 03 - Core Infrastructure
```

Deployment Targets:

```text
AdGuard Primary
AdGuard Secondary
Homepage
Uptime Kuma
```

These services will be deployed using the newly validated Proxmox infrastructure.

