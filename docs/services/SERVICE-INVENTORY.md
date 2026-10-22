# Service Inventory

## Purpose

This document serves as the authoritative inventory of all services deployed within the WoogleNet environment.

The purpose of this document is to:

- Identify approved services
- Define deployment phases
- Document hosting locations
- Define backup requirements
- Define service criticality
- Define user access requirements
- Track deployment status

Only approved services should appear in this document.

Services under evaluation belong in the Research section.

---

# Service Hosting Strategy

## Current Design

| Platform | Purpose |
|-----------|----------|
| DAX | Infrastructure Services |
| MAX | Infrastructure Services |
| PAX | Storage Services |
| JAX | Application, Media, AI, and User Services |

---

# Deployment Phases

## Day 1 - Core Services

These services are required for the initial operational environment.

| Service | Host | Platform | Criticality | Backup Required | Public Access | Status |
|-----------|----------|----------|----------|----------|----------|----------|
| AdGuard Home Primary | DAX | LXC | Critical | Yes | Tailscale | Planned |
| AdGuard Home Secondary | MAX | LXC | Critical | Yes | Tailscale | Planned |
| Homepage | DAX | LXC | Important | Yes | Tailscale | Planned |
| Uptime Kuma | DAX | LXC | Important | Yes | Tailscale | Planned |
| Immich | JAX | Docker | Critical | Yes | Tailscale | Planned |
| Audiobookshelf | JAX | Docker | Important | Yes | Tailscale | Planned |
| Plex | JAX | Docker | Important | Yes | Internet Facing | Planned |

---

## Day 2 - Expansion Services

These services expand functionality after core systems are stable.

| Service | Host | Platform | Criticality | Backup Required | Public Access | Status |
|-----------|----------|----------|----------|----------|----------|----------|
| Home Assistant | MAX | VM | Important | Yes | Tailscale | Planned |
| Navidrome | JAX | Docker | Important | Yes | Tailscale | Planned |
| Stirling-PDF | JAX | Docker | Important | Yes | Tailscale | Planned |
| Vaultwarden | JAX | Docker | Critical | Yes | Tailscale | Planned |
| MeTube | JAX | Docker | Low | No | Tailscale | Planned |
| Tautulli | JAX | Docker | Low | No | Tailscale | Planned |
| qBittorrent | JAX | Docker | Important | Yes | Tailscale | Planned |
| Prowlarr | JAX | Docker | Important | Yes | Tailscale | Planned |
| Sonarr | JAX | Docker | Important | Yes | Tailscale | Planned |
| Radarr | JAX | Docker | Important | Yes | Tailscale | Planned |
| Lidarr | JAX | Docker | Low | Yes | Tailscale | Planned |
| Readarr | JAX | Docker | Low | Yes | Tailscale | Planned |
| Bazarr | JAX | Docker | Low | Yes | Tailscale | Planned |
| Overseerr | JAX | Docker | Important | Yes | Tailscale | Planned |

---

## Day 3 - AI Platform

AI services are maintained in a separate repository.

### External Project

```text
My_Local_AI_Config
```

Services managed through that project include:

- Ollama
- Open WebUI
- Local AI Models
- Future Agent Frameworks
- Future RAG Platform Components

### Notes

The WoogleNet repository tracks infrastructure dependencies for AI workloads but does not serve as the authoritative AI deployment repository.

---

## Day 4 - Knowledge and Data Platform

| Service | Host | Platform | Criticality | Backup Required | Public Access | Status |
|-----------|----------|----------|----------|----------|----------|----------|
| Paperless-ngx | JAX | Docker | Critical | Yes | Tailscale | Planned |
| Nextcloud | JAX | Docker | Critical | Yes | Tailscale | Planned |
| Syncthing | JAX | Docker | Important | Yes | Tailscale | Planned |
| BookStack | JAX | Docker | Important | Yes | Tailscale | Planned |

---

# User Access Requirements

## Plex

### Approved Users

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

## Audiobookshelf

### Approved Users

- Eric
- Beth
- Amara
- Adam
- FeFe
- William

---

## Immich

### Approved Users

- Eric
- Beth
- Amara

### Data Classification

```text
Critical Data
```

Loss of Immich data may result in permanent loss of family photographs and mobile device backups.

---

## Vaultwarden

### Approved Users

- Eric
- Beth
- Amara

### Data Classification

```text
Critical Data
```

---

# Database Strategy

## Standard

Each application should use its recommended database platform.

### Design Decision

```text
Per-Service Databases
```

The environment will avoid shared database platforms where practical to simplify:

- Migration
- Backup
- Recovery
- Service Removal
- Service Rebuilds

---

# Remote Access Strategy

## Primary Access Method

```text
Tailscale
```

### Requirements

- Install Tailscale on all hosts
- Install Tailscale on all virtual machines
- Install Tailscale on all containers where practical

---

# High Availability Services

## AdGuard Home

### Design

| Instance | Host |
|-----------|----------|
| Primary | DAX |
| Secondary | MAX |

### Purpose

- DNS Resolution
- DNS Filtering
- DNS Redundancy

### Scope

```text
DNS Only
```

DHCP will remain the responsibility of the UDM-Pro.

---

# Services Removed From Scope

The following services are no longer part of the current deployment design.

| Service | Reason |
|----------|----------|
| Nginx Proxy Manager | Replaced by Tailscale-first access strategy |

---

# Optional Services

These services may be installed later but are not required for project completion.

| Service | Status |
|----------|----------|
| Jellyfin | Optional |
| Authentik | Optional |

---

# Research Services

The following services were evaluated but are not currently approved for deployment.

| Service | Status |
|----------|----------|
| LibreChat | Research |
| n8n | Research |
| Paperless-GPT | Research |
| AgenticSeek | Research |
| Kometa | Research |
| ErsatzTV | Research |
| ConvertX | Research |
| BentoPDF | Research |

---

# Service Criticality Definitions

| Level | Definition |
|----------|----------|
| Critical | Data loss or outage significantly impacts the environment |
| Important | Service should be restored promptly |
| Low | Service may be rebuilt if necessary |

---

# Open Decisions

| Item | Status |
|----------|----------|
| Backup Target Platform | TBD |
| NAS Storage Layout | TBD |
| Nextcloud Storage Allocation | TBD |
| Immich Storage Allocation | TBD |
| Media Storage Allocation | TBD |
| ARR Storage Allocation | TBD |
| Public Plex Exposure Method | TBD |

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Service Inventory |