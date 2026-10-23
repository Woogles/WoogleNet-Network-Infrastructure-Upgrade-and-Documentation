# Recovery Time Objectives

## Purpose

Define service recovery expectations for the WoogleNet environment.

---

# Recovery Philosophy

Recovery over High Availability.

The environment prioritizes:

- Recoverability
- Documentation
- Backups
- Simplicity

---

# Service Classes

## Tier 1

Critical Family Data

Services:

- Vaultwarden
- Immich
- Paperless
- Nextcloud
- Home Assistant
- BookStack

Target RTO:

Same Day

Target RPO:

24 Hours

---

## Tier 2

Important Services

Services:

- Audiobookshelf
- Navidrome
- Homepage
- Uptime Kuma
- Syncthing

Target RTO:

72 Hours

Target RPO:

7 Days

---

## Tier 3

Rebuildable Services

Services:

- Plex
- ARR Stack
- AdGuard

Target RTO:

As Time Permits

Target RPO:

Best Effort

---

# Infrastructure Objectives

## DNS

Target Recovery:

15 Minutes

---

## Storage

Target Recovery:

4 Hours

---

## Core Networking

Target Recovery:

1 Hour

---

## Monitoring

Target Recovery:

4 Hours

---

# Validation

Quarterly recovery tests required.

Restore validation mandatory for:

- Vaultwarden
- Immich
- Paperless
- Nextcloud
- Home Assistant