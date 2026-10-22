# Sprint 00 - Hardware Validation

## Purpose

Sprint 00 establishes the authoritative baseline for the WoogleNet environment.

This sprint focuses on validation rather than deployment.

The objective is to ensure that:

- Physical hardware matches documentation
- Network infrastructure is accurately inventoried
- Rack layout is validated
- Power infrastructure is documented
- Cabling is understood
- Configuration backups exist
- Documentation reflects reality

No infrastructure or service deployment work should begin until Sprint 00 is complete.

---

# Sprint Objectives

## Primary Goals

- Validate server hardware
- Validate network hardware
- Validate UPS infrastructure
- Validate rack layout
- Validate cabling
- Export configuration backups
- Update documentation

---

## Secondary Goals

- Eliminate unknowns
- Capture evidence
- Establish inventory standards
- Improve future troubleshooting

---

# Sprint Deliverables

Upon completion, the following should exist:

```text
Verified Hardware Inventory

Verified Rack Layout

Verified UPS Inventory

Verified Access Point Inventory

Verified Switch Inventory

Verified Patch Panel Mapping

Configuration Backups

Updated Documentation

Evidence Archive
```

---

# Directory Structure

```text
deployment/
└── sprint-00/
    │
    ├── README.md
    ├── checklists/
    ├── templates/
    ├── inventory/
    ├── scripts/
    ├── exports/
    └── evidence/
```

---

# Execution Order

Sprint 00 should be completed in the following order.

## Step 1

Hardware Inventory

Reference:

```text
inventory/
templates/server-inventory-template.md
```

Deliverables:

```text
dax-inventory.md
max-inventory.md
pax-inventory.md
jax-inventory.md
```

---

## Step 2

Network Validation

Review:

- UDM-Pro
- Switches
- Access Points

Export:

- Configurations
- Firmware Versions
- Serial Numbers

Store:

```text
exports/
```

and

```text
evidence/network/
```

---

## Step 3

Rack Validation

Validate:

- Rack Positions
- Shelves
- Monitor
- KVM
- UPS Locations

Store:

```text
evidence/rack/
```

---

## Step 4

UPS Validation

Document:

- Models
- Serial Numbers
- Battery Status
- Connected Equipment

Populate:

```text
ups-inventory.md
```

and

```text
ups-mapping-template.md
```

---

## Step 5

Cabling Audit

Validate:

- Patch Panels
- Wall Drops
- AP Drops
- Existing Labels

Document:

- Missing Labels
- Patch Panel Mapping

Populate:

```text
patch-panel-mapping-template.csv
```

---

## Step 6

Configuration Backup Collection

Collect:

### UDM-Pro

```text
Configuration Export
```

---

### Switches

```text
Configuration Exports
```

---

### Access Points

```text
Configuration Export
```

---

Store:

```text
exports/
```

---

## Step 7

Documentation Updates

Review:

- HARDWARE-INVENTORY.md
- RACK-LAYOUT.md
- POWER-AND-UPS.md
- CABLING.md
- NETWORK-TOPOLOGY.md

Update all discovered inaccuracies.

---

# Inventory Standards

## Every Device Should Include

### Identification

- Hostname
- Manufacturer
- Model
- Serial Number

---

### Hardware

- CPU
- RAM
- Storage
- Network Interfaces

---

### Location

- Rack Position
- UPS Assignment
- Network Assignment

---

### Supporting Evidence

- Front Photo
- Rear Photo
- Configuration Export

---

# Evidence Collection Standards

## Photos

Required:

### Servers

- Front
- Rear

---

### Rack

- Full Front
- Full Rear

---

### UPS

- Front Panel
- Status Display

---

### Cabling

- Patch Panels
- AP Locations
- Wall Drops

---

## Naming Convention

Examples:

```text
dax-front.jpg
dax-rear.jpg

ups-a-front.jpg

rack-front-full.jpg
rack-rear-full.jpg
```

---

# Documentation Requirements

Any discrepancy discovered during Sprint 00 must result in:

1. Documentation correction.
2. Updated inventory.
3. Updated evidence.

---

## Never Leave Documentation Incorrect

Use:

```text
Unknown
```

or

```text
TBD
```

instead of guessing.

---

# Exit Criteria

Sprint 00 is complete when:

## Hardware

- [ ] DAX Verified
- [ ] MAX Verified
- [ ] PAX Verified
- [ ] JAX Verified

---

## Network

- [ ] UDM-Pro Verified
- [ ] Switch Inventory Verified
- [ ] AP Inventory Verified

---

## Rack

- [ ] Rack Layout Verified

---

## Power

- [ ] UPS Inventory Verified
- [ ] UPS Mapping Complete

---

## Cabling

- [ ] Patch Panels Audited
- [ ] Drop Inventory Verified
- [ ] AP Drops Verified

---

## Backups

- [ ] UDM Export Completed
- [ ] Switch Exports Completed
- [ ] AP Exports Completed

---

## Documentation

- [ ] Hardware Inventory Updated
- [ ] Rack Layout Updated
- [ ] Power Documentation Updated
- [ ] Cabling Documentation Updated

---

## Repository

- [ ] Evidence Stored
- [ ] Inventory Stored
- [ ] Templates Completed

---

# Expected Outcomes

At completion of Sprint 00:

```text
Hardware inventory is trusted.

Rack inventory is trusted.

Network inventory is trusted.

Power inventory is trusted.

Documentation reflects reality.

Future deployment work can proceed with confidence.
```

---

# Risks

## Common Discovery Issues

Examples:

- Incorrect RAM values
- Unknown disk layouts
- Missing labels
- Unused equipment
- Outdated documentation
- Missing backups

Discovery of these issues is expected and desirable.

---

# Success Definition

Sprint 00 is successful if the environment is fully understood.

The goal is not deployment.

The goal is eliminating uncertainty.

---

# References

- SPRINT-00-HARDWARE-VALIDATION.md
- HARDWARE-INVENTORY.md
- RACK-LAYOUT.md
- CABLING.md
- POWER-AND-UPS.md
- NETWORK-TOPOLOGY.md
- PROJECT-CHECKLIST.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Sprint 00 Operations Guide |