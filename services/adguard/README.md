# AdGuard Home

## Purpose

AdGuard Home provides recursive DNS, DNS filtering, and local name resolution for the WoogleNet environment.

Classification:

Tier 1

## Deployment Model

Primary DNS:

- Host: DAX
- Address: 10.0.10.50

Secondary DNS:

- Host: MAX
- Address: 10.0.10.51

## Dependencies

- Docker
- Network Infrastructure
- Persistent Storage

## Deployment

```bash
deploy-service.sh adguard
```

## Update

```bash
update-service.sh adguard
```

## Rollback

```bash
rollback-service.sh adguard
```

## Restore

```bash
restore-service.sh adguard
```

## Validation

```bash
validate-services.sh
validate-monitoring.sh
```

## Ports

| Port | Purpose |
|--------|----------|
| 53 TCP | DNS |
| 53 UDP | DNS |
| 80 | HTTP |
| 443 | HTTPS |
| 3000 | Management |

## Volumes

| Container | Host |
|------------|------------|
| /opt/adguardhome/work | appdata/adguard/work |
| /opt/adguardhome/conf | appdata/adguard/conf |

## Recovery Tier

Tier 1

## Backup Coverage

Required

## Monitoring Coverage

Required

## Operational Requirements

- DNS Monitoring Required
- Recovery Validation Required
- Backup Validation Required
- Annual Recovery Exercise Required