# BookStack

## Purpose

BookStack provides centralized documentation, procedures, operational runbooks, standards, and knowledge management for the WoogleNet environment.

Classification:

Tier 1

---

## Host

JAX

---

## Components

### Application

BookStack

### Database

MariaDB

---

## Deployment

```bash
deploy-service.sh bookstack
```

## Update

```bash
update-service.sh bookstack
```

## Rollback

```bash
rollback-service.sh bookstack
```

## Restore

```bash
restore-service.sh bookstack
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
| 6875 | Web Interface |

---

## Recovery Tier

Tier 1

---

## Backup Coverage

Required

### Backup Scope

- Application Configuration
- MariaDB Database
- Documentation Content
- Images & Attachments

---

## Monitoring Coverage

Required

---

## Storage Locations

| Purpose | Location |
|----------|----------|
| Application | /storage/appdata/bookstack/config |
| Database | /storage/appdata/bookstack/database |

---

## Dependencies

- MariaDB
- Docker
- DNS
- Persistent Storage

---

## Critical Functions

- Standards Repository
- Runbook Repository
- Architecture Documentation
- Procedures
- Knowledge Management