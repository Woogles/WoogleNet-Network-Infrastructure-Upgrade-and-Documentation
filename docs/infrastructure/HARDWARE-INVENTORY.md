# Hardware Inventory

## Purpose

This document serves as the authoritative inventory for all physical infrastructure within the WoogleNet environment.

The purpose of this document is to:

- Track physical assets
- Track hardware specifications
- Document infrastructure roles
- Support capacity planning
- Support disaster recovery planning
- Support hardware replacement and upgrades

This document should be updated whenever hardware is added, removed, repurposed, or upgraded.

---

# Infrastructure Summary

## Physical Device Inventory

| Category | Quantity |
|-----------|----------|
| Gateway | 1 |
| Managed Switches | 2 |
| Wireless Access Points | 7 |
| Proxmox Hosts | 3 |
| Ubuntu Hosts | 1 |
| UPS Units | 5 |

---

# Network Infrastructure

## WoogleNetRouter01

| Property | Value |
|----------|---------|
| Device Type | Gateway |
| Model | UniFi Dream Machine Pro |
| Status | Installed |
| Deployment State | Operational |
| Management Platform | UniFi Network |
| Purpose | Routing, Firewall, DHCP, VLAN Management |

### Notes

- Primary Internet gateway
- VLAN gateway
- DHCP provider
- Firewall platform

---

# Switching Infrastructure

## WoogleNetSwitch01

| Property | Value |
|----------|---------|
| Model | TP-Link TL-SG1024DE |
| Ports | 24 |
| Status | Installed |
| Deployment State | Operational |
| Configuration Status | Pending Review |

---

## WoogleNetSwitch02

| Property | Value |
|----------|---------|
| Model | TP-Link TL-SG1024DE |
| Ports | 24 |
| Status | Installed |
| Deployment State | Operational |
| Configuration Status | Pending Review |

---

# Wireless Infrastructure

## UniFi AC LR Access Points

| Property | Value |
|----------|---------|
| Model | UniFi AC LR |
| Quantity | 4 |
| Status | Installed |
| Configuration Status | Pending Review |

---

## UniFi AC Pro Access Points

| Property | Value |
|----------|---------|
| Model | UniFi AC Pro |
| Quantity | 3 |
| Status | Installed |
| Configuration Status | Pending Review |

---

# Compute Infrastructure

## Virtualization Platform

### Design Decisions

| Item | Decision |
|--------|--------|
| Hypervisor | Proxmox VE |
| Clustering | No |
| Shared Storage | No |
| Live Migration | No |
| High Availability | No |
| Storage Model | Local Storage |
| Recovery Strategy | Restore/Rebuild |

---

## DAX

### Purpose

Primary virtualization host.

### Hardware

| Property | Value |
|----------|---------|
| Platform | Dell PowerEdge R720 |
| Operating System | Proxmox VE |
| CPU | Intel Xeon E5-2620 |
| Memory | 188 GB |
| RAID Controller | PERC H700 |
| Drive Bays | 12 |
| Installed Drives | 12 |
| Network Interfaces | 4 x Intel 1GbE |
| Status | Planned |

### Storage Configuration

| Property | Value |
|----------|---------|
| Physical Disks | TBD |
| RAID Layout | TBD |
| Virtual Disk Layout | TBD |
| Proxmox Storage Pools | TBD |
| Usable Capacity | TBD |

---

## MAX

### Purpose

Secondary virtualization host.

### Hardware

| Property | Value |
|----------|---------|
| Platform | Dell PowerEdge R720 |
| Operating System | Proxmox VE |
| CPU | Intel Xeon E5-2620 |
| Memory | 188 GB |
| RAID Controller | PERC H700 |
| Drive Bays | 12 |
| Installed Drives | 12 |
| Network Interfaces | 4 x Intel 1GbE |
| Status | Planned |

### Storage Configuration

| Property | Value |
|----------|---------|
| Physical Disks | TBD |
| RAID Layout | TBD |
| Virtual Disk Layout | TBD |
| Proxmox Storage Pools | TBD |
| Usable Capacity | TBD |

---

## PAX

### Purpose

Additional virtualization host.

### Hardware

| Property | Value |
|----------|---------|
| Platform | Dell PowerEdge R720 |
| Operating System | Proxmox VE |
| CPU | Intel Xeon E5-2620 |
| Memory | 188 GB |
| RAID Controller | PERC H700 |
| Drive Bays | 12 |
| Installed Drives | 12 |
| Network Interfaces | 4 x Intel 1GbE |
| Status | Planned |

### Storage Configuration

| Property | Value |
|----------|---------|
| Physical Disks | TBD |
| RAID Layout | TBD |
| Virtual Disk Layout | TBD |
| Proxmox Storage Pools | TBD |
| Usable Capacity | TBD |

---

# Docker and AI Platform

## JAX

### Purpose

Primary Ubuntu host for:

- Docker services
- Core infrastructure services
- Self-hosted applications
- AI workloads
- Local LLM inference

### Hardware

| Property | Value |
|----------|---------|
| Operating System | Ubuntu Server |
| CPU | Intel Xeon E5-2667 v3 |
| Memory | 32 GB |
| Network Interfaces | 1 x Intel 1GbE |
| SSD Count | 2 |
| SSD Size | 500 GB Each |
| Storage Layout | Independent Disks |
| Status | Planned |

---

## GPU Resources

### GPU-01

| Property | Value |
|----------|---------|
| Model | NVIDIA RTX 3060 |
| VRAM | 12 GB |
| Installed | Yes |
| Primary Usage | AI Inference |

---

### GPU-02

| Property | Value |
|----------|---------|
| Model | NVIDIA GTX 1070 |
| VRAM | 8 GB |
| Installed | Yes |
| Primary Usage | AI Inference |

---

## AI Storage

| Property | Value |
|----------|---------|
| Ollama Storage Location | Local SSD |
| Model Repository | Local |
| Backup Strategy | TBD |
| Expansion Plan | TBD |

---

## Known Constraints

| Constraint | Notes |
|------------|---------|
| System RAM | 32 GB |
| AI Storage | Local SSD Only |
| GPU Redundancy | None |
| Central AI Storage | Not Planned |
| Model Backup Strategy | TBD |

---

# Storage Platform

## NAS Platform

### Current Design Direction

| Property | Value |
|----------|---------|
| Platform | OpenMediaVault |
| Deployment Type | Virtual Machine |
| Host Platform | Proxmox |
| Status | Planned |

---

### Storage Design

| Item | Status |
|--------|--------|
| RAID Layout | TBD |
| Storage Pools | TBD |
| NAS Capacity | TBD |
| Backup Repository | TBD |
| Offsite Backup Target | TBD |
| Media Storage Layout | TBD |
| Application Storage Layout | TBD |

---

### Planned Functions

- Application Storage
- Media Storage
- Backup Repository
- Shared File Storage
- Future Archive Storage

---

# Power Infrastructure

## UPS Inventory

### Tripp Lite SMART1500LCD

| Property | Value |
|----------|---------|
| Quantity | 3 |
| Capacity | 1500VA |
| Output Power | 900W |
| Form Factor | Rack Mount |
| Status | Installed |

---

### APC Back-UPS Pro

| Property | Value |
|----------|---------|
| Quantity | 2 |
| Capacity | 1500VA |
| Output Power | 900W |
| Status | Installed |

---

## Planned UPS Management

| Item | Value |
|--------|--------|
| Platform | NUT (Network UPS Tools) |
| Status | Planned |
| Shutdown Automation | Planned |
| Monitoring Integration | Planned |

---

# System Status Summary

| System | Status | Deployment State |
|----------|----------|----------|
| UDM-Pro | Installed | Operational |
| Switches | Installed | Operational |
| Access Points | Installed | Operational |
| DAX | Available | Planned |
| MAX | Available | Planned |
| PAX | Available | Planned |
| JAX | Available | Planned |
| OpenMediaVault | Planned | Not Deployed |
| UPS Infrastructure | Installed | Operational |

---

# Pending Decisions

## Storage

| Decision | Status |
|------------|----------|
| DAX RAID Layout | Pending |
| MAX RAID Layout | Pending |
| PAX RAID Layout | Pending |
| NAS Storage Layout | Pending |
| Backup Repository Sizing | Pending |
| Media Storage Layout | Pending |

---

## AI Platform

| Decision | Status |
|------------|----------|
| Ollama Backup Strategy | Pending |
| Model Retention Strategy | Pending |
| Future GPU Expansion | Pending |
| Vector Database Platform | Pending |
| Long-Term AI Storage Strategy | Pending |

---

## Networking

| Decision | Status |
|------------|----------|
| VLAN Design | Pending |
| VLAN Numbers | Pending |
| IP Address Plan | Pending |
| Firewall Implementation | Pending |
| AP Placement Validation | Pending |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Hardware Inventory |