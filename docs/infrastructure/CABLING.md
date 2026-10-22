# Cabling

## Purpose

This document serves as the authoritative reference for structured cabling within the WoogleNet environment.

The goals of this document are:

- Track cable runs
- Track patch panel assignments
- Track room connectivity
- Standardize labeling
- Simplify troubleshooting
- Support future expansion

This document should be updated whenever cabling is added, moved, relabeled, or removed.

---

# Cabling Standards

## Cabling Type

| Property | Value |
|----------|----------|
| Cable Type | Cat6 |
| Fiber Present | No |
| Patch Panels Installed | Yes |
| Cable Management Installed | Yes |
| Current Labeling | Partially Complete |

---

# Design Principles

## Standards

1. Every cable should have a unique identifier.
2. Every wall jack should map to a patch panel port.
3. Every patch panel port should be documented.
4. Active switch ports should be documented.
5. Future AP drops should be reserved and tracked.
6. Cable labels should exist on both ends.

---

# Cabling Architecture

## Overview

```text
Wall Drops
     │
     ▼
Patch Panels
     │
     ▼
Switches
     │
     ▼
Network Services
```

---

# Cabling Inventory

## Estimated Installed Drops

| Type | Count |
|----------|----------|
| Wall Drops | ~25 |
| Dedicated AP Drops | 2 |
| Future AP Locations | TBD |
| Fiber Links | 0 |

---

# Room Connectivity

## Office

### Installed Drops

```text
4
```

### Usage

Examples:

- Desktop
- Docking Station
- Printer
- Future Expansion

---

## Living Room

### Installed Drops

```text
4
```

### Usage

Examples:

- Media Streamers
- Smart TV
- Gaming Devices
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

# Wireless Infrastructure Drops

## Upstairs Hall

### Purpose

```text
Dedicated Access Point
```

### Status

Installed

---

## Main Room

### Purpose

```text
Dedicated Access Point
```

### Status

Installed

---

# Future Access Point Locations

Additional APs may use existing wall drops.

### Status

```text
TBD
```

---

# Patch Panel Layout

## Patch Panel 01

Rack Location:

```text
U02
```

Status:

```text
Requires Mapping
```

---

## Patch Panel 02

Rack Location:

```text
U04
```

Status:

```text
Requires Mapping
```

---

## Patch Panel 03

Rack Location:

```text
U06
```

Status:

```text
Requires Mapping
```

---

## Patch Panel 04

Rack Location:

```text
U08
```

Status:

```text
Requires Mapping
```

---

# Switch Connectivity

## Switch 01

Rack Location:

```text
U03
```

Purpose:

- Infrastructure
- Patch Panel Uplinks
- Servers

---

## Switch 02

Rack Location:

```text
U05
```

Purpose:

- Client Devices
- Wireless Connectivity
- Future Expansion

---

## Switch 03

Rack Location:

```text
U07
```

Status:

```text
Reserved / Future Use
```

---

# Labeling Standard

## Patch Panel Labels

Format:

```text
PP01-01
PP01-02
PP01-03
```

---

## Wall Jack Labels

Format:

```text
OFF-01
OFF-02
OFF-03

LR-01
LR-02

BR1-01
BR2-01
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

# Recommended Room Labels

| Location | Prefix |
|----------|----------|
| Office | OFF |
| Living Room | LR |
| Bedroom 1 | BR1 |
| Bedroom 2 | BR2 |
| Bedroom 3 | BR3 |
| Bedroom 4 | BR4 |
| Bedroom 5 | BR5 |
| Upstairs Hall AP | AP01 |
| Main Room AP | AP02 |

---

# Current Documentation Status

## Verified

- Rack Patch Panel Locations
- Switch Locations
- Approximate Drop Count
- AP Drop Locations

---

## Requires Verification

- Patch Panel Port Mapping
- Wall Jack Numbering
- Active Switch Port Assignments
- Unlabeled Cable Identification

---

# Cabling Audit Procedure

## Step 1

Identify unlabeled drops.

---

## Step 2

Tone and trace cable.

---

## Step 3

Confirm room termination.

---

## Step 4

Apply label at both ends.

---

## Step 5

Update documentation.

---

# Future Improvements

## Recommended

- Complete cable labeling
- Document switch ports
- Document patch panel mappings
- Reserve AP locations
- Color-code patch cables

---

## Suggested Cable Colors

| Function | Color |
|----------|----------|
| Infrastructure | Red |
| Servers | Blue |
| Access Points | Yellow |
| Trusted Client Connections | White |
| IoT | Green |
| Guest | Gray |

---

# Pending Tasks

- [ ] Map Patch Panel 01
- [ ] Map Patch Panel 02
- [ ] Map Patch Panel 03
- [ ] Map Patch Panel 04
- [ ] Label Unlabeled Drops
- [ ] Validate All AP Drops
- [ ] Document Switch Port Usage
- [ ] Create Final Port Map

---

# Open Decisions

| Item | Status |
|----------|----------|
| Final Patch Panel Mapping | Pending |
| Future AP Locations | Pending |
| Switch Port Documentation | Pending |
| Color Standard Adoption | Pending |

---

# Related Documents

- RACK-LAYOUT.md
- NETWORK-TOPOLOGY.md
- IP-ADDRESS-PLAN.md
- POWER-AND-UPS.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Cabling Documentation |