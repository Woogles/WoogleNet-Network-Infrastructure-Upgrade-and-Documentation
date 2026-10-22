# Sprint 02 - Proxmox Platform

## Sprint Information

| Property | Value |
|----------|----------|
| Sprint ID | Sprint 02 |
| Name | Proxmox Platform |
| Status | Planned |
| Priority | Critical |
| Estimated Duration | 1-2 Weeks |
| Owner | Eric Yacoub |

---

# Sprint Goal

Deploy and validate the virtualization platform that will host the WoogleNet infrastructure.

This sprint establishes:

- DAX
- MAX
- PAX
- Proxmox management
- Storage configuration
- Networking configuration
- Backup preparation
- Tailscale connectivity

At completion, the virtualization platform should be ready for infrastructure services.

---

# Success Criteria

Sprint 02 is complete when:

- DAX operational
- MAX operational
- PAX operational
- Proxmox configured
- Host networking configured
- Management access functional
- Tailscale operational
- Configuration backups exported

---

# Prerequisites

## Required Sprint Completion

- [ ] Sprint 00 Complete
- [ ] Sprint 01 Complete

---

## Required Documentation

- HARDWARE-INVENTORY.md
- NETWORK-TOPOLOGY.md
- IP-ADDRESS-PLAN.md
- REMOTE-ACCESS.md
- SECURITY-BASELINE.md
- SERVICE-DECISIONS.md

---

# Phase 1 - Firmware Validation

## DAX

- [ ] Verify BIOS Version
- [ ] Verify RAID Firmware
- [ ] Verify NIC Firmware

---

## MAX

- [ ] Verify BIOS Version
- [ ] Verify RAID Firmware
- [ ] Verify NIC Firmware

---

## PAX

- [ ] Verify BIOS Version
- [ ] Verify RAID Firmware
- [ ] Verify NIC Firmware

---

# Phase 2 - Proxmox Installation

## DAX

### Installation

- [ ] Install Proxmox VE
- [ ] Configure Root Password
- [ ] Configure Hostname

Hostname:

```text
dax
```

---

### Networking

- [ ] Configure Management Interface
- [ ] Configure VLAN Awareness

Management IP:

```text
10.0.10.30
```

---

## MAX

### Installation

- [ ] Install Proxmox VE
- [ ] Configure Root Password
- [ ] Configure Hostname

Hostname:

```text
max
```

---

### Networking

- [ ] Configure Management Interface
- [ ] Configure VLAN Awareness

Management IP:

```text
10.0.10.31
```

---

## PAX

### Installation

- [ ] Install Proxmox VE
- [ ] Configure Root Password
- [ ] Configure Hostname

Hostname:

```text
pax
```

---

### Networking

- [ ] Configure Management Interface
- [ ] Configure VLAN Awareness

Management IP:

```text
10.0.10.32
```

---

# Phase 3 - Host Configuration

## Security

All Hosts

- [ ] Disable Root SSH
- [ ] Configure Strong Passwords
- [ ] Update Packages
- [ ] Verify Time Synchronization

---

## Networking

All Hosts

- [ ] Verify DNS Configuration
- [ ] Verify Gateway
- [ ] Verify Infrastructure VLAN Connectivity

---

## Storage

All Hosts

- [ ] Verify Local Storage
- [ ] Verify Boot Storage
- [ ] Verify Available Capacity

---

# Phase 4 - PAX Storage Preparation

## RAID Validation

- [ ] Verify PERC H700
- [ ] Verify RAID Status
- [ ] Verify Battery Status

---

## Disk Inventory

- [ ] Verify Drive Count
- [ ] Verify Drive Sizes
- [ ] Verify Disk Health

---

## Documentation

- [ ] Update STORAGE-ARCHITECTURE.md
- [ ] Update HARDWARE-INVENTORY.md

---

# Phase 5 - Tailscale Deployment

## DAX

- [ ] Install Tailscale
- [ ] Join Tailnet

---

## MAX

- [ ] Install Tailscale
- [ ] Join Tailnet

---

## PAX

- [ ] Install Tailscale
- [ ] Join Tailnet

---

# Phase 6 - Validation

## Local Access

Verify:

- [ ] DAX Reachable
- [ ] MAX Reachable
- [ ] PAX Reachable

---

## Proxmox Access

Verify:

- [ ] DAX Web UI
- [ ] MAX Web UI
- [ ] PAX Web UI

---

## DNS Validation

Verify:

- [ ] DAX DNS Resolution
- [ ] MAX DNS Resolution
- [ ] PAX DNS Resolution

---

## Tailscale Validation

Verify:

- [ ] DAX Reachable
- [ ] MAX Reachable
- [ ] PAX Reachable

From:

- Trusted VLAN
- Remote Connection

---

# Phase 7 - Backup Preparation

## Export Configuration

### DAX

- [ ] Export Host Configuration

---

### MAX

- [ ] Export Host Configuration

---

### PAX

- [ ] Export Host Configuration

---

## Storage

Save To:

```text
evidence/sprint-02/
```

---

# Documentation Updates

Review:

- [ ] HARDWARE-INVENTORY.md
- [ ] NETWORK-TOPOLOGY.md
- [ ] REMOTE-ACCESS.md
- [ ] CORE-INFRASTRUCTURE.md

---

# Evidence Collection

Store Evidence In:

```text
evidence/sprint-02/
```

---

## Required Evidence

- [ ] Installation Screenshots
- [ ] Host Information
- [ ] Network Configuration
- [ ] Tailscale Enrollment
- [ ] Firmware Versions
- [ ] Storage Inventory

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

Sprint 02 cannot be closed until:

- [ ] DAX Operational
- [ ] MAX Operational
- [ ] PAX Operational
- [ ] Networking Validated
- [ ] DNS Validated
- [ ] Tailscale Operational
- [ ] Configuration Backups Exported
- [ ] Documentation Updated
- [ ] Evidence Collected

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
Sprint 02 establishes the virtualization platform upon which all infrastructure services will be deployed.

No infrastructure services should be deployed until this sprint is complete.
```