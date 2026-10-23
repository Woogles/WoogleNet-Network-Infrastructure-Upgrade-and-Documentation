# Sprint 03 Validation Checklist

## Purpose

This document provides the final validation checklist for Sprint 03 Core Infrastructure.

The goal is to verify that:

- DNS redundancy is operational
- Core infrastructure services are deployed
- Monitoring is operational
- Alerting is functional
- Dashboard services are accessible
- Core platform services are recoverable

Sprint 03 cannot be closed until all validation items pass.

---

# Validation Information

## Validator

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
Sprint 03 - Core Infrastructure
```

---

# Service Inventory Validation

Verify all Sprint 03 services exist and are operational.

| Service | IP | Status |
|----------|----------|----------|
| dax-adguard | 10.0.10.50 | [ ] |
| max-adguard | 10.0.10.51 | [ ] |
| dax-homepage | 10.0.10.60 | [ ] |
| dax-uptime | 10.0.10.61 | [ ] |

---

# Container Validation

## dax-adguard

Verify:

- [ ] Container Running
- [ ] Static IP Assigned
- [ ] DNS Service Running
- [ ] Web Console Reachable

Result:

```text
PASS / FAIL
```

---

## max-adguard

Verify:

- [ ] Container Running
- [ ] Static IP Assigned
- [ ] DNS Service Running
- [ ] Web Console Reachable

Result:

```text
PASS / FAIL
```

---

## dax-homepage

Verify:

- [ ] Container Running
- [ ] Static IP Assigned
- [ ] Homepage Available

Result:

```text
PASS / FAIL
```

---

## dax-uptime

Verify:

- [ ] Container Running
- [ ] Static IP Assigned
- [ ] Uptime Kuma Available

Result:

```text
PASS / FAIL
```

---

# DNS Validation

## External Resolution

Run from:

```text
Trusted Client
```

Execute:

```bash
nslookup google.com
nslookup microsoft.com
nslookup github.com
```

Verify:

- [ ] google.com Resolves
- [ ] microsoft.com Resolves
- [ ] github.com Resolves

---

## Internal Resolution

Verify:

```bash
nslookup dax
nslookup max
nslookup pax
nslookup jax
```

Expected:

```text
Successful Resolution
```

---

## Service Resolution

Verify:

```bash
nslookup dax-adguard
nslookup max-adguard
nslookup dax-homepage
nslookup dax-uptime
```

Expected:

```text
Successful Resolution
```

---

Result:

```text
PASS / FAIL
```

---

# DNS Filtering Validation

Attempt To Access:

```text
Known Ad Domain

Known Tracking Domain
```

Expected:

```text
Blocked
```

---

Verify:

- [ ] Query Log Updated
- [ ] Block Event Recorded

---

Result:

```text
PASS / FAIL
```

---

# DNS Failover Validation

## Scenario 1

### Primary Failure

Stop:

```text
dax-adguard
```

Verify:

```bash
nslookup google.com
```

Expected:

```text
Resolution Continues
```

Using:

```text
max-adguard
```

---

Validation:

- [ ] DNS Continues
- [ ] No User Impact

---

Result:

```text
PASS / FAIL
```

---

## Scenario 2

### Restore Primary

Start:

```text
dax-adguard
```

Verify:

- [ ] DNS Functional
- [ ] Service Healthy

---

Result:

```text
PASS / FAIL
```

---

## Scenario 3

### Secondary Failure

Stop:

```text
max-adguard
```

Verify:

```bash
nslookup google.com
```

Expected:

```text
Resolution Continues
```

Using:

```text
dax-adguard
```

---

Validation:

- [ ] DNS Functional
- [ ] No User Impact

---

Result:

```text
PASS / FAIL
```

---

# Homepage Validation

## Dashboard Access

Browse:

```text
http://dax-homepage
```

or

```text
http://10.0.10.60
```

---

Verify:

- [ ] Homepage Loads
- [ ] No Errors
- [ ] Dashboard Responsive

---

# Infrastructure Section

Verify Links Exist:

- [ ] DAX
- [ ] MAX
- [ ] PAX
- [ ] JAX

---

# Core Services Section

Verify Links Exist:

- [ ] dax-adguard
- [ ] max-adguard
- [ ] dax-homepage
- [ ] dax-uptime

---

# Placeholder Categories

Verify Categories Exist:

- [ ] Storage
- [ ] Security
- [ ] Media
- [ ] Knowledge

---

Result:

```text
PASS / FAIL
```

---

# Uptime Kuma Validation

## Dashboard

Browse:

```text
http://10.0.10.61:3001
```

---

Verify:

- [ ] Dashboard Loads
- [ ] Monitors Visible
- [ ] No Configuration Errors

---

# Infrastructure Monitoring

Verify Monitoring Exists For:

- [ ] dax
- [ ] max
- [ ] pax
- [ ] jax

---

# DNS Monitoring

Verify Monitoring Exists For:

- [ ] dax-adguard
- [ ] max-adguard

---

## Monitor Status

Verify:

- [ ] All Host Checks Passing
- [ ] All DNS Checks Passing
- [ ] All HTTP Checks Passing

---

Result:

```text
PASS / FAIL
```

---

# Alerting Validation

## Test Alert

Temporarily Stop:

```text
dax-homepage
```

---

Expected:

- [ ] Monitor Failure Detected
- [ ] Alert Generated
- [ ] Notification Received

---

## Recovery Alert

Restore:

```text
dax-homepage
```

Expected:

- [ ] Recovery Detected
- [ ] Recovery Notification Received

---

Result:

```text
PASS / FAIL
```

---

# Backup Validation

Verify Exports Exist

## dax-adguard

- [ ] Export Exists

---

## max-adguard

- [ ] Export Exists

---

## dax-homepage

- [ ] Export Exists

---

## dax-uptime

- [ ] Export Exists

---

Result:

```text
PASS / FAIL
```

---

# Security Validation

Verify:

## Administrative Access

Allowed From:

- [ ] VLAN 10
- [ ] VLAN 20
- [ ] Tailscale

---

## Restricted Access

Verify Denied:

- [ ] VLAN 30
- [ ] VLAN 40

---

## DNS Services

Verify:

- [ ] IoT Can Resolve DNS
- [ ] Guest Can Resolve DNS

---

Result:

```text
PASS / FAIL
```

---

# Documentation Validation

Verify:

- [ ] Service Guide Updated
- [ ] DNS Records Updated
- [ ] Monitoring Documentation Updated
- [ ] Export Locations Recorded
- [ ] Evidence Stored

---

Result:

```text
PASS / FAIL
```

---

# Evidence Validation

Verify Evidence Exists

```text
deployment/sprint-03/evidence/
```

---

Required:

### dax-adguard

- [ ] Complete

### max-adguard

- [ ] Complete

### dax-homepage

- [ ] Complete

### dax-uptime

- [ ] Complete

### DNS Testing

- [ ] Complete

### Monitoring Tests

- [ ] Complete

---

Result:

```text
PASS / FAIL
```

---

# Sprint Acceptance Review

| Requirement | Status |
|-------------|---------|
| Primary DNS Operational | [ ] |
| Secondary DNS Operational | [ ] |
| DNS Failover Tested | [ ] |
| Homepage Operational | [ ] |
| Monitoring Operational | [ ] |
| Alerting Operational | [ ] |
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

# Exit Criteria

Sprint 03 may only be closed when:

- [ ] All Validation Tests Pass
- [ ] DNS Failover Confirmed
- [ ] Monitoring Functional
- [ ] Alerting Functional
- [ ] Documentation Updated
- [ ] Exports Stored
- [ ] Evidence Stored
- [ ] Sprint 04 Ready

---

# Next Sprint

```text
Sprint 04 - Storage Platform
```

Primary Objectives:

```text
Deploy pax-omv

Build Shared Storage

Create Backup Repository

Prepare Application Storage

Implement SMB/NFS Services
```

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 03 Validation Checklist |