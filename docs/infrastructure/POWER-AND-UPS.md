# POWER-AND-UPS

## Purpose

This document defines the power architecture, UPS deployment, shutdown procedures, recovery procedures, and power protection standards for the WoogleNet environment.

The objectives of the power and UPS program are to:

- Protect Infrastructure
- Prevent Data Corruption
- Support Graceful Shutdown
- Protect Critical Services
- Improve Recoverability
- Support Disaster Recovery
- Support Operational Readiness
- Support Environment Certification

Power protection is a Tier 1 operational requirement and supports every critical service within the WoogleNet environment.

Reference Documents:

- ARCHITECTURE.md
- HARDWARE-INVENTORY.md
- RACK-LAYOUT.md
- STORAGE-ARCHITECTURE.md
- OPERATIONS-RUNBOOK.md
- MONITORING-AND-ALERTING.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md
- ENVIRONMENT-CERTIFICATION.md

---

# Power Architecture

## Design Principles

The power architecture follows these principles:

1. Networking Survives Longest
2. Graceful Shutdown Preferred
3. Storage Protected Before Applications
4. Recovery Should Be Predictable
5. Monitoring Must Be Continuous
6. Power Events Must Generate Alerts
7. Recovery Procedures Must Be Tested
8. Simplicity Over Complexity

---

# Power Infrastructure Overview

## High-Level Architecture

```text
Utility Power
        ↓
UPS Infrastructure
        ↓
Network Infrastructure
        ↓
Storage Infrastructure
        ↓
Compute Infrastructure
        ↓
Application Services
```

The power architecture prioritizes maintaining network services and controlled shutdowns rather than extending runtime indefinitely.

---

# UPS Inventory

## Tripp Lite SMART1500LCD

| Property | Value |
|----------|----------|
| Quantity | 3 |
| Capacity | 1500VA |
| Output Power | 900W |
| Form Factor | Rack Mount |
| Status | Operational |

---

## APC Back-UPS Pro

| Property | Value |
|----------|----------|
| Quantity | 2 |
| Capacity | 1500VA |
| Output Power | 900W |
| Status | Operational |

---

## Total UPS Count

```text
5
```

UPS Systems

Reference:

HARDWARE-INVENTORY.md

---

# Power Protection Strategy

## Priority 1

Network Infrastructure

Purpose:

Maintain visibility, connectivity, and recovery capability.

Protected Systems:

- UDM-Pro
- TP-Link Switch 01
- TP-Link Switch 02
- Wireless Infrastructure

Functions Protected:

- Routing
- DNS Access
- DHCP
- Remote Administration
- Recovery Connectivity

---

## Priority 2

Storage Infrastructure

Protected Systems:

- PAX
- OpenMediaVault

Functions Protected:

- Storage Services
- Backup Repository
- Shared Storage
- Application Data

Reference:

STORAGE-ARCHITECTURE.md

---

## Priority 3

Infrastructure Services

Protected Systems:

- DAX
- MAX

Protected Services:

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma
- Home Assistant

---

## Priority 4

Application Services

Protected Systems:

- JAX

Protected Services:

- Vaultwarden
- Immich
- Plex
- Audiobookshelf
- Navidrome
- Nextcloud
- Paperless-ngx
- BookStack
- ARR Platform

---

# UPS Management Platform

## Platform

```text
NUT
(Network UPS Tools)
```

Purpose:

- UPS Monitoring
- Runtime Monitoring
- Battery Monitoring
- Event Notification
- Automated Shutdown

Status:

```text
Production
```

---

# Monitoring Requirements

## Monitored Components

Monitor:

- UPS Health
- Battery Status
- Input Voltage
- Runtime Remaining
- Load Percentage
- UPS Connectivity
- Shutdown Events

Reference:

MONITORING-AND-ALERTING.md

---

## Alert Conditions

Generate alerts for:

- Utility Power Failure
- Low Battery
- Battery Failure
- UPS Failure
- UPS Communication Failure
- High UPS Load
- NUT Service Failure

Classification:

```text
Critical
```

---

# Power Failure Procedure

## Utility Failure

### Phase 1

Commercial Power Lost

Actions:

- UPS Systems Transition To Battery
- Monitoring Generates Alert
- NUT Begins Runtime Tracking

---

### Phase 2

Observation Window

Actions:

- Monitor Runtime
- Monitor Load
- Await Utility Restoration

Purpose:

Avoid unnecessary shutdowns during short-duration outages.

---

### Phase 3

Controlled Shutdown Decision

Triggered by:

- Runtime Threshold Reached
- Low Battery Condition
- Extended Outage

Actions:

- Begin Automated Shutdown Sequence

---

# Automated Shutdown Sequence

## Phase 1

Stop Tier 3 Services

Services:

- Plex
- Tautulli
- MeTube
- qBittorrent
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Prowlarr
- Overseerr
- Gluetun

Purpose:

Reduce load and preserve runtime.

---

## Phase 2

Shutdown JAX

Purpose:

Protect application data.

Affected Services:

- Vaultwarden
- Immich
- Nextcloud
- Paperless-ngx
- BookStack
- Audiobookshelf
- Navidrome

---

## Phase 3

Shutdown Infrastructure Hosts

Recommended Order:

```text
MAX
        ↓
DAX
        ↓
PAX
```

Purpose:

Preserve service integrity while protecting storage infrastructure.

---

## Phase 4

Maintain Network Infrastructure

Keep online for as long as practical:

- UDM-Pro
- Core Switching
- Wireless Infrastructure

Purpose:

Maintain visibility and recovery access.

---

# Power Restoration Procedure

## Phase 1

Verify Utility Power Stability.

Confirm:

- Utility Power Restored
- Voltage Stable
- No Active Power Events

---

## Phase 2

Verify UPS Status.

Confirm:

- No UPS Alarms
- Battery Status Healthy
- Runtime Restored
- Communication Functional

---

## Phase 3

Restore Network Infrastructure

Order:

```text
UDM-Pro
        ↓
Switching
        ↓
Wireless
```

---

## Phase 4

Restore Compute Infrastructure

Order:

```text
PAX
        ↓
DAX
        ↓
MAX
        ↓
JAX
```

---

## Phase 5

Validate Critical Services

Tier 1 Services:

- AdGuard
- OpenMediaVault
- Vaultwarden
- Home Assistant
- Immich
- Paperless-ngx
- Nextcloud
- BookStack

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

## Phase 6

Validate Tier 2 Services

- Homepage
- Uptime Kuma
- Audiobookshelf
- Navidrome
- Syncthing

---

## Phase 7

Validate Tier 3 Services

- Plex
- ARR Platform
- Tautulli
- MeTube
- Stirling-PDF

---

# Recovery Priorities

## Tier 1

Restore First.

Services:

- DNS Services
- OpenMediaVault
- Vaultwarden
- Home Assistant
- Immich
- Paperless-ngx
- Nextcloud
- BookStack

---

## Tier 2

Restore Second.

Services:

- Homepage
- Uptime Kuma
- Audiobookshelf
- Navidrome
- Syncthing

---

## Tier 3

Restore Third.

Services:

- Plex
- ARR Platform
- Tautulli
- MeTube
- Stirling-PDF

Reference:

RECOVERY-TIME-OBJECTIVES.md

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
Controlled Service Shutdown
```

---

## Extended Outage

Expected Result:

```text
Complete Infrastructure Shutdown
Clean Recovery
```

---

# Maintenance Schedule

## Monthly

Verify:

- UPS Status
- Battery Health
- Runtime Estimates
- UPS Connectivity
- Alerting

---

## Quarterly

Perform:

- NUT Validation
- Alert Validation
- Shutdown Validation
- Recovery Procedure Review

Reference:

OPERATIONS-RUNBOOK.md

---

## Annual

Perform:

- Controlled Shutdown Test
- Recovery Exercise
- Runtime Review
- Capacity Review

Reference:

DISASTER-RECOVERY.md

---

# Failure Scenarios

## Utility Power Loss

Impact:

```text
Temporary Battery Operation
```

Response:

Execute standard power failure process.

---

## UPS Failure

Impact:

```text
Reduced Protection Capacity
```

Response:

- Identify Failed Unit
- Reassign Critical Loads
- Replace UPS
- Validate Monitoring

---

## Battery Failure

Impact:

```text
Reduced Runtime Protection
```

Response:

- Replace Battery
- Perform Self-Test
- Verify Runtime

---

## NUT Failure

Impact:

```text
Loss Of Automated UPS Management
```

Response:

- Restore NUT Service
- Validate Communication
- Validate Alerting

---

# Operational Readiness Requirements

Power infrastructure is operationally ready when:

✅ UPS Systems Operational

✅ NUT Operational

✅ Monitoring Operational

✅ Shutdown Procedures Documented

✅ Recovery Procedures Documented

✅ Recovery Validation Current

Reference:

- service-readiness-matrix.md
- operations-readiness-assessment.md

---

# Certification Requirements

Power infrastructure certification requires:

✅ UPS Monitoring Operational

✅ NUT Operational

✅ Alerting Validated

✅ Shutdown Procedures Tested

✅ Recovery Procedures Tested

✅ Annual Validation Performed

Reference:

ENVIRONMENT-CERTIFICATION.md

---

# Validation Checklist

- [ ] UPS Inventory Verified
- [ ] NUT Operational
- [ ] Runtime Reporting Functional
- [ ] Power Failure Alerts Tested
- [ ] Low Battery Alerts Tested
- [ ] Shutdown Sequence Validated
- [ ] Recovery Procedures Validated
- [ ] Documentation Current

---

# Success Criteria

The power and UPS architecture is considered operational when:

- UPS Protection Is Operational
- Critical Infrastructure Is Protected
- Monitoring Is Operational
- NUT Is Operational
- Graceful Shutdown Functions
- Recovery Procedures Are Validated
- Certification Requirements Are Met
- Documentation Reflects Reality

Power protection is a foundational infrastructure capability and must remain aligned with operational, recovery, and certification requirements.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Rewritten to align with service inventory, recovery architecture, operational readiness framework, monitoring standards, and certification model |
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Power and UPS Architecture |
