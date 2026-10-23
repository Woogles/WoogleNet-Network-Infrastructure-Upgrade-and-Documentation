# Audiobookshelf

## Purpose

Audiobookshelf provides audiobook and podcast management, metadata retrieval, progress synchronization, and streaming services for the WoogleNet environment.

Classification:

Tier 2

---

## Host

JAX

---

## Components

### Application

Audiobookshelf

---

## Deployment

```bash
deploy-service.sh audiobookshelf
```

## Update

```bash
update-service.sh audiobookshelf
```

## Rollback

```bash
rollback-service.sh audiobookshelf
```

## Restore

```bash
restore-service.sh audiobookshelf
```

---

## Validation

```bash
validate-services.sh

validate-backups.sh
```

---

## Ports

| Port | Purpose |
|--------|----------|
| 13378 | Web Interface |

---

## Recovery Tier

Tier 2

---

## Backup Coverage

Required

### Backup Scope

- Application Configuration
- Metadata
- User Accounts
- Listening Progress

Media files are protected separately by storage backups.

---

## Monitoring Coverage

Required

---

## Storage Locations

| Purpose | Location |
|----------|----------|
| Config | /storage/appdata/audiobookshelf/config |
| Metadata | /storage/appdata/audiobookshelf/metadata |
| Audiobooks | /storage/media/audiobooks |
| Podcasts | /storage/media/podcasts |

---

## Dependencies

- Docker
- DNS
- Persistent Storage

---

## Critical Functions

- Audiobook Streaming
- Podcast Streaming
- Listening Progress Tracking
- Metadata Management
- Mobile Synchronization