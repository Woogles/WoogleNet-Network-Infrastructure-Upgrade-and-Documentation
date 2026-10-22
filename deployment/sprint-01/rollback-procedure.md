# Rollback Procedure

## Purpose

This document defines the rollback procedures for Sprint 01 Network Foundation deployment.

The goal is to provide a structured recovery process if network implementation causes:

- Loss of connectivity
- Loss of administrative access
- VLAN routing failures
- DNS failures
- DHCP failures
- Wireless failures

This document assumes configuration backups have been created before any network changes are made.

---

# Scope

This rollback procedure covers:

- UDM-Pro
- Switches
- Wireless Networks
- VLAN Configuration
- DHCP Configuration
- Firewall Rules

This procedure does not cover:

- Hardware failure
- ISP outages
- Power outages

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
Internet Connectivity
```

---

## Priority 3

Restore:

```text
DNS Services
DHCP Services
```

---

## Priority 4

Restore:

```text
Network Segmentation
```

---

# Required Backups

Before implementation verify the following exist.

## UDM-Pro

Location:

```text
deployment/sprint-01/exports/udm-pro/
```

---

## Switches

Location:

```text
deployment/sprint-01/exports/switches/
```

---

## Access Points

Location:

```text
deployment/sprint-01/exports/access-points/
```

---

# Emergency Access Methods

## Method 1

### Wired Connection

Connect directly to:

```text
Trusted VLAN
```

using a known-good switch port.

---

## Method 2

### Local Console

Access:

```text
UDM-Pro Management Interface
```

from local network.

---

## Method 3

### Physical Rack Access

Use:

```text
Rack Monitor

Keyboard

Mouse
```

located at:

```text
U12
U16
```

Reference:

```text
RACK-LAYOUT.md
```

---

# Rollback Triggers

Rollback should begin immediately if any of the following occur.

## Critical Failures

- Loss of UDM-Pro Access
- Loss of Infrastructure VLAN Access
- Loss of Multiple VLANs
- Complete DNS Failure
- Complete DHCP Failure

---

## Major Failures

- Wireless Connectivity Failure
- Firewall Rules Blocking Administration
- Incorrect VLAN Assignment

---

# Scenario 1

## Loss Of UDM-Pro Access

### Symptoms

Examples:

```text
Unable To Access Controller

Unable To Manage Network
```

---

### Recovery Steps

#### Step 1

Verify:

- Device Powered On
- Physical Connectivity

---

#### Step 2

Connect Via:

```text
Known Good Wired Connection
```

---

#### Step 3

Attempt:

```text
Management Interface Access
```

---

#### Step 4

Restore Configuration Backup.

Location:

```text
deployment/sprint-01/exports/udm-pro/
```

---

#### Step 5

Validate:

- Internet
- DHCP
- DNS

---

# Scenario 2

## VLAN Failure

### Symptoms

Examples:

```text
Clients Receive Incorrect Addresses

Clients Cannot Communicate

Clients Cannot Reach Gateway
```

---

### Recovery Steps

#### Step 1

Disable Newly Created VLAN.

---

#### Step 2

Re-enable Previous Network Configuration.

---

#### Step 3

Verify:

- DHCP
- Routing
- Internet

---

#### Step 4

Retest Before Reattempting Deployment.

---

# Scenario 3

## DHCP Failure

### Symptoms

Examples:

```text
169.254.x.x Addresses

No Address Assignment

Incorrect Scope Usage
```

---

### Recovery Steps

#### Step 1

Verify DHCP Scope.

---

#### Step 2

Verify VLAN Assignment.

---

#### Step 3

Restore Previous DHCP Configuration.

---

#### Step 4

Renew Client Address.

---

### Validation

Expected:

```text
Correct Scope Assignment
```

---

# Scenario 4

## DNS Failure

### Symptoms

Examples:

```text
Internet Sites Do Not Resolve

Internal Records Do Not Resolve
```

---

### Recovery Steps

#### Step 1

Verify Client DNS Assignment.

Expected:

```text
10.0.10.50

10.0.10.51
```

---

#### Step 2

Verify Internet Access By IP Address.

Example:

```text
1.1.1.1
```

---

#### Step 3

Review DNS Configuration Changes.

---

#### Step 4

Restore Previous DNS Settings.

---

### Validation

Expected:

```text
External Resolution Works

Internal Resolution Works
```

---

# Scenario 5

## Wireless Failure

### Symptoms

Examples:

```text
SSID Missing

Clients Cannot Connect

Incorrect VLAN Assignment
```

---

### Recovery Steps

#### Step 1

Verify AP Online Status.

---

#### Step 2

Verify SSID Assignment.

---

#### Step 3

Verify VLAN Mapping.

---

#### Step 4

Restore AP Backup.

Location:

```text
deployment/sprint-01/exports/access-points/
```

---

### Validation

Verify:

- Connection
- DHCP
- Internet

---

# Scenario 6

## Firewall Rule Failure

### Symptoms

Examples:

```text
Administration Blocked

Unexpected Isolation

No Internet Access
```

---

### Recovery Steps

#### Step 1

Disable New Firewall Rule(s).

---

#### Step 2

Retest Connectivity.

---

#### Step 3

Restore Previous Firewall Configuration.

---

#### Step 4

Review Rule Ordering.

Reference:

```text
firewall-rules.md
```

---

### Validation

Expected:

```text
Trusted Access Restored

Internet Restored

Administrative Access Restored
```

---

# Validation After Rollback

Verify:

## Connectivity

- [ ] Internet Access
- [ ] DNS Resolution
- [ ] DHCP Functionality

---

## Administration

- [ ] UDM-Pro Accessible
- [ ] Switches Accessible
- [ ] APs Accessible

---

## Services

- [ ] Existing Services Operational

---

# Incident Record

## Date

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

## Action Taken

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

Before ending troubleshooting:

- [ ] Physical Connections Checked
- [ ] Device Power Verified
- [ ] Configuration Compared
- [ ] Backups Verified
- [ ] Rollback Executed
- [ ] Validation Completed

---

# Success Criteria

Rollback is considered successful when:

- Administrative Access Restored
- Internet Connectivity Restored
- DHCP Functional
- DNS Functional
- Existing Services Reachable
- Network Stable

---

# Related Documents

- deployment/sprint-01/README.md
- deployment/sprint-01/vlan-design.md
- deployment/sprint-01/firewall-rules.md
- deployment/sprint-01/test-matrix.md
- NETWORK-TOPOLOGY.md
- FIREWALL-RULES.md
- DISASTER-RECOVERY.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 01 Rollback Procedure |