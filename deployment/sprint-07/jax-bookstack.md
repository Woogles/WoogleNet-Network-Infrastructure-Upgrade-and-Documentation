# jax-bookstack

## Purpose

Deploy BookStack on JAX to provide centralized documentation, operational procedures, knowledge management, runbooks, architecture documentation, and long-term organizational knowledge retention.

BookStack provides:

- Knowledge Management
- Documentation Management
- Runbook Storage
- Architecture Documentation
- Operational Procedures
- Internal Wiki
- Searchable Knowledge Base
- Documentation Version History

Reference Documents:

- SERVICE-DEPENDENCIES.md
- SECURITY-BASELINE.md
- RECOVERY-TIME-OBJECTIVES.md
- OPERATIONS-RUNBOOK.md
- docker-standard.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-bookstack

Role:

Knowledge Management Platform

Port:

6875/TCP

---

# Architecture Role

BookStack serves as the authoritative repository for operational and technical knowledge within WoogleNet.

Workflow:

Knowledge
↓
BookStack
↓
Organization
↓
Documentation
↓
Search
↓
Knowledge Retrieval

Related Services:

- Paperless-ngx
- Nextcloud
- Home Assistant
- Vaultwarden

BookStack stores knowledge and procedures.

Paperless stores records and documents.

---

# Resource Allocation

CPU:

2 vCPU

Memory:

4 GB

Storage:

20 GB

---

# Service Classification

Service Tier:

Tier 1 Critical

Recovery Priority:

1

Target Recovery Time:

Same Day

Target Recovery Point:

24 Hours

Reference:

RECOVERY-TIME-OBJECTIVES.md

---

# Storage Configuration

Application Data:

/storage/appdata/bookstack

BookStack Repository:

/storage/documents/bookstack

Attachments:

/storage/documents/bookstack/attachments

Exports:

/storage/documents/bookstack/export

Container Mounts:

/storage/appdata/bookstack
→
/config

/storage/documents/bookstack/attachments
→
/attachments

/storage/documents/bookstack/export
→
/exports

Backup Classification:

Critical

Backup Required:

Yes

Reference:

STORAGE-MAP.md

---

# Repository Structure

BookStack Repository:

/storage/documents/bookstack

Structure:

/storage/documents/bookstack
├── attachments
└── export

Purpose:

attachments

- Images
- Diagrams
- PDFs
- Supporting Documentation

export

- Backup Exports
- Knowledge Exports
- Migration Exports

Knowledge content itself is maintained within the BookStack database.

---

# Service Dependencies

Required Services:

- DNS
- Storage
- Network

Optional Services:

- Paperless-ngx
- Nextcloud
- Home Assistant

Reference:

SERVICE-DEPENDENCIES.md

---

# Knowledge Organization

Books:

- Architecture
- Infrastructure
- Operations
- Security
- Storage
- Automation
- Network
- Services

Chapters:

- Service Guides
- Procedures
- Standards
- Troubleshooting
- Recovery

Pages:

- Runbooks
- Deployment Guides
- Technical Notes
- Operational Procedures

---

# Documentation Standards

BookStack should become the authoritative source for:

- Architecture Documentation
- Deployment Procedures
- Service Documentation
- Runbooks
- Operational Procedures
- Recovery Procedures
- Lessons Learned

Documents should be searchable and regularly reviewed.

---

# Content Classification

Recommended Categories:

Architecture

- Network
- Infrastructure
- Storage

Operations

- Procedures
- Monitoring
- Maintenance

Security

- Standards
- Reviews
- Audits

Recovery

- Runbooks
- Incident Response
- Disaster Recovery

---

# Knowledge Lifecycle

Knowledge Creation
↓
BookStack Entry
↓
Review
↓
Publication
↓
Operational Usage
↓
Periodic Review
↓
Revision

Knowledge should remain current and aligned with the production environment.

---

# Search Capabilities

BookStack provides:

- Full Text Search
- Page Search
- Chapter Search
- Tag Search

Requirements:

- All critical procedures documented
- All services documented
- Runbooks searchable

---

# Network Configuration

DNS Servers:

10.0.10.50

10.0.10.51

Provided By:

- AdGuard Primary
- AdGuard Secondary

Reference:

DNS-ARCHITECTURE.md

---

# Access Policy

Allowed Access:

- Trusted VLAN
- Tailscale

Administrative Access:

- Trusted VLAN
- Tailscale

Public Internet Access:

Not Permitted

Reference:

REMOTE-ACCESS.md

---

# File Permissions

User:

media

Group:

media

Recommended PUID:

1000

Recommended PGID:

1000

Required Permissions

Read/Write:

/storage/documents/bookstack/attachments

Read/Write:

/storage/documents/bookstack/export

Create:

- Page Attachments
- Images
- Exports
- Recovery Files

Modify:

- Existing Attachments
- Existing Exports

Delete:

- Deprecated Attachments
- Obsolete Exports

---

# Permission Validation

Verify:

- Attachment Upload
- Attachment Download
- Export Generation
- Export Retrieval

Result:

PASS / FAIL

---

# Security Requirements

Knowledge Classification:

Critical Operational Information

Content May Include:

- Network Architecture
- Recovery Procedures
- Service Documentation
- Security Standards
- Administrative Procedures

Requirements:

- No Internet Exposure
- Tailscale Protected Access
- Regular Backups
- Administrative Access Controls

Reference:

SECURITY-BASELINE.md

---

# Credential Management

Administrative Credentials:

Vaultwarden

Secrets Storage:

Vaultwarden

Do Not Store:

- Credentials In Git
- Credentials In Documentation
- Credentials In Compose Files

Passwords, API Keys, and Secrets should not be documented directly in BookStack.

Reference:

secrets-management-standard.md

---

# Monitoring Requirements

Monitor:

- Container Health
- Web Interface Availability
- Database Health
- Attachment Storage
- Search Functionality

Alert Level:

Critical

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Configuration
- Database
- Attachments
- Export Repository

Do Not Backup:

- Temporary Cache Files
- Session Data

Frequency:

Daily

Offsite Backup:

Required

Reference:

BACKUP-AND-RESTORE.md

---

# Validation

Verify:

- Container Running
- Web Interface Accessible
- Book Creation Functional
- Chapter Creation Functional
- Page Creation Functional
- Search Functional
- Attachment Upload Functional
- Export Functional
- Backup Functional

Validation Workflow:

1. Start Service
2. Create Test Book
3. Create Test Chapter
4. Create Test Page
5. Upload Attachment
6. Search Page Content
7. Export Documentation
8. Verify Backup Included
9. Verify Restore Procedure

---

# Failure Scenarios

## Search Failure

Symptoms:

- Search Returns No Results
- Missing Content Discovery

Actions:

- Verify Database
- Rebuild Search Index
- Validate Storage

---

## Database Failure

Symptoms:

- Missing Pages
- Login Issues
- Content Unavailable

Actions:

- Verify Database Availability
- Restore Database Backup
- Validate Configuration

---

## Attachment Failure

Symptoms:

- Attachment Upload Errors
- Missing Images
- Missing Documents

Actions:

- Verify Storage
- Verify Mounts
- Verify Permissions

---

## Storage Failure

Symptoms:

- Export Failures
- Missing Attachments

Actions:

- Verify OMV Availability
- Verify Storage Capacity
- Verify Permissions

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Restore Database
4. Restore Attachments
5. Restore Export Repository
6. Verify Search Functionality
7. Verify Page Availability
8. Verify Attachment Availability
9. Perform Restore Validation
10. Return Service To Production

---

# Success Criteria

Deployment is complete when:

- BookStack Operational
- Documentation Functional
- Search Functional
- Attachments Functional
- Exports Functional
- Backups Operational
- Recovery Validation Successful
- Monitoring Configured
- Documentation Updated