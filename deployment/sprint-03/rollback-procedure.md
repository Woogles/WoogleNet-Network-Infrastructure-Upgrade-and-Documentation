# Sprint 03 Rollback Procedure

## Purpose

This document defines the rollback and recovery procedures for Sprint 03 Core Infrastructure services.

The objective is to restore critical infrastructure functionality if deployment or configuration changes result in:

- DNS outages
- Monitoring failures
- Homepage failures
- Container corruption
- Configuration loss
- DAX host failures
- MAX host failures

This procedure covers:

```text
dax-adguard
max-adguard
dax-homepage
dax-uptime
```

---

# Scope

## Included Services

### DNS

```text
dax-adguard
max-adguard
```

---

### Service Dashboard

```text
dax-homepage
```

---

### Monitoring

```text
dax-uptime
```

---

## Dependencies

Potentially Impacted:

```text
DNS

Monitoring

Backups

Remote Administration

All Future Services
```

---

# Recovery Priorities

## Priority 1

Restore:

```text
DNS Resolution
```

Services:

```text
dax-adguard

max-adguard
```

---

## Priority 2

Restore:

```text
Administrative Access
```

Services:

```text
Homepage

Tailscale

Proxmox
```

---

## Priority 3

Restore:

```text
Monitoring
```

Service:

```text
dax-uptime
```

---

## Priority 4

Restore:

```text
Dashboard Visibility
```

Service:

```text
dax-homepage
```

---

# Emergency Access Methods

## Method 1

### Tailscale

Use:

```text
Tailscale Administrative Access
```

Verify:

- DAX Reachable
- MAX Reachable

---

## Method 2

### Proxmox Web Console

Access:

```text
https://dax:8006

https://max:8006
```

or direct IP access.

---

## Method 3

### Physical Console

Reference:

```text
RACK-LAYOUT.md
```

---

# Backup Verification

Before rollback verify backups exist.

## Required Exports

Verify:

```text
deployment/sprint-03/exports/
```

Contains:

```text
dax-adguard

max-adguard

dax-homepage

dax-uptime
```

---

## Configuration Backups

Verify:

- [ ] AdGuard Exports
- [ ] Homepage Configurations
- [ ] Uptime Kuma Configurations

---

# Scenario 1

## dax-adguard Failure

### Symptoms

```text
DNS Resolution Failure

DNS Timeouts

Filtering Not Working
```

---

### Immediate Actions

#### Step 1

Validate:

```text
max-adguard Operational
```

---

#### Step 2

Test:

```bash
nslookup google.com 10.0.10.51
```

Expected:

```text
Successful Resolution
```

---

#### Step 3

Temporarily operate using:

```text
max-adguard
```

---

#### Step 4

Investigate:

```text
Container Failure

Network Failure

Application Failure
```

---

### Recovery

Restart:

```bash
pct start 100
```

or

```bash
systemctl restart AdGuardHome
```

---

### Validation

Verify:

```bash
nslookup google.com 10.0.10.50
```

Successful.

---

# Scenario 2

## max-adguard Failure

### Symptoms

```text
Secondary DNS Unavailable
```

---

### Immediate Actions

Primary DNS remains available:

```text
dax-adguard
```

No immediate user impact expected.

---

### Recovery

Restart:

```bash
pct start 101
```

or

```bash
systemctl restart AdGuardHome
```

---

### Validation

Verify:

```bash
nslookup google.com 10.0.10.51
```

Successful.

---

# Scenario 3

## Complete DNS Failure

### Symptoms

```text
No Name Resolution

Applications Appear Offline

Package Updates Fail
```

---

### Validation

Test:

```bash
ping 1.1.1.1
```

If successful:

```text
Network Operational

DNS Failed
```

---

### Temporary Emergency DNS

Configure:

```text
1.1.1.1

9.9.9.9
```

until restoration completed.

---

### Recovery Procedure

1. Restore AdGuard configuration.
2. Restart AdGuard service.
3. Verify upstream DNS.
4. Restore local records.

---

### Validation

Verify:

```bash
nslookup google.com

nslookup github.com

nslookup microsoft.com
```

---

# Scenario 4

## dax-homepage Failure

### Symptoms

```text
Homepage Unavailable

Dashboard Missing
```

---

### Impact

Operational visibility reduced.

No production services impacted.

---

### Recovery

Restart:

```bash
pct start 110
```

or

```bash
docker restart dax-homepage
```

---

### Configuration Restore

Restore:

```text
/opt/homepage/config
```

from backup.

---

### Validation

Browse:

```text
http://10.0.10.60
```

Verify:

- Dashboard Loads
- Links Work
- Categories Visible

---

# Scenario 5

## dax-uptime Failure

### Symptoms

```text
Monitoring Offline

Alerts Not Sent
```

---

### Impact

Services continue operating.

Visibility is lost.

---

### Recovery

Restart:

```bash
pct start 111
```

or

```bash
docker restart dax-uptime
```

---

### Configuration Restore

Restore:

```text
/opt/uptime-kuma/data
```

from backup.

---

### Validation

Verify:

- Dashboard Accessible
- Monitors Present
- Alerts Functional

---

# Scenario 6

## DAX Host Failure

### Impact

Potential Loss Of:

```text
dax-adguard

dax-homepage

dax-uptime
```

---

### Immediate Actions

Verify:

```text
max-adguard Operational
```

DNS should continue functioning.

---

### Recovery Order

#### Step 1

Restore DAX Host.

Reference:

```text
Sprint 02 Rollback Procedure
```

---

#### Step 2

Restore:

```text
dax-adguard
```

---

#### Step 3

Restore:

```text
dax-homepage
```

---

#### Step 4

Restore:

```text
dax-uptime
```

---

### Validation

Execute:

```text
Sprint 03 Validation Checklist
```

---

# Scenario 7

## MAX Host Failure

### Impact

Potential Loss Of:

```text
max-adguard
```

---

### Immediate Actions

Verify:

```text
dax-adguard Operational
```

DNS functionality should continue.

---

### Recovery

Restore MAX Host.

Reference:

```text
deployment/sprint-02/rollback-procedure.md
```

---

### Restore Service

Restore:

```text
max-adguard
```

from configuration exports.

---

# Configuration Restore Procedure

## AdGuard

Restore:

- DNS Configuration
- Filters
- Local Records
- Client Settings

---

## Homepage

Restore:

- services.yaml
- widgets.yaml
- settings.yaml
- bookmarks.yaml

---

## Uptime Kuma

Restore:

- Monitors
- Alerting
- Users
- Status Pages

---

# Post-Recovery Validation

Execute:

```text
deployment/sprint-03/validation-checklist.md
```

---

## Mandatory Validation

### DNS

- [ ] Resolution Functional
- [ ] Failover Functional

---

### Homepage

- [ ] Dashboard Online

---

### Monitoring

- [ ] Monitoring Online
- [ ] Alerts Functional

---

### Infrastructure

- [ ] DAX Reachable
- [ ] MAX Reachable
- [ ] PAX Reachable
- [ ] JAX Reachable

---

# Incident Record

## Date

```text
_____________________
```

---

## Service

```text
_____________________
```

---

## Issue

```text
_____________________
```

---

## Root Cause

```text
_____________________
```

---

## Corrective Actions

```text
_____________________
```

---

## Recovery Time

```text
_____________________
```

---

## Result

```text
PASS / FAIL
```

---

# Sprint Recovery Success Criteria

Recovery is successful when:

- DNS Resolution Restored
- Monitoring Restored
- Homepage Restored
- Configuration Restored
- Validation Checklist Passed
- Documentation Updated

---

# Related Documents

- README.md
- validation-checklist.md
- dax-adguard.md
- max-adguard.md
- dax-homepage.md
- dax-uptime.md
- ../standards/backup-standard.md
- ../standards/monitoring-standard.md
- ../standards/network-security-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 03 Rollback Procedure |