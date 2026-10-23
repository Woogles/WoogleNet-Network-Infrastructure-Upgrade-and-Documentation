# DOCKER-STANDARD

## Purpose

This document establishes the standards, governance requirements, operational controls, and deployment practices for all Docker-based services within the WoogleNet environment.

The purpose of this standard is to:

- Standardize Docker deployments
- Improve operational consistency
- Improve recoverability
- Support backup operations
- Support disaster recovery
- Reduce configuration drift
- Improve security posture
- Enable automation
- Support operational readiness reviews
- Support certification requirements

This standard applies to all Docker services operating within the WoogleNet environment.

Reference Documents:

- ARCHITECTURE.md
- SERVICE-INVENTORY.md
- STORAGE-ARCHITECTURE.md
- CONFIGURATION-MANAGEMENT-STANDARD.md
- SECURITY-BASELINE.md
- OPERATIONS-RUNBOOK.md

---

# Design Principles

## Core Principles

1. Docker Compose Required
2. Configuration Must Be Version Controlled
3. Secrets Must Be Externalized
4. Storage Must Be Persistent
5. Services Must Be Recoverable
6. Services Must Be Monitored
7. Documentation Must Reflect Reality
8. Security Must Be Applied By Default
9. Automation Must Be Supported
10. Simplicity Over Complexity

---

# Approved Docker Platforms

## Primary Docker Host

Approved Docker host:

```text
JAX
```

Role:

```text
Application Platform
```

Approved Service Categories:

- Media Platform
- Knowledge Platform
- Security Platform
- Automation Platform
- Backup Platform

Reference:

SERVICE-INVENTORY.md

---

# Deployment Standard

## Required Deployment Method

All production Docker services shall be deployed using:

```text
Docker Compose
```

Required command:

```bash
docker compose
```

Legacy deployment methods should be avoided.

---

## Standalone Containers

Manual container creation using:

```bash
docker run
```

is prohibited for production deployments.

Exception:

```text
Short-Term Testing
Development
Troubleshooting
```

---

# Naming Standard

## Container Names

Format:

```text
host-service
```

Examples:

```text
jax-plex
jax-immich
jax-nextcloud
jax-vaultwarden
```

---

## Network Names

Format:

```text
service-network
```

Examples:

```text
immich-network
paperless-network
nextcloud-network
```

---

## Volume Names

Format:

```text
service-data
```

Examples:

```text
immich-data
nextcloud-data
bookstack-data
```

---

# Directory Standard

## Service Layout

Every Docker service shall be deployed using a dedicated directory.

Recommended structure:

```text
services/

├── immich/
│   ├── compose.yml
│   ├── .env
│   ├── .env.example
│   └── README.md
│
├── nextcloud/
│   ├── compose.yml
│   ├── .env
│   ├── .env.example
│   └── README.md
│
└── vaultwarden/
    ├── compose.yml
    ├── .env
    ├── .env.example
    └── README.md
```

---

# Required Service Files

Every production stack shall include:

```text
compose.yml
.env
.env.example
README.md
```

---

## README Requirements

Every Docker stack README shall contain:

- Service Purpose
- Ports Used
- Storage Requirements
- Backup Requirements
- Recovery Notes
- Dependency Information

---

# Environment Variable Standard

## Required Usage

Service configuration values should be defined within:

```text
.env
```

files wherever practical.

Examples:

```text
HOSTNAME

TZ

PUID

PGID

DOMAIN

UPLOAD_PATH
```

---

## Environment Examples

Deployments should provide:

```text
.env.example
```

without secrets.

---

# Secrets Standard

## Prohibited

The following must never be placed inside:

- compose.yml
- README.md
- Git repositories
- Documentation

Examples:

```text
Passwords

API Keys

Tokens

Encryption Keys

Secret Values
```

---

## Approved Secret Storage

Secrets shall be maintained within:

```text
Vaultwarden
```

Reference:

CREDENTIAL-MANAGEMENT-STANDARD.md

---

# Storage Standard

## Persistent Storage

All persistent data shall reside outside containers.

Container-local application data is prohibited.

---

## Root Storage Location

Primary storage root:

```text
/storage
```

---

## Application Data

Application data location:

```text
/storage/appdata
```

Examples:

```text
/storage/appdata/immich

/storage/appdata/nextcloud

/storage/appdata/vaultwarden
```

---

## Media Data

Media storage location:

```text
/storage/media
```

---

## Photo Data

Photo storage location:

```text
/storage/photos
```

---

## Document Storage

Document storage location:

```text
/storage/documents
```

Reference:

STORAGE-ARCHITECTURE.md

---

# DNS Standard

## Required DNS Configuration

Containers should utilize:

```yaml
dns:
  - 10.0.10.50
  - 10.0.10.51
```

Unless documented exceptions exist.

Reference:

DNS-ARCHITECTURE.md

---

# Network Standard

## Preferred Mode

Preferred Docker network type:

```text
Bridge
```

---

## Host Networking

Host networking should only be used when:

- Application Requirements Demand It
- Performance Requires It
- Documentation Exists

---

## Dedicated Networks

Service-specific networks should be used when practical.

Example:

```yaml
networks:
  immich-network:
```

---

## Cross-Service Communication

Only explicitly required services should communicate directly.

Reference:

SERVICE-DEPENDENCIES.md

---

# Security Standard

## Container User

Containers should run as non-root whenever supported.

Examples:

```yaml
PUID=1000
PGID=1000
```

or vendor-supported alternatives.

---

## Privileged Containers

Privileged containers should be avoided.

If required:

- Justification Must Exist
- Documentation Must Exist

---

## Host Mounts

Use the minimum required mount scope.

Preferred:

```yaml
/storage/media
```

Avoid:

```yaml
/
```

---

## Administrative Access

Administrative access shall occur through:

```text
Trusted VLAN

Tailscale

Physical Console
```

Reference:

VPN-ARCHITECTURE.md

---

# Image Standard

## Approved Sources

Use:

- Official Images
- Vendor Recommended Images
- Maintainer Recommended Images

---

## Avoid

Avoid:

- Unmaintained Forks
- Unknown Publishers
- Abandoned Images

---

## Version Pinning

Critical services should avoid:

```text
latest
```

Preferred:

```text
specific versions
```

Examples:

```yaml
image: vaultwarden/server:1.34.3

image: linuxserver/plex:1.42.2
```

---

# Logging Standard

## Logging Driver

Use:

```yaml
logging:
  driver: json-file
```

---

## Retention Requirements

Required:

```yaml
logging:
  driver: json-file
  options:
    max-size: "10m"
    max-file: "5"
```

---

## Log Review

Logs should be reviewed:

- During Incidents
- During Troubleshooting
- During Security Reviews

---

# Monitoring Standard

## Required Monitoring

Every production service shall be:

- Monitored By Uptime Kuma
- Visible In Homepage

Reference:

service-readiness-matrix.md

---

## Health Checks

Health checks should be enabled whenever supported.

Example:

```yaml
healthcheck:
```

---

# Backup Standard

## Required Coverage

Backup requirements apply to:

- Configuration Files
- Databases
- Persistent Data
- Environment Files

---

## Excluded Data

Do not back up:

- Images
- Containers
- Caches
- Temporary Files

---

## Backup Classification

Every Docker service shall have:

```text
Backup Classification
```

defined in:

SERVICE-INVENTORY.md

---

# Recovery Standard

## Recovery Documentation

Every production service shall have:

- Recovery Classification
- Backup Method
- Storage Location
- Recovery Procedure

Documented.

---

## Recovery Testing

Critical services shall participate in:

- Restore Testing
- Recovery Validation
- Disaster Recovery Exercises

Reference:

DISASTER-RECOVERY.md

---

# Upgrade Standard

## Required Process

All production upgrades shall follow:

```text
1. Backup

2. Pull Image

3. Deploy Update

4. Validate Service

5. Validate Monitoring

6. Validate Backup Coverage

7. Rollback If Required
```

---

## Critical Services

Before upgrading critical services:

Verify:

- Backup Completed
- Restore Path Known
- Rollback Available

Examples:

- Vaultwarden
- Immich
- Nextcloud
- Paperless
- Home Assistant

---

# Operational Readiness Requirements

Every production Docker service shall have:

✅ Service Inventory Entry

✅ Monitoring

✅ Backup Coverage

✅ Recovery Classification

✅ Recovery Procedure

✅ Documentation

✅ Operational Ownership

Reference:

- SERVICE-INVENTORY.md
- service-readiness-matrix.md

---

# Governance Requirements

Docker deployments must comply with:

- SECURITY-BASELINE.md
- CONFIGURATION-MANAGEMENT-STANDARD.md
- DOCUMENTATION-GOVERNANCE-STANDARD.md
- OPERATIONS-RUNBOOK.md

Non-compliant services are not considered production ready.

---

# Compliance Checklist

Every production Docker deployment must satisfy:

- [ ] Compose Deployment
- [ ] Persistent Storage
- [ ] Documentation Exists
- [ ] Backup Exists
- [ ] Recovery Path Exists
- [ ] Monitoring Enabled
- [ ] Homepage Entry Exists
- [ ] Secrets Externalized
- [ ] Non-Root Operation Preferred
- [ ] Service Inventory Updated

---

# Success Criteria

Docker operations are considered compliant when:

- Deployments Are Standardized
- Configuration Is Documented
- Secrets Are Protected
- Monitoring Is Active
- Backup Coverage Exists
- Recovery Procedures Exist
- Documentation Reflects Reality
- Governance Requirements Are Met

Docker is the primary application deployment platform within WoogleNet and must remain aligned with security, recovery, operational, and configuration management requirements.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 2.0 | 2026-10-22 | Eric Yacoub | Rewritten to align with Sprint 01-10 completion, configuration management standard, recovery framework, operational readiness model, and certification requirements |
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Docker Standard |