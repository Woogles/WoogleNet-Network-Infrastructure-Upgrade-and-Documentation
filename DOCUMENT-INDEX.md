# DOCUMENT-INDEX

## Purpose

This document serves as the authoritative inventory of all WoogleNet documentation.

It provides:

- Documentation Discovery
- Ownership Tracking
- Governance Tracking
- Review Requirements
- Operational References
- Audit References
- Certification References

Reference:

DOCUMENTATION-GOVERNANCE-STANDARD.md

---

# Repository Status

| Category | Approximate Count | Status |
|-----------|-----------|-----------|
| Program Documentation | 3+ | Active |
| Architecture Documentation | 6+ | Active |
| Infrastructure Documentation | 5+ | Active |
| Service Documentation | 20+ | Active |
| Operations Documentation | 10+ | Active |
| Security Documentation | 6+ | Active |
| Backup & Recovery Documentation | 10+ | Active |
| Governance Documentation | 3+ | Active |
| Sprint Documentation | 10 Sprint Sets | Complete |
| Certification Documentation | 6+ | Active |

---

# Program Documentation

| Document | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| README.md | Program | Repository entry point | Operations | Annual | Active |
| DOCUMENT-INDEX.md | Program | Documentation inventory | Operations | Quarterly | Active |
| SPRINT-PLAN.md | Program | Program roadmap and status | Operations | Annual | Active |

---

# Architecture Documentation

| Document | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| NETWORK-ARCHITECTURE.md | Architecture | Network design | Infrastructure | Semi-Annual | Active |
| STORAGE-ARCHITECTURE.md | Architecture | Storage design | Infrastructure | Semi-Annual | Active |
| DNS-ARCHITECTURE.md | Architecture | DNS services | Infrastructure | Semi-Annual | Active |
| VPN-ARCHITECTURE.md | Architecture | Remote access architecture | Infrastructure | Semi-Annual | Active |
| SERVICE-DEPENDENCIES.md | Architecture | Service relationships | Operations | Semi-Annual | Active |
| STORAGE-MAP.md | Architecture | Storage allocation map | Infrastructure | Semi-Annual | Active |

---

# Infrastructure Documentation

| Document/System | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| DAX | Infrastructure | Infrastructure host | Operations | Quarterly | Active |
| MAX | Infrastructure | Media host | Operations | Quarterly | Active |
| PAX | Infrastructure | Platform host | Operations | Quarterly | Active |
| JAX | Infrastructure | Knowledge host | Operations | Quarterly | Active |
| OpenMediaVault | Infrastructure | Storage platform | Operations | Quarterly | Active |

---

# Core Services

| Service | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| AdGuard | Core Service | DNS protection | Operations | Quarterly | Active |
| Homepage | Core Service | Service dashboard | Operations | Quarterly | Active |
| Uptime Kuma | Core Service | Monitoring platform | Operations | Quarterly | Active |
| Vaultwarden | Core Service | Credential management | Security | Quarterly | Active |
| Tailscale | Core Service | Remote access | Security | Quarterly | Active |

---

# Media Platform Services

| Service | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| Plex | Media | Media streaming | Operations | Quarterly | Active |
| Audiobookshelf | Media | Audiobooks | Operations | Quarterly | Active |
| Immich | Media | Photos and media | Operations | Quarterly | Active |
| Navidrome | Media | Music streaming | Operations | Quarterly | Active |
| Tautulli | Media | Plex analytics | Operations | Quarterly | Active |
| MeTube | Media | Media acquisition | Operations | Quarterly | Active |

---

# Automation Platform Services

| Service | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| Home Assistant | Automation | Home automation | Operations | Quarterly | Active |
| Sonarr | Automation | TV management | Operations | Quarterly | Active |
| Radarr | Automation | Movie management | Operations | Quarterly | Active |
| Lidarr | Automation | Music management | Operations | Quarterly | Active |
| Readarr | Automation | Book management | Operations | Quarterly | Active |
| Bazarr | Automation | Subtitle management | Operations | Quarterly | Active |
| Prowlarr | Automation | Indexer management | Operations | Quarterly | Active |
| Overseerr | Automation | Requests management | Operations | Quarterly | Active |
| qBittorrent | Automation | Download client | Operations | Quarterly | Active |
| Gluetun | Automation | VPN network stack | Operations | Quarterly | Active |

---

# Knowledge Platform Services

| Service | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| Paperless | Knowledge | Document management | Operations | Quarterly | Active |
| Nextcloud | Knowledge | File collaboration | Operations | Quarterly | Active |
| Syncthing | Knowledge | File synchronization | Operations | Quarterly | Active |
| BookStack | Knowledge | Documentation platform | Operations | Quarterly | Active |

---

# Security Standards

| Document | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| SECURITY-BASELINE.md | Security Standard | Security requirements | Security | Annual | Active |
| MFA-STANDARD.md | Security Standard | MFA governance | Security | Annual | Active |
| SSH-STANDARD.md | Security Standard | SSH governance | Security | Annual | Active |
| CREDENTIAL-MANAGEMENT-STANDARD.md | Security Standard | Credential governance | Security | Annual | Active |
| secrets-management-standard.md | Security Standard | Secret handling requirements | Security | Annual | Active |

---

# Governance Documentation

| Document | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| SECURITY-AUDIT-PROGRAM.md | Governance | Security review program | Security | Annual | Active |
| DOCUMENTATION-GOVERNANCE-STANDARD.md | Governance | Documentation lifecycle management | Operations | Annual | Active |
| OPERATIONS-RUNBOOK.md | Governance | Operational procedures | Operations | Semi-Annual | Active |

---

# Backup & Recovery Documentation

| Document | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| BACKUP-AND-RESTORE.md | Recovery | Backup operations | Operations | Quarterly | Active |
| DISASTER-RECOVERY.md | Recovery | Disaster recovery framework | Operations | Quarterly | Active |
| RECOVERY-TIME-OBJECTIVES.md | Recovery | Recovery targets | Operations | Annual | Active |
| kopia-backup-platform.md | Recovery | Backup platform standard | Operations | Annual | Active |
| onedrive-offsite-replication.md | Recovery | Offsite replication | Operations | Annual | Active |
| backup-validation.md | Recovery | Backup validation | Operations | Quarterly | Active |
| restore-testing-procedures.md | Recovery | Restore validation | Operations | Quarterly | Active |
| critical-service-restore-guides.md | Recovery | Service recovery procedures | Operations | Quarterly | Active |
| disaster-recovery-exercise.md | Recovery | DR exercise process | Operations | Annual | Active |

---

# Operational Readiness Documentation

| Document | Category | Purpose | Owner | Review Frequency | Status |
|-----------|-----------|-----------|-----------|-----------|-----------|
| service-readiness-matrix.md | Operations | Service readiness register | Operations | Quarterly | Active |
| operations-readiness-assessment.md | Operations | Readiness assessment | Operations | Annual | Active |
| production-readiness-review.md | Operations | Production review | Operations | Annual | Active |
| operational-validation-report.md | Operations | Validation reporting | Operations | Annual | Active |
| ENVIRONMENT-CERTIFICATION.md | Certification | Production certification | Operations | Annual | Active |

---

# Sprint Summary

| Sprint | Name | Status | Key Deliverables |
|-----------|-----------|-----------|-----------|
| Sprint 01 | Infrastructure Foundation | ✅ Complete | Core infrastructure |
| Sprint 02 | Storage & Core Services | ✅ Complete | Storage platform |
| Sprint 03 | Networking & Remote Access | ✅ Complete | Networking and Tailscale |
| Sprint 04 | Media Platform | ✅ Complete | Media services |
| Sprint 05 | Automation Platform | ✅ Complete | ARR stack and automation |
| Sprint 06 | Security & Identity Foundation | ✅ Complete | Vaultwarden and security foundation |
| Sprint 07 | Knowledge Platform | ✅ Complete | Paperless, Nextcloud, BookStack |
| Sprint 08 | Backup & Recovery | ✅ Complete | Kopia, replication, recovery |
| Sprint 09 | Security Hardening | ✅ Complete | Standards and auditing |
| Sprint 10 | Operations Readiness | ✅ Complete | Certification framework |

---

# Environment Status

| Area | Status |
|-----------|-----------|
| Infrastructure | ✅ Operational |
| Services | ✅ Operational |
| Security | ✅ Governed |
| Monitoring | ✅ Operational |
| Backup | ✅ Operational |
| Recovery | ✅ Validated |
| Documentation | ✅ Governed |
| Operations | ✅ Operational |
| Certification | ✅ Ready For Certification |

---

# Authoritative Standards

The following documents are considered authoritative governance documents:

- SECURITY-BASELINE.md
- MFA-STANDARD.md
- SSH-STANDARD.md
- CREDENTIAL-MANAGEMENT-STANDARD.md
- secrets-management-standard.md
- SECURITY-AUDIT-PROGRAM.md
- DOCUMENTATION-GOVERNANCE-STANDARD.md
- BACKUP-AND-RESTORE.md
- DISASTER-RECOVERY.md
- RECOVERY-TIME-OBJECTIVES.md
- OPERATIONS-RUNBOOK.md

All future implementations, scripts, compose files, automation, operational procedures, and certification activities must align with these standards.