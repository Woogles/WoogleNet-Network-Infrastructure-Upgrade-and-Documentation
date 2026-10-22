# Project Checklist

## Purpose

This checklist serves as the master tracking document for the WoogleNet project.

It provides a single location to track:

- Documentation completion
- Infrastructure deployment
- Network implementation
- Service deployment
- Security implementation
- Backup implementation
- Operational readiness

Status should be updated as work is completed.

---

# Project Status

| Area | Status |
|----------|----------|
| Documentation | In Progress |
| Network Design | Complete |
| Infrastructure Design | Complete |
| Service Design | Complete |
| Security Design | Complete |
| Backup Design | Complete |
| Deployment | Not Started |
| Operations | Not Started |

---

# Documentation

## Core Documents

- [x] README.md
- [x] HARDWARE-INVENTORY.md
- [x] SERVICE-INVENTORY.md
- [x] IP-ADDRESS-PLAN.md
- [x] VLAN-PLAN.md
- [x] NETWORK-TOPOLOGY.md
- [x] FIREWALL-RULES.md
- [x] STORAGE-ARCHITECTURE.md
- [x] STORAGE-MAP.md
- [x] BACKUP-AND-RESTORE.md
- [x] DISASTER-RECOVERY.md
- [x] OPERATIONS-RUNBOOK.md
- [x] SECURITY-BASELINE.md

---

## Remaining Documents

- [ ] RACK-LAYOUT.md
- [ ] POWER-AND-UPS.md
- [ ] CABLING.md
- [ ] MONITORING-AND-ALERTING.md
- [ ] SERVICE-DEPENDENCIES.md
- [ ] ARCHITECTURE.md
- [ ] DNS-ARCHITECTURE.md
- [ ] REMOTE-ACCESS.md

---

# Sprint 0 - Discovery and Preparation

## Infrastructure Inventory

- [ ] Verify UDM-Pro Configuration
- [ ] Verify Switch Inventory
- [ ] Verify AP Inventory
- [ ] Verify Server Inventory
- [ ] Verify UPS Inventory

---

## Backups

- [ ] Export UDM-Pro Configuration
- [ ] Export Switch Configurations
- [ ] Export AP Configurations
- [ ] Export Existing Service Configurations

---

## Documentation Review

- [ ] Validate Hardware Inventory
- [ ] Validate Service Inventory
- [ ] Validate Network Documentation
- [ ] Validate Storage Documentation

---

# Sprint 1 - Network Foundation

## VLAN Deployment

- [ ] Create VLAN 10 Infrastructure
- [ ] Create VLAN 20 Trusted
- [ ] Create VLAN 30 IoT
- [ ] Create VLAN 40 Guest

---

## DHCP

- [ ] Configure Infrastructure Network
- [ ] Configure Trusted DHCP Scope
- [ ] Configure IoT DHCP Scope
- [ ] Configure Guest DHCP Scope

---

## Wireless

- [ ] Deploy WoogleNet SSID
- [ ] Deploy WoogleNet-IoT SSID
- [ ] Deploy WoogleNet-Guest SSID

---

## Firewall

- [ ] Implement Infrastructure Rules
- [ ] Implement Trusted Rules
- [ ] Implement IoT Rules
- [ ] Implement Guest Rules

---

# Sprint 2 - Core Infrastructure

## Proxmox

### DAX

- [ ] Install Proxmox
- [ ] Configure Storage
- [ ] Configure Networking
- [ ] Configure Backups

### MAX

- [ ] Install Proxmox
- [ ] Configure Storage
- [ ] Configure Networking
- [ ] Configure Backups

### PAX

- [ ] Install Proxmox
- [ ] Configure Storage
- [ ] Configure Networking
- [ ] Configure Backups

---

## Core Services

### AdGuard

- [ ] Deploy AdGuard Primary
- [ ] Deploy AdGuard Secondary
- [ ] Configure DNS Redundancy
- [ ] Validate Failover

### Homepage

- [ ] Deploy Homepage
- [ ] Configure Dashboards
- [ ] Configure Service Links

### Uptime Kuma

- [ ] Deploy Uptime Kuma
- [ ] Configure Monitoring
- [ ] Configure Notifications

---

## Tailscale

- [ ] Deploy Tailscale on DAX
- [ ] Deploy Tailscale on MAX
- [ ] Deploy Tailscale on PAX
- [ ] Deploy Tailscale on JAX
- [ ] Validate Remote Access

---

# Sprint 3 - Storage Platform

## OpenMediaVault

- [ ] Create OMV VM
- [ ] Configure Storage Pools
- [ ] Configure Shares
- [ ] Configure Backup Repository

---

## Storage Structure

- [ ] Create AppData Structure
- [ ] Create Media Structure
- [ ] Create Documents Structure
- [ ] Create Photos Structure
- [ ] Create Backup Structure

---

# Sprint 4 - Day 1 Services

## JAX

- [ ] Install Ubuntu
- [ ] Configure Docker
- [ ] Configure Storage Mounts

---

## Media Platform

- [ ] Deploy Plex
- [ ] Deploy Audiobookshelf

---

## Photo Platform

- [ ] Deploy Immich
- [ ] Configure Mobile Backups
- [ ] Validate Photo Uploads

---

## Monitoring

- [ ] Add Services To Homepage
- [ ] Add Services To Uptime Kuma

---

# Sprint 5 - Day 2 Services

## Home Automation

- [ ] Deploy Home Assistant VM
- [ ] Configure IoT Integrations

---

## Password Management

- [ ] Deploy Vaultwarden
- [ ] Enable MFA
- [ ] Create User Accounts

---

## Media Automation

- [ ] Deploy qBittorrent
- [ ] Deploy Sonarr
- [ ] Deploy Radarr
- [ ] Deploy Lidarr
- [ ] Deploy Readarr
- [ ] Deploy Bazarr
- [ ] Deploy Prowlarr
- [ ] Deploy Overseerr

---

## Additional Services

- [ ] Deploy Navidrome
- [ ] Deploy MeTube
- [ ] Deploy Tautulli
- [ ] Deploy Stirling-PDF

---

# Sprint 6 - Knowledge Platform

## Document Management

- [ ] Deploy Paperless-ngx
- [ ] Configure Scanning Workflows

---

## Cloud Platform

- [ ] Deploy Nextcloud
- [ ] Configure User Storage

---

## Synchronization

- [ ] Deploy Syncthing
- [ ] Configure Device Synchronization

---

## Documentation

- [ ] Deploy BookStack
- [ ] Import Documentation

---

# Sprint 7 - AI Platform

Managed Separately

Repository:

```text
My_Local_AI_Config
```

Tasks tracked in that project.

- [ ] Deploy Ollama
- [ ] Deploy Open WebUI
- [ ] Deploy AI Models
- [ ] Deploy Agent Frameworks
- [ ] Configure AI Storage

---

# Backup Implementation

## Kopia

- [ ] Install Kopia
- [ ] Create Repository
- [ ] Configure Encryption

---

## Local Backup

- [ ] Configure OMV Repository
- [ ] Configure Backup Jobs

---

## OneDrive

- [ ] Configure Offsite Sync
- [ ] Verify Uploads

---

## Restore Testing

- [ ] Immich Restore Test
- [ ] Vaultwarden Restore Test
- [ ] Paperless Restore Test
- [ ] Home Assistant Restore Test

---

# Security

## Authentication

- [ ] Configure Vaultwarden
- [ ] Enable MFA For Vaultwarden
- [ ] Enable MFA For Tailscale
- [ ] Enable MFA For Home Assistant

---

## Services

- [ ] Configure Fail2Ban Where Supported
- [ ] Disable Root SSH
- [ ] Review Default Credentials

---

## Network Security

- [ ] Validate VLAN Isolation
- [ ] Validate Guest Isolation
- [ ] Validate IoT Isolation

---

# Monitoring

## Uptime Kuma

- [ ] Service Monitoring
- [ ] DNS Checks
- [ ] SSL Monitoring

---

## Notifications

- [ ] Configure Email Notifications
- [ ] Configure Mobile Notifications

---

# Project Completion

## Final Validation

- [ ] Documentation Reviewed
- [ ] Backups Verified
- [ ] Restore Tests Completed
- [ ] Security Review Completed
- [ ] Monitoring Review Completed
- [ ] Disaster Recovery Review Completed

---

## Operational Readiness

- [ ] All Critical Services Operational
- [ ] Backup Jobs Successful
- [ ] Offsite Backups Functional
- [ ] Monitoring Functional
- [ ] Family Accounts Created
- [ ] Documentation Published

---

# Future Enhancements

## Optional Services

- [ ] Jellyfin
- [ ] Authentik

---

## Future Infrastructure

- [ ] Additional Storage
- [ ] Additional GPUs
- [ ] AI Expansion
- [ ] Advanced Automation

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Project Checklist |