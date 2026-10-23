# SERVICE-INVENTORY

## Purpose

This document serves as the authoritative inventory of all approved services operating within the WoogleNet environment.

The purpose of this document is to:

- Identify approved services
- Document hosting locations
- Define service ownership
- Define service criticality
- Document backup requirements
- Document recovery requirements
- Define monitoring requirements
- Support operational readiness reviews
- Support disaster recovery planning
- Support annual certification reviews

This document answers:

"What services exist?"

Service operational health and readiness are managed separately through:

- service-readiness-matrix.md
- operations-readiness-assessment.md
- ENVIRONMENT-CERTIFICATION.md

Reference Documents:

- ARCHITECTURE.md
- SERVICE-DEPENDENCIES.md
- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md

---

# Service Hosting Strategy

| Platform | Purpose |
|-----------|-----------|
| DAX | Infrastructure Services |
| MAX | Infrastructure Services |
| PAX | Storage Services |
| JAX | Application and User Services |

---

# Criticality Definitions

| Level | Definition |
|----------|----------|
| Critical | Data loss or prolonged outage significantly impacts the environment |
| Important | Service should be restored promptly |
| Standard | Service provides value but extended outage is acceptable |
| Rebuildable | Service may be rebuilt rather than restored |

---

# Platform Inventory

## Infrastructure Hosts

| Host | Role |
|----------|----------|
| DAX | Infrastructure Host |
| MAX | Infrastructure Host |
| PAX | Storage Host |
| JAX | Application Host |

---

# Core Infrastructure Services

| Service | Host | Platform | Criticality | Backup | Monitoring | Recovery Required | Status |
|----------|----------|----------|----------|----------|----------|----------|----------|
| AdGuard Primary | DAX | LXC | Critical | Yes | Yes | Yes | Active |
| AdGuard Secondary | MAX | LXC | Critical | Yes | Yes | Yes | Active |
| Homepage | DAX | LXC | Important | Yes | Yes | Yes | Active |
| Uptime Kuma | DAX | LXC | Important | Yes | Yes | Yes | Active |
| Tailscale | All Hosts | Native | Critical | Configuration | Yes | Yes | Active |
| Vaultwarden | JAX | Docker | Critical | Yes | Yes | Yes | Active |

---

# Media Platform Services

| Service | Host | Platform | Criticality | Backup | Monitoring | Recovery Required | Status |
|----------|----------|----------|----------|----------|----------|----------|----------|
| Plex | JAX | Docker | Important | Yes | Yes | Best Effort | Active |
| Audiobookshelf | JAX | Docker | Important | Yes | Yes | Yes | Active |
| Immich | JAX | Docker | Critical | Yes | Yes | Yes | Active |
| Navidrome | JAX | Docker | Important | Yes | Yes | Yes | Active |
| Tautulli | JAX | Docker | Standard | No | Yes | No | Active |
| MeTube | JAX | Docker | Rebuildable | No | Yes | No | Active |

---

# Automation Platform Services

| Service | Host | Platform | Criticality | Backup | Monitoring | Recovery Required | Status |
|----------|----------|----------|----------|----------|----------|----------|----------|
| Home Assistant | MAX | VM | Critical | Yes | Yes | Yes | Active |
| qBittorrent | JAX | Docker | Important | Yes | Yes | Yes | Active |
| Prowlarr | JAX | Docker | Important | Yes | Yes | Yes | Active |
| Sonarr | JAX | Docker | Important | Yes | Yes | Yes | Active |
| Radarr | JAX | Docker | Important | Yes | Yes | Yes | Active |
| Lidarr | JAX | Docker | Standard | Yes | Yes | Yes | Active |
| Readarr | JAX | Docker | Standard | Yes | Yes | Yes | Active |
| Bazarr | JAX | Docker | Standard | Yes | Yes | Yes | Active |
| Overseerr | JAX | Docker | Important | Yes | Yes | Yes | Active |
| Gluetun | JAX | Docker | Important | Yes | Yes | Yes | Active |

---

# Knowledge Platform Services

| Service | Host | Platform | Criticality | Backup | Monitoring | Recovery Required | Status |
|----------|----------|----------|----------|----------|----------|----------|----------|
| Paperless-ngx | JAX | Docker | Critical | Yes | Yes | Yes | Active |
| Nextcloud | JAX | Docker | Critical | Yes | Yes | Yes | Active |
| Syncthing | JAX | Docker | Important | Yes | Yes | Yes | Active |
| BookStack | JAX | Docker | Critical | Yes | Yes | Yes | Active |
| Stirling-PDF | JAX | Docker | Standard | No | Yes | No | Active |

---

# Backup & Recovery Services

| Service | Host | Platform | Criticality | Backup | Monitoring | Recovery Required | Status |
|----------|----------|----------|----------|----------|----------|----------|----------|
| Kopia | JAX | Native / Container | Critical | Repository | Yes | Yes | Active |
| OneDrive Offsite Replication | JAX | Integration | Critical | N/A | Yes | Yes | Active |

---

# Service Recovery Tiers

## Tier 1 Critical Services

Recovery Target:

Same Day

Services:

- Vaultwarden
- Home Assistant
- Immich
- Paperless-ngx
- Nextcloud
- BookStack
- AdGuard

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

## Tier 2 Important Services

Recovery Target:

72 Hours

Services:

- Audiobookshelf
- Navidrome
- Syncthing
- Homepage
- Uptime Kuma

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

## Tier 3 Rebuildable Services

Recovery Target:

Best Effort

Services:

- Plex
- Tautulli
- MeTube
- ARR Stack Components

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Monitoring Requirements

Every approved production service must:

- Appear in Homepage
- Be monitored by Uptime Kuma
- Have a service owner
- Have a documented backup strategy
- Have a documented recovery path

Exceptions must be documented during readiness reviews.

Reference:

service-readiness-matrix.md

---

# Security Requirements

All services must comply with:

- SECURITY-BASELINE.md
- MFA-STANDARD.md
- SSH-STANDARD.md
- CREDENTIAL-MANAGEMENT-STANDARD.md

Administrative credentials must be managed through:

Vaultwarden

Reference:

SECURITY-AUDIT-PROGRAM.md

---

# Services Outside Scope

The following services are intentionally managed outside the WoogleNet repository.

## AI Platform

Repository:

```text
My_Local_AI_Config
```

Managed Components:

- Ollama
- Open WebUI
- Local Models
- Agents
- Future RAG Components

This repository only tracks infrastructure dependencies for AI workloads.

---

# Optional Services

The following services are approved for future evaluation but are not required for operational certification.

| Service | Status |
|----------|----------|
| Jellyfin | Optional |
| Authentik | Optional |

---

# Research Services

The following services have been evaluated but are not currently approved for deployment.

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

# Service Governance

Service additions, removals, or major architecture changes require updates to:

- SERVICE-INVENTORY.md
- SERVICE-DEPENDENCIES.md
- STORAGE-MAP.md
- service-readiness-matrix.md
- OPERATIONS-RUNBOOK.md

Reference:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

# Success Criteria

This inventory is considered current when:

- All production services are listed
- Host assignments are accurate
- Backup requirements are defined
- Recovery requirements are defined
- Monitoring requirements are defined
- Criticality ratings are assigned
- Service status reflects reality

Documentation must always reflect the current state of the environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Reconciled with completed Sprint 01-10 program, governance framework, recovery framework, and operational certification model |