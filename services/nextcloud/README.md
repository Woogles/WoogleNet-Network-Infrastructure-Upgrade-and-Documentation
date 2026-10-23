# Nextcloud

## Purpose

Nextcloud provides file storage, synchronization, collaboration, and knowledge management for the WoogleNet environment.

Classification:

Tier 1

---

## Host

JAX

---

## Components

### Application

Nextcloud

### Database

PostgreSQL

### Cache

Redis

---

## Deployment

```bash
deploy-service.sh nextcloud
```

## Update

```bash
update-service.sh nextcloud
```

## Rollback

```bash
rollback-service.sh nextcloud
```

## Restore

```bash
restore-service.sh nextcloud
```

---

## Validation

```bash
validate-services.sh

validate-backups.sh

validate-recovery.sh
```

---

## Ports

| Port | Purpose |
|--------|----------|
| 80 | Application |
|

8081 (host) | Published Port |

---

## Recovery Tier

Tier 1

---

## Backup Coverage

Required

### Backup Scope

- Nextcloud Application Configuration
- PostgreSQL Database
- User Files
- Redis Data
- Application Settings

---

## Monitoring Coverage

Required

---

## Storage Locations

| Purpose | Location |
|----------|----------|
| Application | /storage/appdata/nextcloud/html |
| Database | /storage/appdata/nextcloud/postgres |
| Redis | /storage/appdata/nextcloud/redis |
| User Data | /storage/documents/nextcloud |

---

## Dependencies

- PostgreSQL
- Redis
- Docker
- DNS
- Persistent Storage

---

## Critical Functions

- Document Storage
- Knowledge Repository
- File Synchronization
- Mobile Synchronization
- Secure Sharing