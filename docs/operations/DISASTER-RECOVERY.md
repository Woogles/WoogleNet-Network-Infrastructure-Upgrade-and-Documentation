# Disaster Recovery

## Purpose

This document defines the Disaster Recovery (DR) strategy for the WoogleNet environment.

The goals of this document are:

- Restore services after failure
- Recover critical data
- Document recovery procedures
- Establish restoration priorities
- Minimize downtime
- Preserve family and personal data

This document should be reviewed whenever infrastructure, storage, or backup systems change.

---

# Recovery Objectives

## Recovery Philosophy

The environment is designed to be:

```text
Recoverable
Not Highly Available
```

The primary objective is rapid restoration rather than zero downtime.

---

## Recovery Targets

| Objective | Target |
|------------|------------|
| Critical Service Recovery | Same Day |
| Infrastructure Recovery | Within Hours |
| Important Service Recovery | Within 72 Hours |
| Full Environment Recovery | Within 7 Days |

---

# Recovery Priorities

## Priority 1

Restore immediately.

### Services

- DNS
- Storage
- Immich
- Vaultwarden
- Paperless-ngx
- Nextcloud
- Home Assistant
- BookStack

---

## Priority 2

Restore after critical services.

### Services

- Homepage
- Uptime Kuma
- Audiobookshelf
- Navidrome

---

## Priority 3

Restore when time permits.

### Services

- Plex
- qBittorrent
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Overseerr

---

# Recovery Dependencies

```text
Internet
     ↓
UDM-Pro
     ↓
Switching
     ↓
Storage
     ↓
DNS
     ↓
Critical Services
     ↓
Remaining Services
```

---

# Recovery Documentation Locations

## Primary Location

```text
GitHub Repository
```

---

## Secondary Location

```text
BookStack
```

---

## Offline Copy

```text
PDF Export
```

A current PDF version of all critical documentation should be maintained.

---

# Disaster Scenarios

## Single Disk Failure

### Symptoms

- RAID degraded
- Drive alerts
- SMART warnings

### Response

1. Identify failed drive.
2. Confirm RAID health.
3. Replace failed disk.
4. Verify rebuild completion.
5. Review logs.

### Recovery Priority

```text
High
```

---

# RAID Failure

## Symptoms

- Storage Pool Offline
- Multiple Disk Failures
- Unrecoverable RAID

### Response

1. Stop affected services.
2. Preserve failed hardware.
3. Restore storage platform.
4. Restore data from backup.
5. Validate recovered services.

### Recovery Priority

```text
Critical
```

---

# DAX Failure

## Impact

Potential loss of:

- AdGuard Primary
- Homepage
- Uptime Kuma

### Recovery Strategy

Restore workloads onto:

```text
MAX

or

PAX
```

whichever is available first.

### Recovery Steps

1. Confirm hardware failure.
2. Restore LXC backups.
3. Verify networking.
4. Validate services.
5. Reassign DNS if required.

---

# MAX Failure

## Impact

Potential loss of:

- AdGuard Secondary
- Home Assistant

### Recovery Strategy

Restore onto:

```text
DAX

or

PAX
```

---

### Recovery Steps

1. Confirm failure.
2. Restore Home Assistant VM.
3. Restore AdGuard Secondary.
4. Validate DNS redundancy.

---

# PAX Failure

## Impact

Potential loss of:

- OpenMediaVault

### Recovery Priority

```text
Critical
```

---

### Recovery Steps

1. Restore OpenMediaVault VM backup.
2. Attach storage.
3. Validate shares.
4. Restore backup repository access.
5. Verify service mounts.

---

# OpenMediaVault Failure

## Preferred Recovery Method

```text
Restore OMV VM Backup
```

### Recovery Steps

1. Restore OMV VM.
2. Verify virtual networking.
3. Attach storage devices.
4. Verify shares.
5. Verify backup repositories.
6. Validate application mounts.

---

# JAX Failure

## Impact

Potential loss of:

- Immich
- Vaultwarden
- Plex
- ARR Stack
- BookStack
- Paperless
- Nextcloud
- Audiobookshelf
- AI Platform

### Recovery Priority

```text
Critical
```

---

## Recovery Method

```text
Hybrid
```

Restore critical services first.

Rebuild lower-priority services as needed.

---

### Recovery Steps

1. Replace hardware.
2. Install Ubuntu.
3. Install Docker.
4. Restore storage mappings.
5. Restore critical applications.
6. Restore important services.
7. Restore media services.
8. Restore AI environment.

---

# UDM-Pro Failure

## Backup Hardware

```text
USG Pro
```

---

## Recovery Strategy

Restore configuration backup.

### Recovery Steps

1. Remove failed UDM-Pro.
2. Deploy USG Pro.
3. Restore latest configuration.
4. Validate routing.
5. Validate VLANs.
6. Validate DHCP.
7. Validate Internet connectivity.

---

# Switch Failure

## Impact

Loss of connected devices.

### Recovery Steps

1. Identify failed switch.
2. Replace switch.
3. Restore configuration.
4. Validate VLAN assignments.
5. Validate trunk ports.

---

# Internet Failure

## Recovery Priority

```text
Low
```

Most internal services remain operational.

### Impacted Services

- Remote Access
- Offsite Backup
- Software Updates

---

### Recovery Steps

1. Verify ISP outage.
2. Verify modem.
3. Verify WAN configuration.
4. Escalate to ISP if required.

---

# Power Failure

## UPS Strategy

Platform:

```text
Network UPS Tools (NUT)
```

---

## Shutdown Threshold

```text
5 Minutes
```

on battery before shutdown begins.

---

## Shutdown Order

### Step 1

Gracefully stop:

- Plex
- ARR Stack
- Audiobookshelf

### Step 2

Shutdown:

- JAX

### Step 3

Shutdown:

- DAX
- MAX
- PAX

### Step 4

Maintain:

- UDM-Pro
- Switches

as long as battery permits.

---

# Accidental Deletion

## Recovery Method

Use:

```text
Kopia
```

backup repository.

---

### Recovery Steps

1. Identify affected data.
2. Determine deletion time.
3. Restore previous version.
4. Validate recovered files.

---

# Ransomware Event

## Response

Immediately:

1. Disconnect affected systems.
2. Disable network access.
3. Preserve evidence.
4. Verify backups.
5. Restore from clean backups.

### Recovery Priority

```text
Critical
```

---

# Total Site Loss

## Definition

Complete loss of:

- Building
- Hardware
- Local Storage

---

## Recovery Sources

### Available

- GitHub Documentation
- OneDrive Backups
- Configuration Exports

---

## Recovery Steps

1. Obtain replacement hardware.
2. Restore network infrastructure.
3. Restore storage platform.
4. Restore backups.
5. Restore critical services.
6. Restore remaining services.

---

# Backup Validation

## Schedule

```text
Quarterly
```

---

## Validation Requirements

Verify:

- Backup Integrity
- Restore Procedure
- Service Startup
- Data Availability
- User Access

---

# Emergency Contacts

## Internal

| Role | Owner |
|---------|---------|
| Primary Administrator | Eric Yacoub |

---

## Critical Recovery Assets

| Asset | Location |
|----------|----------|
| GitHub Repository | Primary |
| BookStack | Secondary |
| PDF Export | Offline Copy |
| OneDrive Backups | Offsite |
| OMV Backup Repository | Local |

---

# Annual Review Checklist

- [ ] Validate backup jobs
- [ ] Validate OneDrive backups
- [ ] Validate restore procedures
- [ ] Review UPS shutdown behavior
- [ ] Update hardware inventory
- [ ] Update storage documentation
- [ ] Export current UDM-Pro configuration
- [ ] Export switch configurations
- [ ] Export Home Assistant backups
- [ ] Generate fresh PDF documentation archive

---

# Open Decisions

| Decision | Status |
|------------|------------|
| Automated DR Testing | TBD |
| Backup Integrity Automation | TBD |
| Long-Term Archive Strategy | TBD |
| Hardware Refresh Strategy | TBD |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Disaster Recovery Plan |