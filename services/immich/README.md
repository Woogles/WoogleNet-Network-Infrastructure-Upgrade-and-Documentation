# Immich

## Purpose

Immich provides photo and video management, AI-powered search, facial recognition, object detection, metadata management, and mobile synchronization.

Classification:

Tier 1

---

## Host

JAX

---

## Components

### Application

Immich Server

### Database

PostgreSQL + pgvecto-rs

### Cache

Redis

### AI Services

Immich Machine Learning

---

## Deployment

```bash
deploy-service.sh immich
```

## Update

```bash
update-service.sh immich
```

## Rollback

```bash
rollback-service.sh immich
```

## Restore

```bash
restore-service.sh immich
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
| 2283 | Web Interface / API |

---

## Recovery Tier

Tier 1

---

## Backup Coverage

Required

### Backup Scope

- PostgreSQL Database
- Photos
- Videos
- Metadata
- Face Recognition Data
- AI Models

---

## Monitoring Coverage

Required

---

## Storage Locations

| Purpose | Location |
|----------|----------|
| Photos & Videos | /storage/photos |
| PostgreSQL | /storage/appdata/immich/postgres |
| ML Cache | /storage/appdata/immich/ml-cache |

---

## Dependencies

- PostgreSQL
- Redis
- Docker
- DNS
- Persistent Storage

---

## Critical Functions

- Photo Management
- Video Management
- Mobile Backup
- Face Recognition
- Object Recognition
- Metadata Search