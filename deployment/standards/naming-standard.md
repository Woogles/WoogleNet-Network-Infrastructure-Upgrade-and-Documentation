# Naming Standard

## Purpose

This document defines the authoritative naming convention for all systems, services, containers, virtual machines, DNS records, monitoring objects, backups, and deployment artifacts within the WoogleNet environment.

The goals of this standard are to:

- Eliminate ambiguity
- Simplify troubleshooting
- Identify service placement immediately
- Support operational consistency
- Improve searchability
- Reduce documentation drift

All deployments must follow this standard unless a documented exception exists.

Reference:

```text
SERVICE-DECISIONS.md
```

---

# Naming Philosophy

Every name should immediately answer:

```text
What host runs this service?

What service is it?
```

Example:

```text
jax-immich
```

Immediately identifies:

```text
Host:
    JAX

Service:
    Immich
```

---

# Naming Format

## Standard Format

```text
<host>-<service>
```

Examples:

```text
dax-adguard

max-adguard

dax-homepage

dax-uptime

pax-omv

jax-plex

jax-immich

jax-vaultwarden
```

---

# Physical Host Naming

Physical systems retain simple permanent names.

| Host | Purpose |
|----------|----------|
| dax | Infrastructure Host |
| max | Infrastructure Host |
| pax | Storage Host |
| jax | Application Host |

---

## Rules

Physical host names must be:

```text
Lowercase

Short

Permanent

Memorable
```

---

## Prohibited

```text
DAX01

SERVER01

NODE-A
```

---

# LXC Naming Standard

## Format

```text
<host>-<service>
```

Examples:

```text
dax-adguard

max-adguard

dax-homepage

dax-uptime
```

---

## Hostname

Container hostname should match container name.

Example:

```text
Container:
dax-homepage

Hostname:
dax-homepage
```

---

# Virtual Machine Naming Standard

## Format

```text
<host>-<service>
```

Examples:

```text
pax-omv

max-homeassistant
```

---

## Hostname

Preferred:

```text
Hostname = VM Name
```

Example:

```text
VM:
pax-omv

Hostname:
pax-omv
```

---

# Docker Naming Standard

## Container Names

Format:

```text
<host>-<service>
```

Examples:

```text
jax-plex

jax-immich

jax-vaultwarden

jax-paperless

jax-nextcloud

jax-bookstack
```

---

## Docker Compose

Project name should match:

```text
<host>-<service>
```

Examples:

```text
jax-immich

jax-vaultwarden
```

---

# DNS Naming Standard

## Short Records

Format:

```text
<host>-<service>
```

Examples:

```text
dax-adguard

max-adguard

dax-homepage

jax-immich

pax-omv
```

---

## FQDN Standard

Format:

```text
<host>-<service>.wooglenet.internal
```

Examples:

```text
dax-adguard.wooglenet.internal

max-adguard.wooglenet.internal

dax-homepage.wooglenet.internal

jax-immich.wooglenet.internal

pax-omv.wooglenet.internal
```

---

# Monitoring Naming Standard

## Uptime Kuma

Monitor names must exactly match service names.

Examples:

```text
dax-adguard

max-adguard

dax-homepage

dax-uptime

jax-immich

jax-vaultwarden
```

---

## Prohibited

```text
AdGuard

Immich

Homepage
```

Reason:

```text
Host placement is not immediately visible.
```

---

# Backup Naming Standard

## Format

```text
<service>-YYYY-MM-DD
```

Examples:

```text
jax-immich-2026-10-22

jax-vaultwarden-2026-10-22

pax-omv-2026-10-22
```

---

## Full Backup Archive

Examples:

```text
jax-immich-full-2026-10-22

pax-omv-config-2026-10-22

jax-vaultwarden-db-2026-10-22
```

---

# Export Naming Standard

## Format

```text
<host>-<purpose>-YYYY-MM-DD.ext
```

Examples:

```text
dax-config-2026-10-22.zip

max-network-2026-10-22.txt

pax-raid-2026-10-22.txt

jax-docker-2026-10-22.tar
```

---

# Deployment Artifact Naming

## Deployment Files

Format:

```text
<service>.md
```

Examples:

```text
adguard-primary.md

homepage.md

uptime-kuma.md

vaultwarden.md
```

---

## Build Sheets

Format:

```text
<host>-build-sheet.md
```

Examples:

```text
dax-build-sheet.md

max-build-sheet.md

pax-build-sheet.md
```

---

# Service Registry

## Sprint 03

| Service | Standard Name |
|----------|----------|
| AdGuard Primary | dax-adguard |
| AdGuard Secondary | max-adguard |
| Homepage | dax-homepage |
| Uptime Kuma | dax-uptime |

---

## Sprint 04

| Service | Standard Name |
|----------|----------|
| OpenMediaVault | pax-omv |

---

## Sprint 05

| Service | Standard Name |
|----------|----------|
| Plex | jax-plex |
| Audiobookshelf | jax-audiobookshelf |
| Immich | jax-immich |

---

## Sprint 06

| Service | Standard Name |
|----------|----------|
| Home Assistant | max-homeassistant |
| Vaultwarden | jax-vaultwarden |
| Navidrome | jax-navidrome |
| qBittorrent | jax-qbittorrent |
| Sonarr | jax-sonarr |
| Radarr | jax-radarr |
| Lidarr | jax-lidarr |
| Readarr | jax-readarr |
| Prowlarr | jax-prowlarr |
| Overseerr | jax-overseerr |
| Tautulli | jax-tautulli |
| MeTube | jax-metube |
| Stirling PDF | jax-stirling |

---

## Sprint 07

| Service | Standard Name |
|----------|----------|
| Paperless-ngx | jax-paperless |
| Nextcloud | jax-nextcloud |
| BookStack | jax-bookstack |
| Syncthing | jax-syncthing |

---

# Naming Rules

Required:

```text
Lowercase

Hyphen Separated

Host Prefix Required

Service Suffix Required
```

---

## Allowed

```text
jax-immich

dax-uptime

pax-omv

max-homeassistant
```

---

## Not Allowed

```text
Immich

immich

JAX-IMMICH

jax_immich

Immich01

server1
```

---

# Reserved Host Prefixes

| Prefix | Description |
|----------|----------|
| dax | Infrastructure Host |
| max | Infrastructure Host |
| pax | Storage Host |
| jax | Application Host |

---

# Future Expansion

If additional hosts are added:

```text
Host Prefix Must Be Approved

Host Prefix Must Be Documented

Host Prefix Must Remain Unique
```

---

# Compliance Checklist

All new deployments must verify:

- [ ] Host Prefix Applied
- [ ] Service Suffix Applied
- [ ] Lowercase Naming
- [ ] Hyphen Separation Used
- [ ] DNS Records Match
- [ ] Monitoring Names Match
- [ ] Backup Names Match

---

# Exceptions

Any deviation from this naming standard must document:

- Justification
- Risk
- Mitigation
- Approval Date

Location:

```text
SERVICE-DECISIONS.md
```

---

# Related Standards

- lxc-standard.md
- vm-standard.md
- service-hardening-standard.md
- network-security-standard.md
- backup-standard.md
- monitoring-standard.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Finalized host-service hyphenated naming convention |