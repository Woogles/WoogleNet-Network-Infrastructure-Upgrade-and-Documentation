# CABLING

## Purpose

This document serves as the authoritative reference for structured cabling within the WoogleNet environment.

The purpose of this document is to:

- Document Physical Network Connectivity
- Document Patch Panel Infrastructure
- Document Room Connectivity
- Define Labeling Standards
- Support Troubleshooting
- Support Maintenance Activities
- Support Rack Documentation
- Support Network Recovery
- Support Operational Readiness
- Support Certification Activities

This document records known cabling information while providing standards and procedures for maintaining cabling documentation accuracy.

Reference Documents:

- ARCHITECTURE.md
- NETWORK-ARCHITECTURE.md
- RACK-LAYOUT.md
- HARDWARE-INVENTORY.md
- POWER-AND-UPS.md
- OPERATIONS-RUNBOOK.md
- ENVIRONMENT-CERTIFICATION.md

---

# Cabling Architecture

## High-Level Architecture

```text
Wall Jack
      ↓
Patch Panel
      ↓
Switch Port
      ↓
Network Services
```

All permanent structured cabling follows this design.

---

# Design Principles

## Core Principles

1. Every Cable Must Have An Identifier
2. Every Wall Jack Must Be Documented
3. Every Patch Panel Must Be Documented
4. Every Active Switch Port Should Be Identifiable
5. Labels Must Exist At Both Ends
6. Documentation Must Reflect Reality
7. Cabling Must Support Recovery Activities
8. Cabling Must Support Future Expansion

---

# Cabling Standards

## Cable Type

| Property | Value |
|----------|----------|
| Cable Type | Cat6 |
| Fiber Infrastructure | None Documented |
| Patch Panels Installed | Yes |
| Cable Management Installed | Yes |
| Status | Operational |

---

## Labeling Requirements

All structured cabling should be:

- Physically Labeled
- Traceable
- Documented
- Recoverable

---

# Structured Cabling Overview

## Cabling Flow

```text
Device
      ↓
Wall Jack
      ↓
Horizontal Cabling
      ↓
Patch Panel
      ↓
Switch
      ↓
Network Services
```

---

# Network Rooms & Connectivity

## Office

### Installed Drops

```text
4
```

Typical Devices:

- Desktop Systems
- Docking Stations
- Printers
- Future Expansion

---

## Living Room

### Installed Drops

```text
4
```

Typical Devices:

- Smart TV
- Streaming Devices
- Gaming Platforms
- Future Expansion

---

## Bedroom 1

### Installed Drops

```text
1
```

---

## Bedroom 2

### Installed Drops

```text
1
```

---

## Bedroom 3

### Installed Drops

```text
1
```

---

## Bedroom 4

### Installed Drops

```text
1
```

---

## Bedroom 5

### Installed Drops

```text
1
```

---

# Wireless Infrastructure Cabling

## Access Point Drop 01

Location:

```text
Upstairs Hall
```

Purpose:

```text
Wireless Access Point
```

Status:

```text
Operational
```

---

## Access Point Drop 02

Location:

```text
Main Room
```

Purpose:

```text
Wireless Access Point
```

Status:

```text
Operational
```

---

# Patch Panel Infrastructure

## Patch Panel 01

| Property | Value |
|----------|----------|
| Rack Location | U02 |
| Purpose | Structured Cabling Termination |
| Status | Operational |

---

## Patch Panel 02

| Property | Value |
|----------|----------|
| Rack Location | U04 |
| Purpose | Structured Cabling Termination |
| Status | Operational |

---

## Patch Panel 03

| Property | Value |
|----------|----------|
| Rack Location | U06 |
| Purpose | Structured Cabling Termination |
| Status | Operational |

---

## Patch Panel 04

| Property | Value |
|----------|----------|
| Rack Location | U08 |
| Purpose | Structured Cabling Termination |
| Status | Operational |

Reference:

RACK-LAYOUT.md

---

# Switch Connectivity

## Switch 01

Location:

```text
U03
```

Purpose:

- Infrastructure Systems
- Server Connectivity
- Core Network Functions

Reference:

RACK-LAYOUT.md

---

## Switch 02

Location:

```text
U05
```

Purpose:

- Client Devices
- Wireless Infrastructure
- User Connectivity

Reference:

RACK-LAYOUT.md

---

## Auxiliary Switch

Location:

```text
U07
```

Purpose:

```text
Expansion Capacity
```

Status:

```text
Reserved
```

---

# Labeling Standards

## Patch Panel Labels

Format:

```text
PP01-01
PP01-02
PP01-03
```

Pattern:

```text
PP##-##
```

---

## Wall Jack Labels

Format:

```text
OFF-01
OFF-02

LR-01
LR-02

BR1-01
BR2-01
```

Pattern:

```text
LOCATION-##
```

---

## Access Point Labels

Format:

```text
AP-01
AP-02
AP-03
```

---

# Room Label Standard

| Area | Prefix |
|----------|----------|
| Office | OFF |
| Living Room | LR |
| Bedroom 1 | BR1 |
| Bedroom 2 | BR2 |
| Bedroom 3 | BR3 |
| Bedroom 4 | BR4 |
| Bedroom 5 | BR5 |
| Access Point 01 | AP01 |
| Access Point 02 | AP02 |

---

# Cabling Documentation Standard

## Required Mapping Model

The preferred documentation hierarchy is:

```text
Wall Jack
      ↓
Patch Panel Port
      ↓
Switch Port
      ↓
VLAN
```

---

## Required Mapping Information

For each active connection document:

- Device Location
- Wall Jack Label
- Patch Panel Port
- Switch Port
- VLAN Assignment

Reference:

NETWORK-ARCHITECTURE.md

---

# Documentation Status

## Verified

The following information is currently documented:

✅ Patch Panel Locations

✅ Switch Locations

✅ Rack Locations

✅ AP Drop Locations

✅ Room Connectivity Inventory

✅ Labeling Standard

---

## Requires Physical Audit

The following information should be verified and documented through a future cabling audit:

⏳ Patch Panel Port Mapping

⏳ Wall Jack Mapping

⏳ Active Switch Port Assignments

⏳ Cable Identification Verification

⏳ End-to-End Physical Trace Validation

---

# Cabling Audit Procedure

## Step 1

Identify Unknown Or Unlabeled Drops.

---

## Step 2

Trace Physical Cabling.

Techniques:

- Visual Inspection
- Network Testing
- Cable Toner

---

## Step 3

Document:

- Wall Jack
- Patch Panel Port
- Switch Port

Relationships.

---

## Step 4

Apply Labels At Both Ends.

---

## Step 5

Update Documentation.

Reference:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

# Color Coding Standard

## Recommended Usage

| Function | Color |
|----------|----------|
| Infrastructure | Red |
| Servers | Blue |
| Access Points | Yellow |
| Trusted Clients | White |
| IoT Devices | Green |
| Guest Access | Gray |

---

# Recovery Considerations

## Cabling Recovery Priority

Physical recovery should occur in the following order:

```text
Power
      ↓
Network Infrastructure
      ↓
Patch Panels
      ↓
Switching
      ↓
Endpoints
```

Reference:

DISASTER-RECOVERY.md

---

## Critical Components

The following cabling components support Tier 1 recovery:

- Patch Panel Infrastructure
- Core Switching
- UDM-Pro Connectivity
- Server Connectivity
- Access Point Connectivity

---

# Maintenance Requirements

## Monthly

Verify:

- Cable Management Integrity
- Visible Label Integrity
- Rack Connectivity

---

## Quarterly

Verify:

- Patch Panel Documentation
- Switch Documentation
- AP Connectivity

---

## Annual

Perform:

- Cabling Audit
- Label Validation
- Documentation Review

Reference:

OPERATIONS-RUNBOOK.md

---

# Operational Readiness Requirements

Structured cabling is considered operationally ready when:

✅ Patch Panels Documented

✅ Switch Locations Documented

✅ AP Connectivity Documented

✅ Labeling Standard Defined

✅ Audit Procedure Defined

Reference:

operations-readiness-assessment.md

---

# Certification Requirements

Cabling certification requires:

✅ Patch Panels Documented

✅ Core Switching Documented

✅ Access Point Connectivity Documented

✅ Labeling Standard Established

✅ Audit Process Defined

✅ Documentation Current

Reference:

ENVIRONMENT-CERTIFICATION.md

---

# Validation Checklist

## Infrastructure

- [ ] Patch Panel 01 Verified
- [ ] Patch Panel 02 Verified
- [ ] Patch Panel 03 Verified
- [ ] Patch Panel 04 Verified

---

## Switching

- [ ] Switch 01 Verified
- [ ] Switch 02 Verified
- [ ] Auxiliary Switch Verified

---

## Wireless

- [ ] AP-01 Connectivity Verified
- [ ] AP-02 Connectivity Verified

---

## Documentation

- [ ] Labeling Standard Current
- [ ] Room Inventory Current
- [ ] Rack Locations Current
- [ ] Mapping Audit Current

---

# Success Criteria

The cabling program is considered current when:

- Patch Panel Infrastructure Is Documented
- Switch Infrastructure Is Documented
- Wireless Connectivity Is Documented
- Labeling Standards Are Applied
- Audit Procedures Are Defined
- Recovery Dependencies Are Understood
- Documentation Reflects Reality

Structured cabling is foundational infrastructure and must remain aligned with network architecture, rack layout, recovery requirements, and operational governance.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Rewritten as structured cabling inventory, cabling standard, operational readiness control, and certification artifact |
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Cabling Documentation |