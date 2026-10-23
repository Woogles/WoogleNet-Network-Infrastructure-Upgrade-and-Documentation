# Sprint 02 Rollback Procedure

## Purpose

This document defines the rollback procedures for Sprint 02 Proxmox Platform deployment.

The objective is to restore operational infrastructure if a Proxmox host deployment causes:

- Loss of administrative access
- Loss of network connectivity
- DNS failures
- Tailscale failures
- Host instability
- Storage issues

This procedure applies to:

- DAX
- MAX
- PAX

---

# Scope

Covered Systems:

```text
DAX
MAX
PAX
```

Covered Components:

```text
Proxmox VE

Host Networking

SSH Configuration

Tailscale

DNS Configuration

Storage Configuration
```

Not Covered:

```text
Hardware Failure

Power Failure

Disk Replacement

Disaster Recovery
```

Reference:

```text
DISASTER-RECOVERY.md
```

---

# Recovery Priorities

## Priority 1

Restore:

```text
Administrative Access
```

---

## Priority 2

Restore:

```text
Network Connectivity
```

---

## Priority 3

Restore:

```text
DNS Services
```

---

## Priority 4

Restore:

```text
Tailscale Connectivity
```

---

## Priority 5

Restore:

```text
Proxmox Functionality
```

---

# Required Recovery Resources

## Installation Media

Verify Availability:

- [ ] Proxmox VE ISO
- [ ] USB Installation Media

---

## Documentation

Verify Availability:

- [ ] Hardware Inventory
- [ ] Network Documentation
- [ ] Build Sheets

---

## Configuration Exports

Verify Availability:

```text
deployment/sprint-02/exports/
```

Contains:

- DAX Configuration
- MAX Configuration
- PAX Configuration

---

# Access Methods

## Method 1

### Proxmox Web UI

Access Via:

```text
https://10.0.10.x:8006
```

---

## Method 2

### SSH

Access Via:

```text
Administrative Account
```

Examples:

```text
eric-admin
```

---

## Method 3

### Physical Console

Use:

```text
Rack Monitor

Keyboard

Mouse
```

Reference:

```text
RACK-LAYOUT.md
```

---

# Rollback Trigger Conditions

Begin rollback immediately if:

- Administrative access lost
- Incorrect IP assignment
- DNS non-functional
- Tailscale inaccessible
- Host unstable
- Proxmox services fail to start

---

# Scenario 1

## Host Unreachable

### Symptoms

Examples:

```text
Cannot Reach Web UI

Cannot SSH

Cannot Ping Host
```

---

### Recovery Process

#### Step 1

Verify:

- Host Powered On
- Network Cable Connected
- Switch Port Active

---

#### Step 2

Use Physical Console

Verify:

```text
IP Address

Gateway

DNS
```

---

#### Step 3

Restore Previous Network Settings

If modified.

---

#### Step 4

Restart Networking

Verify:

```text
Connectivity Restored
```

---

# Scenario 2

## Incorrect IP Configuration

### Symptoms

Examples:

```text
Wrong Network

Wrong Gateway

Routing Failure
```

---

### Recovery Steps

#### Step 1

Login Via Console

---

#### Step 2

Review:

```text
/etc/network/interfaces
```

---

#### Step 3

Restore Configuration

Expected:

```text
DAX
10.0.10.30

MAX
10.0.10.31

PAX
10.0.10.32
```

---

#### Step 4

Restart Networking

---

#### Step 5

Validate Reachability

---

# Scenario 3

## DNS Failure

### Symptoms

Examples:

```text
Unable To Resolve Names

Updates Fail

Repositories Unreachable
```

---

### Recovery Steps

#### Step 1

Verify:

```text
10.0.10.50

10.0.10.51
```

configured as DNS servers.

---

#### Step 2

Test:

```bash
ping 1.1.1.1
```

---

#### Step 3

Test:

```bash
nslookup google.com
```

---

#### Step 4

Restore Correct DNS Configuration

---

### Validation

Expected:

```text
External Resolution Works
```

---

# Scenario 4

## Repository Failure

### Symptoms

Examples:

```text
apt update Fails

Package Errors
```

---

### Recovery Steps

#### Step 1

Review Repositories

---

#### Step 2

Disable:

```text
Enterprise Repository
```

when no subscription exists.

---

#### Step 3

Enable:

```text
No Subscription Repository
```

---

#### Step 4

Run:

```bash
apt update
```

---

### Validation

Expected:

```text
No Repository Errors
```

---

# Scenario 5

## SSH Lockout

### Symptoms

Examples:

```text
Cannot Login Via SSH
```

---

### Recovery Steps

#### Step 1

Access Via Physical Console

---

#### Step 2

Review:

```text
sshd_config
```

---

#### Step 3

Restore:

```text
Password Authentication

Administrative User Access
```

---

#### Step 4

Restart SSH

---

#### Step 5

Validate Login

---

# Scenario 6

## Tailscale Failure

### Symptoms

Examples:

```text
Remote Access Unavailable

Host Missing From Tailnet
```

---

### Recovery Steps

#### Step 1

Verify Service Status

```bash
systemctl status tailscaled
```

---

#### Step 2

Restart Service

```bash
systemctl restart tailscaled
```

---

#### Step 3

Reauthenticate

If Required.

---

#### Step 4

Confirm Host Appears In Tailnet

---

### Validation

Verify:

- Host Reachable
- Tailnet Membership Restored

---

# Scenario 7

## PAX Storage Issues

### Symptoms

Examples:

```text
RAID Errors

Storage Missing

Capacity Incorrect
```

---

### Recovery Steps

#### Step 1

Verify RAID Controller

---

#### Step 2

Review RAID Status

---

#### Step 3

Do NOT Rebuild Arrays Without Validation

---

#### Step 4

Reference:

```text
STORAGE-ARCHITECTURE.md
```

---

### Validation

Expected:

```text
RAID Healthy
```

---

# Complete Host Rebuild

Use only when:

```text
Host Unrecoverable
```

---

## Rebuild Process

### Step 1

Reinstall Proxmox

---

### Step 2

Apply:

```text
Hostname

IP Address

Gateway

DNS
```

---

### Step 3

Apply:

```text
Proxmox Standard
```

Reference:

```text
proxmox-standard.md
```

---

### Step 4

Restore Configuration

---

### Step 5

Rejoin Tailnet

---

### Step 6

Execute Validation Checklist

Reference:

```text
validation-checklist.md
```

---

# Validation After Rollback

Verify:

## Network

- [ ] Host Reachable
- [ ] Gateway Reachable
- [ ] Internet Reachable

---

## DNS

- [ ] Resolution Functional

---

## Administration

- [ ] Web UI Functional
- [ ] SSH Functional

---

## Remote Access

- [ ] Tailscale Functional

---

## Storage

### PAX

- [ ] RAID Healthy
- [ ] Storage Accessible

---

# Incident Record

## Date

```text
_____________________
```

---

## Host

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

## Recovery Actions

```text
_____________________
```

---

## Result

```text
PASS / FAIL
```

---

# Escalation Checklist

Before Closing Incident:

- [ ] Physical Connectivity Checked
- [ ] Console Access Tested
- [ ] Network Settings Verified
- [ ] DNS Verified
- [ ] Tailscale Verified
- [ ] Validation Checklist Executed

---

# Success Criteria

Rollback successful when:

- Administrative Access Restored
- DNS Functional
- Internet Functional
- Remote Access Functional
- Storage Functional
- Validation Checklist Passes

---

# Related Documents

- README.md
- proxmox-standard.md
- dax-build-sheet.md
- max-build-sheet.md
- pax-build-sheet.md
- validation-checklist.md
- DISASTER-RECOVERY.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 02 Rollback Procedure |