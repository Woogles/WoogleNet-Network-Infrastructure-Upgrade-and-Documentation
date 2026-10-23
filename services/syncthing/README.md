# Syncthing

## Purpose

Syncthing provides secure peer-to-peer file synchronization between WoogleNet systems, mobile devices, and external recovery targets.

Classification:

Tier 2

---

## Host

JAX

---

## Components

### Application

Syncthing

---

## Deployment

```bash
deploy-service.sh syncthing
```

## Update

```bash
update-service.sh syncthing
```

## Rollback

```bash
rollback-service.sh syncthing
```

## Restore

```bash
restore-service.sh syncthing
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
|------|----------|
| 8384 | Web Interface |
| 22000 TCP | Sync Traffic |
| 22000 UDP | QUIC Sync |
| 21027 UDP | Local Discovery |

---

## Recovery Tier

Tier 2

---

## Backup Coverage

Required

### Backup Scope

- Device Configuration
- Folder Definitions
- Peer Relationships
- Synchronization Settings

---

## Monitoring Coverage

Required

---

## Storage Locations

| Purpose | Location |
|----------|----------|
| Configuration | /storage/appdata/syncthing |
| Documents | /storage/documents |
| Photos | /storage/photos |

---

## Dependencies

- Docker
- DNS
- Persistent Storage
- Remote Peers

---

## Critical Functions

- Offsite Synchronization
- Mobile Synchronization
- Document Replication
- Recovery Data Replication
- Cross-System File Availability

---

## Recommended Sync Targets

### Documents

- Paperless Export
- BookStack Export
- Administrative Documentation

### Media

- Photos
- Family Archives

### Recovery

- Recovery Reports
- Certification Evidence
- Configuration Backups