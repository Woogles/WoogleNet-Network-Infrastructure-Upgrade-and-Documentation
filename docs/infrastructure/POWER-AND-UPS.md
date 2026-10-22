# Power and UPS

## Purpose

This document defines the power infrastructure, UPS deployment, shutdown procedures, power recovery procedures, and power protection strategy for the WoogleNet environment.

The goals of this architecture are:

- Protect equipment from power outages
- Provide graceful shutdown capabilities
- Extend equipment lifespan
- Prevent data corruption
- Maintain network availability during short outages
- Support disaster recovery procedures

This document should be reviewed when equipment is added, removed, relocated, or power requirements change.

---

# Power Architecture

## Design Principles

1. Critical infrastructure should remain online as long as possible.
2. Servers should shut down gracefully.
3. Networking equipment should remain online longer than compute resources.
4. UPS runtime is more important than maximum load.
5. Recovery should be automated where practical.
6. Power dependency chains should remain simple.

---

# UPS Inventory

## Tripp Lite SMART1500LCD

| Property | Value |
|----------|----------|
| Quantity | 3 |
| Capacity | 1500VA |
| Output Power | 900W |
| Form Factor | Rack Mount |
| Status | Installed |

---

## APC Back-UPS Pro

| Property | Value |
|----------|----------|
| Quantity | 2 |
| Capacity | 1500VA |
| Output Power | 900W |
| Status | Installed |

---

# Rack Power Layout

## Rack Power Zone

Rack Units:

```text
U32-U39
```

Purpose:

```text
Primary UPS Infrastructure
```

---

## Current Installation

| Location | Equipment |
|----------|----------|
| U32-U39 | UPS Systems |
| Status | Requires Final Mapping |

---

# Power Distribution Strategy

## Priority 1 - Network Infrastructure

Must remain online as long as possible.

### Devices

- UDM-Pro
- TP-Link Switch 01
- TP-Link Switch 02
- Access Points

### Reason

These devices maintain:

- Routing
- DNS Access
- DHCP
- Remote Connectivity
- Recovery Access

---

## Priority 2 - Storage Infrastructure

### Devices

- PAX
- OpenMediaVault

### Reason

Storage shutdown should occur only after networking remains available long enough for graceful processing.

---

## Priority 3 - Infrastructure Services

### Devices

- DAX
- MAX

### Services

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma
- Home Assistant

---

## Priority 4 - Application Services

### Devices

- JAX

### Services

- Plex
- Immich
- Audiobookshelf
- Vaultwarden
- ARR Stack
- Nextcloud
- Paperless-ngx
- BookStack

---

# UPS Management Platform

## Standard

```text
NUT
Network UPS Tools
```

---

## Purpose

- UPS Monitoring
- Battery Monitoring
- Event Notification
- Automated Shutdown
- Runtime Monitoring

---

# Power Failure Response

## Utility Power Failure

### Timeline

#### Minute 0

```text
Commercial Power Lost
```

Actions:

- UPS Systems Transition To Battery
- Monitoring Generates Alert

---

#### Minute 1-4

```text
Observe Runtime
```

Actions:

- Wait For Power Restoration
- Continue Monitoring

---

#### Minute 5

```text
Shutdown Sequence Begins
```

Based on approved design decision.

---

# Automated Shutdown Sequence

## Phase 1

Stop Non-Essential Workloads

Examples:

- Plex
- Audiobookshelf
- ARR Stack
- MeTube
- Tautulli

---

## Phase 2

Shutdown JAX

Purpose:

```text
Protect Application Data
```

---

## Phase 3

Shutdown Infrastructure Hosts

Order:

```text
MAX
DAX
PAX
```

---

## Phase 4

Keep Network Infrastructure Online

Until battery capacity no longer allows operation.

Devices:

- UDM-Pro
- Switches
- Access Points

---

# Power Restoration Procedure

## Phase 1

Verify Utility Power Stability.

---

## Phase 2

Verify UPS Status.

Confirm:

- Batteries healthy
- No active alarms
- Runtime normal

---

## Phase 3

Restore Core Infrastructure

Order:

```text
UDM-Pro

Switches

Access Points
```

---

## Phase 4

Restore Compute Infrastructure

Order:

```text
PAX

DAX

MAX

JAX
```

---

## Phase 5

Validate Services

Critical Services:

- DNS
- Storage
- Vaultwarden
- Immich
- Home Assistant
- Paperless
- Nextcloud

---

# Runtime Objectives

## Short Outage

Expected Result:

```text
No Shutdown Required
```

---

## Medium Outage

Expected Result:

```text
Controlled Shutdown
```

---

## Extended Outage

Expected Result:

```text
Full Power Down
```

with clean recovery.

---

# Monitoring Requirements

## Monitor

### UPS Health

- Battery Status
- Input Voltage
- Runtime Remaining
- Load Percentage

---

### Alerts

Send notifications for:

- Power Failure
- Battery Failure
- UPS Communication Failure
- Low Battery
- High Load

---

## Notification Methods

- Email
- Mobile Notifications

Reference:

```text
MONITORING-AND-ALERTING.md
```

---

# Maintenance Schedule

## Monthly

Verify:

- Battery Status
- UPS Connectivity
- Runtime Estimates

---

## Quarterly

Perform:

- NUT Validation
- Shutdown Testing
- Alert Testing

---

## Annually

Review:

- Load Capacity
- Battery Health
- Runtime Performance

---

# Load Management

## Current Status

| Item | Status |
|----------|----------|
| Device-to-UPS Mapping | Pending |
| Load Calculations | Pending |
| Runtime Estimates | Pending |

---

## Future Documentation

This document should be updated to include:

- UPS Assignments
- Device Wattage
- Load Percentages
- Runtime Calculations

once deployment is finalized.

---

# Power Recovery Priorities

## Priority 1

Restore:

- UDM-Pro
- Switching
- DNS

---

## Priority 2

Restore:

- OpenMediaVault
- Storage Services

---

## Priority 3

Restore:

- Vaultwarden
- Immich
- Home Assistant
- Paperless
- Nextcloud

---

## Priority 4

Restore:

- Plex
- Audiobookshelf
- ARR Stack

---

# Failure Scenarios

## UPS Failure

### Response

1. Identify Failed UPS
2. Move Critical Devices
3. Replace UPS
4. Validate Monitoring

---

## Battery Failure

### Response

1. Replace Battery
2. Run Self-Test
3. Validate Runtime

---

## NUT Failure

### Response

1. Restore Monitoring
2. Validate Communication
3. Test Notifications

---

# Related Documents

- RACK-LAYOUT.md
- CABLING.md
- STORAGE-ARCHITECTURE.md
- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- OPERATIONS-RUNBOOK.md

---

# Validation Checklist

- [ ] UPS Inventory Verified
- [ ] UPS Locations Verified
- [ ] NUT Installed
- [ ] NUT Reporting Runtime
- [ ] Power Failure Alert Tested
- [ ] Low Battery Alert Tested
- [ ] Graceful Shutdown Tested
- [ ] Recovery Procedure Tested

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Final Device-to-UPS Mapping | Pending |
| Load Calculations | Pending |
| Runtime Calculations | Pending |
| Automatic Startup Validation | Pending |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Power and UPS Architecture |