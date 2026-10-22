# Sprint 00 - Hardware Validation

## Sprint Information

| Property | Value |
|----------|----------|
| Sprint ID | Sprint 00 |
| Name | Hardware Validation |
| Status | Active |
| Priority | Critical |
| Estimated Duration | 1-2 Weeks |
| Owner | Eric Yacoub |

---

# Sprint Goal

Verify that all physical infrastructure matches the documented architecture before any deployment work begins.

The outcome of this sprint is a verified and trusted inventory that forms the baseline for all future implementation work.

No production deployments should occur until this sprint is completed.

---

# Success Criteria

Sprint 00 is complete when:

- All servers are identified and verified
- Rack layout is verified
- Network equipment is verified
- UPS inventory is verified
- Patch panels are audited
- Wall drops are validated
- Configuration backups are exported
- Documentation reflects reality

---

# Prerequisites

## Required Documents

- HARDWARE-INVENTORY.md
- RACK-LAYOUT.md
- CABLING.md
- POWER-AND-UPS.md
- SPRINT-PLAN.md

---

## Required Tools

- Flashlight
- Label Maker
- Smartphone Camera
- USB Drive
- Notebook
- Network Cable Tester (if available)

---

# Server Validation

## DAX

### Physical Verification

- [ ] Confirm physical location
- [ ] Record manufacturer
- [ ] Record model
- [ ] Record asset tag
- [ ] Photograph front
- [ ] Photograph rear

### Hardware Verification

- [ ] Verify CPU model
- [ ] Verify CPU count
- [ ] Verify RAM installed
- [ ] Verify RAID controller
- [ ] Verify NIC count
- [ ] Verify drive count
- [ ] Verify drive sizes

### Documentation Updates

- [ ] Update HARDWARE-INVENTORY.md

---

## MAX

### Physical Verification

- [ ] Confirm physical location
- [ ] Record manufacturer
- [ ] Record model
- [ ] Record asset tag
- [ ] Photograph front
- [ ] Photograph rear

### Hardware Verification

- [ ] Verify CPU model
- [ ] Verify CPU count
- [ ] Verify RAM installed
- [ ] Verify RAID controller
- [ ] Verify NIC count
- [ ] Verify drive count
- [ ] Verify drive sizes

### Documentation Updates

- [ ] Update HARDWARE-INVENTORY.md

---

## PAX

### Physical Verification

- [ ] Confirm physical location
- [ ] Record manufacturer
- [ ] Record model
- [ ] Record asset tag
- [ ] Photograph front
- [ ] Photograph rear

### Hardware Verification

- [ ] Verify CPU model
- [ ] Verify CPU count
- [ ] Verify RAM installed
- [ ] Verify RAID controller
- [ ] Verify NIC count
- [ ] Verify drive count
- [ ] Verify drive sizes

### Storage Validation

- [ ] Verify PERC H700
- [ ] Verify battery status
- [ ] Verify firmware version

### Documentation Updates

- [ ] Update HARDWARE-INVENTORY.md
- [ ] Update STORAGE-ARCHITECTURE.md

---

## JAX

### Identification

- [ ] Confirm host identity
- [ ] Confirm physical location
- [ ] Verify rack mounted or shelf mounted
- [ ] Confirm if Dell Precision T5810

### Hardware Verification

- [ ] Verify CPU
- [ ] Verify RAM
- [ ] Verify SSD inventory
- [ ] Verify expansion cards

### GPU Verification

- [ ] Verify RTX 3060
- [ ] Verify 12GB VRAM
- [ ] Verify GTX 1070
- [ ] Verify 8GB VRAM

### Documentation Updates

- [ ] Update HARDWARE-INVENTORY.md
- [ ] Update AI-SERVICES.md
- [ ] Remove any JAX/SAX ambiguity

---

# Network Infrastructure Validation

## UDM-Pro

### Verification

- [ ] Record firmware version
- [ ] Record serial number
- [ ] Export configuration backup
- [ ] Verify Internet connectivity

### Documentation Updates

- [ ] Update HARDWARE-INVENTORY.md

---

## Switch 01

- [ ] Verify model
- [ ] Verify firmware
- [ ] Export configuration

---

## Switch 02

- [ ] Verify model
- [ ] Verify firmware
- [ ] Export configuration

---

## Switch 03

- [ ] Verify model
- [ ] Determine intended purpose
- [ ] Determine if still required

---

# Access Point Validation

## Inventory Verification

- [ ] Verify 4x UniFi AC LR
- [ ] Verify 3x UniFi AC Pro

---

## Per Access Point

- [ ] Record serial number
- [ ] Record MAC address
- [ ] Record location
- [ ] Photograph device

---

# Rack Validation

## Network Section

- [ ] Verify U01 UDM-Pro
- [ ] Verify U03 Switch 01
- [ ] Verify U05 Switch 02
- [ ] Verify U07 Switch 03

---

## Patch Panels

- [ ] Verify U02 Patch Panel
- [ ] Verify U04 Patch Panel
- [ ] Verify U06 Patch Panel
- [ ] Verify U08 Patch Panel

---

## Console Section

- [ ] Verify U12 Monitor
- [ ] Verify U16 Shelf
- [ ] Verify U21 Shelf
- [ ] Verify U23 KVM

---

## Compute Section

- [ ] Verify DAX U24-U25
- [ ] Verify MAX U26-U27
- [ ] Verify JAX Location
- [ ] Verify PAX U30-U31

---

## Documentation Updates

- [ ] Update RACK-LAYOUT.md

---

# UPS Validation

## Inventory

### Tripp Lite

- [ ] Verify Quantity 3
- [ ] Record serial numbers
- [ ] Record battery age

---

### APC

- [ ] Verify Quantity 2
- [ ] Record serial numbers
- [ ] Record battery age

---

## Device Mapping

### UPS-A

- [ ] Identify connected devices

### UPS-B

- [ ] Identify connected devices

### UPS-C

- [ ] Identify connected devices

### UPS-D

- [ ] Identify connected devices

### UPS-E

- [ ] Identify connected devices

---

## Documentation Updates

- [ ] Update POWER-AND-UPS.md

---

# Cabling Audit

## Patch Panels

- [ ] Map Patch Panel 01
- [ ] Map Patch Panel 02
- [ ] Map Patch Panel 03
- [ ] Map Patch Panel 04

---

## Room Drops

### Office

- [ ] Verify Drop 01
- [ ] Verify Drop 02
- [ ] Verify Drop 03
- [ ] Verify Drop 04

---

### Living Room

- [ ] Verify Drop 01
- [ ] Verify Drop 02
- [ ] Verify Drop 03
- [ ] Verify Drop 04

---

### Bedrooms

- [ ] Verify Bedroom 1
- [ ] Verify Bedroom 2
- [ ] Verify Bedroom 3
- [ ] Verify Bedroom 4
- [ ] Verify Bedroom 5

---

## Access Point Drops

- [ ] Verify Hall AP Drop
- [ ] Verify Main Room AP Drop

---

## Label Audit

- [ ] Identify unlabeled drops
- [ ] Label missing drops
- [ ] Document mappings

---

## Documentation Updates

- [ ] Update CABLING.md

---

# Configuration Backup Collection

## Export Required

- [ ] UDM-Pro Backup
- [ ] Switch 01 Backup
- [ ] Switch 02 Backup
- [ ] Switch 03 Backup
- [ ] UniFi Configuration Export

---

# Documentation Review

## Verification

- [ ] Host assignments verified
- [ ] Service locations verified
- [ ] Rack positions verified
- [ ] Network equipment verified
- [ ] UPS information verified

---

## Repository Updates

- [ ] README.md Updated
- [ ] DOCUMENT-INDEX.md Updated
- [ ] HARDWARE-INVENTORY.md Updated
- [ ] RACK-LAYOUT.md Updated
- [ ] POWER-AND-UPS.md Updated
- [ ] CABLING.md Updated

---

# Lessons Learned

## What Worked

```text
(To be completed during execution)
```

---

## What Failed

```text
(To be completed during execution)
```

---

## Documentation Corrections

```text
(To be completed during execution)
```

---

# Exit Criteria

Sprint 00 cannot be closed until:

- [ ] All hardware is verified
- [ ] All configuration exports exist
- [ ] UPS mappings are complete
- [ ] Rack layout is validated
- [ ] Cabling audit is complete
- [ ] Documentation updates are complete
- [ ] No unknown infrastructure components remain

---

# Sprint Outcome

## Start Date

```text
TBD
```

## Completion Date

```text
TBD
```

## Final Status

```text
Planned
```

## Notes

```text
This sprint establishes the authoritative baseline for all future deployment work.
No implementation sprint should begin until Sprint 00 is complete.
```