# Navidrome

## Purpose

Navidrome provides personal music streaming, library management, playlist synchronization, and Subsonic-compatible media access for the WoogleNet environment.

Classification:

Tier 2

---

## Host

JAX

---

## Components

### Application

Navidrome

---

## Deployment

```bash
deploy-service.sh navidrome
```

## Update

```bash
update-service.sh navidrome
```

## Rollback

```bash
rollback-service.sh navidrome
```

## Restore

```bash
restore-service.sh navidrome
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
| 4533 | Web UI / API |

---

## Recovery Tier

Tier 2

---

## Backup Coverage

Required

### Backup Scope

- Application Configuration
- User Accounts
- Playlists
- Listening History
- Metadata Database

Music files are protected separately through storage backups.

---

## Monitoring Coverage

Required

---

## Storage Locations

| Purpose | Location |
|----------|----------|
| Config & Database | /storage/appdata/navidrome |
| Music Library | /storage/media/music |

---

## Dependencies

- Docker
- DNS
- Persistent Storage

---

## Critical Functions

- Music Streaming
- Playlist Management
- Mobile Synchronization
- Subsonic API
- Metadata Management