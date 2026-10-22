# Sprints

## Purpose

This directory contains the executable deployment plan for the WoogleNet environment.

Unlike the architecture and design documents, sprint documents are intended to be actively worked from during implementation.

Each sprint represents a discrete body of work with:

- Clear objectives
- Defined prerequisites
- Detailed tasks
- Validation procedures
- Exit criteria
- Lessons learned

The sprint system provides a structured path from documented design to operational environment.

---

# Sprint Philosophy

## Core Principles

1. Complete one sprint before starting the next.
2. Validate every sprint before moving forward.
3. Update documentation as work is completed.
4. Prefer incremental progress over large deployments.
5. Verify reality matches documentation.
6. Never skip validation steps.
7. Lessons learned should be captured during execution.

---

# Sprint Structure

Each sprint document should follow the same format.

```text
Sprint Goal

Prerequisites

Tasks

Validation

Exit Criteria

Documentation Updates

Lessons Learned
```

---

# Sprint Lifecycle

## Planned

Sprint has been documented but work has not started.

Status:

```text
Planned
```

---

## In Progress

Sprint work is actively being executed.

Status:

```text
In Progress
```

---

## Blocked

Sprint cannot continue due to unresolved issues.

Status:

```text
Blocked
```

Examples:

- Hardware issue
- Missing equipment
- Dependency failure
- Design conflict

---

## Complete

Sprint objectives have been met.

Status:

```text
Complete
```

Requirements:

- Tasks completed
- Validation completed
- Documentation updated

---

# Sprint Roadmap

## Sprint 00

Document:

```text
SPRINT-00-HARDWARE-VALIDATION.md
```

Purpose:

```text
Validate Hardware Inventory
```

Status:

```text
Planned
```

---

## Sprint 01

Document:

```text
SPRINT-01-NETWORK-FOUNDATION.md
```

Purpose:

```text
Deploy VLANs
DHCP
Firewall Rules
Wireless Networks
```

Status:

```text
Planned
```

---

## Sprint 02

Document:

```text
SPRINT-02-PROXMOX-PLATFORM.md
```

Purpose:

```text
Deploy DAX
Deploy MAX
Deploy PAX
```

Status:

```text
Planned
```

---

## Sprint 03

Document:

```text
SPRINT-03-CORE-INFRASTRUCTURE.md
```

Purpose:

```text
Deploy DNS
Monitoring
Remote Access
```

Status:

```text
Planned
```

---

## Sprint 04

Document:

```text
SPRINT-04-STORAGE-PLATFORM.md
```

Purpose:

```text
Deploy OpenMediaVault
Create Shares
Create Storage Structure
```

Status:

```text
Planned
```

---

## Sprint 05

Document:

```text
SPRINT-05-DAY1-SERVICES.md
```

Purpose:

```text
Deploy Plex
Deploy Audiobookshelf
Deploy Immich
```

Status:

```text
Planned
```

---

## Sprint 06

Document:

```text
SPRINT-06-DAY2-SERVICES.md
```

Purpose:

```text
Home Assistant

Vaultwarden

ARR Stack

Navidrome

MeTube

Tautulli

Stirling-PDF
```

Status:

```text
Planned
```

---

## Sprint 07

Document:

```text
SPRINT-07-KNOWLEDGE-PLATFORM.md
```

Purpose:

```text
Paperless
Nextcloud
Syncthing
BookStack
```

Status:

```text
Planned
```

---

## Sprint 08

Document:

```text
SPRINT-08-BACKUP-AND-RECOVERY.md
```

Purpose:

```text
Kopia
OneDrive
Restore Validation
```

Status:

```text
Planned
```

---

## Sprint 09

Document:

```text
SPRINT-09-SECURITY-HARDENING.md
```

Purpose:

```text
MFA
SSH Hardening
Validation
```

Status:

```text
Planned
```

---

## Sprint 10

Document:

```text
SPRINT-10-OPERATIONS-READINESS.md
```

Purpose:

```text
Operational Validation
Documentation Review
Production Readiness
```

Status:

```text
Planned
```

---

# Execution Order

```text
Sprint 00
    ↓
Sprint 01
    ↓
Sprint 02
    ↓
Sprint 03
    ↓
Sprint 04
    ↓
Sprint 05
    ↓
Sprint 06
    ↓
Sprint 07
    ↓
Sprint 08
    ↓
Sprint 09
    ↓
Sprint 10
```

---

# Documentation Requirements

Each sprint completion should trigger review of:

- PROJECT-CHECKLIST.md
- SPRINT-PLAN.md
- Relevant Architecture Documents
- Relevant Infrastructure Documents
- Relevant Operations Documents

---

# Change Control

If sprint execution results in architectural changes:

1. Update the affected documentation.
2. Record the decision in:
   ```text
   SERVICE-DECISIONS.md
   ```
3. Update the sprint record.
4. Update the project checklist.

---

# Lessons Learned

Each sprint should include a section for:

```text
What Worked

What Failed

Documentation Corrections

Future Improvements
```

These notes become valuable for future rebuilds and expansions.

---

# Success Criteria

The sprint framework is considered complete when:

- All sprint documents exist
- Sprint dependencies are documented
- Validation criteria are defined
- Status tracking is operational

---

# Related Documents

- PROJECT-CHECKLIST.md
- SPRINT-PLAN.md
- DOCUMENT-INDEX.md
- SERVICE-DECISIONS.md
- OPERATIONS-RUNBOOK.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint Framework |
