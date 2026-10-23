# Uptime Kuma

## Purpose

Uptime Kuma provides monitoring, alerting, and operational health validation for the WoogleNet environment.

Classification:

Tier 2

---

## Host

DAX

---

## Dependencies

- Docker
- DNS
- Network Infrastructure
- Homepage (Optional)

---

## Deployment

```bash
deploy-service.sh uptime-kuma
```

## Update

```bash
update-service.sh uptime-kuma
```

## Rollback

```bash
rollback-service.sh uptime-kuma
```

## Restore

```bash
restore-service.sh uptime-kuma
```

---

## Validation

```bash
validate-monitoring.sh
validate-services.sh
```

---

## Ports

| Port | Purpose |
|--------|----------|
| 3001 | Web Console |

---

## Volumes

| Container | Host |
|------------|------------|
| /app/data | /storage/appdata/uptime-kuma |

---

## Recovery Tier

Tier 2

---

## Backup Coverage

Required

---

## Monitoring Coverage

Required

---

## Operational Requirements

- Monitor All Tier 1 Services
- Monitor All Infrastructure Hosts
- Monitor DNS Availability
- Monitor Internet Connectivity
- Monitor Backup Readiness

---

## Recommended Monitors

### Infrastructure

- DAX
- MAX
- PAX
- JAX
- UDM-Pro

### DNS

- AdGuard Primary
- AdGuard Secondary

### Monitoring

- Homepage
- Uptime Kuma

### Tier 1 Services

- Vaultwarden
- Home Assistant
- Immich
- Paperless-ngx
- Nextcloud
- BookStack
- OpenMediaVault

### Backup

- Kopia Repository
- Backup Validation Reports

### Recovery

- Recovery Validation Reports
- Recovery Drill Results 