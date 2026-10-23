# DOCKER-COMPOSE-STANDARD

## Purpose

This document defines the required structure, conventions, controls, and deployment standards for Docker Compose implementations within the WoogleNet environment.

The purpose of this standard is to:

- Standardize Compose Deployments
- Reduce Configuration Drift
- Improve Recoverability
- Improve Security
- Support Automation
- Support Operational Readiness
- Support Disaster Recovery
- Support Certification Requirements

This standard builds upon:

- CONFIGURATION-MANAGEMENT-STANDARD.md
- DOCKER-STANDARD.md

and applies to all production Docker deployments.

---

# Design Principles

## Core Principles

1. One Service Per Stack
2. Compose Files Must Be Portable
3. Secrets Must Be Externalized
4. Storage Must Be Persistent
5. Services Must Be Recoverable
6. Deployments Must Be Repeatable
7. Configuration Must Be Documented
8. Compose Files Must Support Automation

---

# Repository Structure

## Standard Layout

The WoogleNet repository shall use the following structure:

```text
wooglenet/

├── services/
│
│   ├── immich/
│   ├── nextcloud/
│   ├── paperless/
│   ├── plex/
│   ├── vaultwarden/
│   ├── homepage/
│   └── ...
│
├── templates/
│
├── scripts/
│
├── backups/
│
└── standards/
```

---

# Service Directory Standard

## Required Layout

Each service shall reside within its own directory.

Example:

```text
services/immich/

├── compose.yml
├── .env
├── .env.example
├── README.md
└── backups/
```

---

## Purpose

Benefits:

- Simplified Backups
- Easier Recovery
- Service Isolation
- Cleaner Change Management
- Better Automation Support

---

# Required Service Files

## compose.yml

Required:

```text
Yes
```

Purpose:

- Deployment Definition
- Network Definition
- Volume Definition
- Runtime Definition

---

## .env

Required:

```text
Yes
```

Purpose:

- Environment Variables
- Non-Secret Configuration

---

## .env.example

Required:

```text
Yes
```

Purpose:

- Deployment Documentation
- Variable Discovery
- Recovery Support

Secrets must not appear.

---

## README.md

Required:

```text
Yes
```

Purpose:

- Service Documentation
- Recovery Information
- Upgrade Procedures
- Backup Information

---

# Compose File Naming

## Standard

Required:

```text
compose.yml
```

Avoid:

```text
docker-compose.yml
docker-compose.yaml
compose.yaml
```

A single standard simplifies automation.

---

# Environment Variable Standards

## Naming Convention

Format:

```text
UPPERCASE_UNDERSCORE
```

Examples:

```text
TZ

PUID

PGID

HOSTNAME

DOMAIN

MEDIA_PATH

DOCUMENTS_PATH
```

---

## Variable Grouping

Recommended:

```env
# General

TZ=
PUID=
PGID=

# Networking

HOSTNAME=
DOMAIN=

# Storage

MEDIA_PATH=
DOCUMENTS_PATH=
```

---

## Secret Handling

Secrets must never appear in:

```text
compose.yml
README.md
Git Repository
Documentation
```

Reference:

CREDENTIAL-MANAGEMENT-STANDARD.md

---

# Storage Standards

## Required Mapping Strategy

Use explicit host mappings.

Preferred:

```yaml
volumes:
  - /storage/appdata/service:/config
```

Avoid:

```yaml
volumes:
  - service-data:/config
```

unless a documented exception exists.

---

# Standard Storage Locations

## Configuration

```text
/storage/appdata
```

---

## Media

```text
/storage/media
```

---

## Photos

```text
/storage/photos
```

---

## Documents

```text
/storage/documents
```

---

## Downloads

```text
/storage/downloads
```

Reference:

STORAGE-ARCHITECTURE.md

---

# Container Naming Standards

## Format

```text
host-service
```

Examples:

```text
jax-plex

jax-nextcloud

jax-paperless

jax-vaultwarden
```

Reference:

DOCKER-STANDARD.md

---

# Network Standards

## Default Network Type

Preferred:

```yaml
driver: bridge
```

---

## Naming Convention

Format:

```text
service-network
```

Examples:

```yaml
immich-network

paperless-network

nextcloud-network
```

---

## Multi-Service Stacks

Where applications require multiple containers:

Use:

```yaml
shared network
```

within the same stack.

---

## External Networks

External networks require:

- Justification
- Documentation
- Recovery Notes

---

# DNS Standards

Required:

```yaml
dns:
  - 10.0.10.50
  - 10.0.10.51
```

Exceptions require documentation.

Reference:

DNS-ARCHITECTURE.md

---

# Logging Standards

## Required Configuration

```yaml
logging:
  driver: json-file
  options:
    max-size: "10m"
    max-file: "5"
```

---

## Purpose

Provides:

- Log Rotation
- Disk Protection
- Consistent Operations

---

# Health Check Standards

## Requirement

Enable health checks whenever supported.

Preferred:

```yaml
healthcheck:
```

for production services.

---

## Benefits

Supports:

- Monitoring
- Operations
- Certification
- Troubleshooting

---

# Restart Standards

Required:

```yaml
restart: unless-stopped
```

Exceptions require documentation.

---

# Label Standards

## Recommended Labels

```yaml
labels:
  - "com.wooglenet.service=immich"
  - "com.wooglenet.owner=operations"
  - "com.wooglenet.criticality=critical"
```

---

## Purpose

Supports:

- Automation
- Discovery
- Documentation
- Future Reporting

---

# Image Standards

## Version Pinning

Preferred:

```yaml
image: vaultwarden/server:1.34.3
```

Avoid:

```yaml
latest
```

for production deployments.

---

## Approved Sources

Use:

- Official Images
- Vendor Recommended Images
- Trusted Maintainers

Reference:

DOCKER-STANDARD.md

---

# Backup Standards

## Documentation Requirements

Each service README must document:

- Storage Locations
- Backup Requirements
- Recovery Requirements

---

## Classification

Each service must reference:

- Backup Classification
- Recovery Classification

from:

```text
SERVICE-INVENTORY.md
```

---

# Recovery Standards

## Recovery Information

README must include:

```text
Deployment Directory

Storage Locations

Backup Requirements

Restore Process

Dependencies
```

Reference:

SERVICE-DEPENDENCIES.md

---

# Validation Standards

## Deployment Validation

After deployment verify:

- Container Running
- Health Check Passing
- Storage Mounted
- DNS Working
- Monitoring Working

---

## Readiness Validation

Production services must satisfy:

✅ Monitoring Configured

✅ Backup Defined

✅ Recovery Defined

✅ Documentation Complete

✅ Service Inventory Updated

Reference:

service-readiness-matrix.md

---

# Compose Template

## Minimum Template

```yaml
services:

  service-name:

    container_name: jax-service-name

    image: image:version

    restart: unless-stopped

    env_file:
      - .env

    dns:
      - 10.0.10.50
      - 10.0.10.51

    volumes:
      - /storage/appdata/service:/config

    logging:
      driver: json-file
      options:
        max-size: "10m"
        max-file: "5"

    networks:
      - service-network

networks:

  service-network:
    driver: bridge
```

---

# Automation Compatibility

Compose files should support:

- Git Version Control
- Automated Deployment
- Backup Automation
- Validation Automation
- Reporting Automation

Reference:

CONFIGURATION-MANAGEMENT-STANDARD.md

---

# Governance Requirements

Compose deployments must comply with:

- CONFIGURATION-MANAGEMENT-STANDARD.md
- DOCKER-STANDARD.md
- SECURITY-BASELINE.md
- DOCUMENTATION-GOVERNANCE-STANDARD.md
- OPERATIONS-RUNBOOK.md

Non-compliant stacks are not considered production-ready.

---

# Compliance Checklist

Each service stack must have:

- [ ] compose.yml
- [ ] .env
- [ ] .env.example
- [ ] README.md
- [ ] Version-Pinned Images
- [ ] Persistent Storage
- [ ] DNS Configuration
- [ ] Logging Configuration
- [ ] Monitoring Coverage
- [ ] Backup Defined
- [ ] Recovery Defined
- [ ] Service Inventory Entry

---

# Success Criteria

Docker Compose standards are considered implemented when:

- Service Deployments Are Consistent
- Stack Layouts Are Standardized
- Configurations Are Recoverable
- Deployments Support Automation
- Services Meet Readiness Requirements
- Documentation Reflects Reality

This standard serves as the foundation for all current and future Docker service deployments within the WoogleNet environment.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Docker Compose Standard aligned with Docker Standard, Configuration Management Standard, Operational Readiness Framework, and Certification Model |