# Paperless-ngx

## Purpose

Paperless-ngx provides document management, OCR processing, indexing, and long-term document retention for WoogleNet.

Classification:

Tier 1

---

## Host

JAX

---

## Components

### Application

Paperless-ngx

### Database

PostgreSQL

### Cache

Redis

---

## Deployment

```bash
deploy-service.sh paperless
```

## Update

```bash
update-service.sh paperless
```

## Rollback

```bash
rollback-service.sh paperless
```

## Restore

```bash
restore-service.sh paperless
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
| 8000 | Web Interface |

---

## Recovery Tier

Tier 1

---

## Backup Coverage

Required

### Data

- PostgreSQL Database
- Media Files
- Export Files
- Application Data

---

## Monitoring Coverage

Required

---

## Storage Locations

| Purpose | Location |
|----------|----------|
| Config | /storage/appdata/paperless |
| Media | /storage/documents/paperless/media |
| Import | /storage/documents/paperless/consume |
| Export | /storage/documents/paperless/export |

---

## Dependencies

- PostgreSQL
- Redis
- Persistent Storage
- DNS
- Reverse Proxy