# WoogleNet: Infrastructure Upgrade & Documentation

## 📌 Project Overview
WoogleNet is a comprehensive home network and lab redesign focused on high availability, security segmentation, and professional-grade observability. The goal is to transition from a flat network to a segmented, redundant environment capable of hosting a Proxmox cluster, a dedicated GPU compute node, and a suite of self-hosted services.

## 🛠 Hardware Architecture

### Core Compute Nodes
| Host | Role | Environment | Hardware Note |
| :--- | :--- | :--- | :--- |
| **JAX** | Docker / Service Hub | Ubuntu Server | Primary AdGuard & NPM Host |
| **SAX** | GPU Compute | Bare Metal | 3-Slot GPUs (Physical constraint $\rightarrow$ No Virtualization) |
| **DAX** | Proxmox Node 1 | Hypervisor | R720 Cluster Member |
| **MAX** | Proxmox Node 2 | Hypervisor | R720 Cluster Member |
| **PAX** | Proxmox Node 3 | Hypervisor | R720 Cluster Member |

### Network Infrastructure
- **Router/Gateway:** UniFi Dream Machine Pro (UDM-Pro)
- **Core Switching:** UniFi Managed Switches
- **Edge Switching:** TP-Link TL-SG1024DE (Easy Smart Managed)
- **Connectivity:** 1GbE Backplane (LACP not supported on Edge; using Single-Link/Active-Backup)

---

## 🌐 Network Design & Segmentation

### VLAN Mapping
To prevent VLAN hopping and secure the core, **VLAN 1 is reserved as a "Dead VLAN"** and is not used for production traffic.

| VLAN ID | Name | Purpose | Trust Level | Access Policy |
| :--- | :--- | :--- | :--- | :--- |
| `1` | Native | Dead/Unused | None | Dropped |
| `10` | Trusted LAN | Management & Core Servers | High | Full Access to all VLANs |
| `20` | Management | Switch/AP Administration | High | Restricted to Admin Devices |
| `30` | IoT | Smart Home / Low Trust | Low | Internet Only; No LAN access |
| `40` | Guest | Visitors | Low | Internet Only; Isolated |

### Layer 2 Stability (STP)
To prevent broadcast storms and network loops across mixed-brand switches:
- **Root Bridge:** UDM-Pro (Priority: `4096`)
- **Edge Switches:** TP-Link / UniFi Secondary (Priority: `32768`)

---

## 💾 Storage & Backup Strategy

### Storage Architecture
- **Primary NAS:** Virtualized NAS instance running on the Proxmox Cluster (DAX/MAX/PAX).
- **Provisioning:** Dedicated physical disk passthrough to the NAS VM to maximize I/O performance.

### Disaster Recovery (DR)
- **Backup Engine:** Proxmox Backup Server (PBS).
- **Method:** Deduplicated, incremental snapshots of all VMs and LXCs.
- **Schedule:** Nightly automated backups to an external physical backup target.

---

## ⚡ Power Management (NUT)
A centralized **Network UPS Tools (NUT)** architecture is used to prevent data corruption during power failure.

- **NUT Master:** Privileged LXC Container $\rightarrow$ Monitors 5x UPS units (APC/Eaton/Tripp Lite).
- **NUT Slaves:** All physical hosts (DAX, MAX, PAX, SAX, JAX) monitor the Master.
- **Shutdown Logic:** 
  1. UPS hits `20%` battery $\rightarrow$ Master signals Slaves.
  2. Proxmox hosts trigger graceful guest VM shutdown.
  3. Physical hosts power down $\rightarrow$ NUT Master shuts down last.

---

## 🚀 Service Inventory & External Access

### Core Services
| Service | Host | IP | Access Method |
| :--- | :--- | :--- | :--- |
| **AdGuard Home (Pri)** | JAX | `10.0.10.5` | Internal DNS |
| **AdGuard Home (Sec)** | MAX/PAX | `TBD` | Redundant DNS |
| **Nginx Proxy Mgr** | JAX | `10.0.10.6` | Reverse Proxy |
| **Vaultwarden** | JAX | `10.0.10.7` | Authentik $\rightarrow$ NPM |
| **Nextcloud** | JAX | `10.0.10.8` | Authentik $\rightarrow$ NPM |
| **Immich** | JAX | `10.0.10.9` | Authentik $\rightarrow$ NPM |
| **Homepage** | JAX | `10.0.10.10` | Internal/Tailscale |

### External Access Strategy
- **Administrative Access:** Tailscale (VPN) for all management interfaces.
- **Public Web Services:** Cloudflare Tunnels $\rightarrow$ NPM $\rightarrow$ Authentik (MFA) $\rightarrow$ Service.
- **Media (Plex):** UDM-Pro Port Forward $\rightarrow$ NPM $\rightarrow$ Plex.

---

## 📈 Operational Standards (Observability)

To ensure the health and stability of the lab, the following monitoring stack is deployed on **JAX**:

- **Availability:** `Uptime Kuma` for real-time service monitoring and push notifications.
- **Telemetry:** `Prometheus` + `Grafana` using `Node Exporter` on all hosts to monitor CPU temperatures, RAM usage, and network throughput.
- **Identity:** `Authentik` provides a centralized Single-Sign-On (SSO) and MFA layer for all proxy-exposed applications.

---

## 🛠 Maintenance Quick-Links
- **Environment Config:** See `.env` for global IP and VLAN variables.
- **Docker Stacks:** See `/docker-compose` for service definitions.
- **Network Map:** Refer to `network_diagram.png` (if applicable).
