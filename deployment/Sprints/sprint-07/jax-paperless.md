# jax-paperless

## Purpose

Deploy Paperless-ngx on JAX to provide centralized document management, archival, OCR processing, indexing, tagging, and document search capabilities for the WoogleNet environment.

Paperless-ngx provides:

- Document Ingestion
- Optical Character Recognition (OCR)
- Full Text Search
- Automated Document Classification
- Tag Management
- Document Retention
- Digital Document Archive
- Metadata Management

Reference Documents:

- STORAGE-MAP.md
- SERVICE-DEPENDENCIES.md
- SECURITY-BASELINE.md
- RECOVERY-TIME-OBJECTIVES.md
- docker-standard.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-paperless

Role:

Document Management Platform

Port:

8000/TCP

---

# Architecture Role

Paperless-ngx serves as the authoritative repository for personal and household documents.

Workflow:

Document
↓
Paperless Consume Directory
↓
OCR Processing
↓
Classification
↓
Tagging
↓
Archive Storage
↓
Search & Retrieval

Related Services:

- Nextcloud
- Syncthing
- Stirling-PDF
- Home Assistant

Paperless becomes the primary destination for long-term document retention.

---

# Resource Allocation

CPU:

4 vCPU

Memory:

8 GB

Storage:

50 GB Initial Allocation

Expandable Through OMV Storage

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

/storage/appdata/paperless

Paperless Repository:

/storage/documents/paperless

Paperless Data:

/storage/documents/paperless/data

Paperless Media:

/storage/documents/paperless/media

Paperless Export:

/storage/documents/paperless/export

Paperless Consume:

/storage/documents/paperless/consume

Container Mounts:

/storage/appdata/paperless
→
/config

/storage/documents/paperless/data
→
/usr/src/paperless/data

/storage/documents/paperless/media
→
/usr/src/paperless/media

/storage/documents/paperless/export
→
/usr/src/paperless/export

/storage/documents/paperless/consume
→
/usr/src/paperless/consume

Backup Classification:

Critical

Backup Required:

Yes

Reference:

STORAGE-MAP.md

---

# Document Storage Structure

Paperless Repository:

/storage/documents/paperless

Structure:

/storage/documents/paperless
├── consume
├── data
├── media
└── export

Purpose:

consume

- Incoming Documents
- Automated Imports
- Scanner Deposits

data

- Database Data
- Search Indexes
- Application State

media

- Archived Documents
- OCR Documents
- Permanent Storage

export

- Recovery Exports
- Migrations
- Backup Validation

---

# Service Dependencies

Required Services:

- DNS
- Storage
- Network

Optional Services:

- Nextcloud
- Syncthing
- Stirling-PDF

Reference:

SERVICE-DEPENDENCIES.md

---

# Document Sources

Supported Sources:

- Scanned Documents
- PDF Documents
- Receipts
- Financial Records
- Medical Documents
- Insurance Records
- Tax Records
- Manuals
- Home Documentation
- Warranty Documents
- Vehicle Records

---

# Document Ingestion Workflow

Manual Upload

User
↓
Paperless
↓
OCR
↓
Archive

---

Automated Ingestion

Document
↓
Consume Folder
↓
OCR
↓
Classification
↓
Archive

---

# Document Lifecycle

Document
↓
Consume Directory
↓
OCR Processing
↓
Metadata Extraction
↓
Tag Assignment
↓
Archive Storage
↓
Search Index
↓
Export Repository

Final Storage Location:

/storage/documents/paperless/media

This workflow should remain fully automated whenever possible.

---

# OCR Processing

Functions:

- Image OCR
- PDF OCR
- Searchable PDF Generation
- Metadata Extraction
- Text Recognition
- Search Index Creation

Requirements:

- OCR Enabled
- Searchable Documents
- Automated Processing

---

# Metadata Standards

Suggested Tags:

- Financial
- Medical
- Insurance
- Tax
- Vehicle
- Property
- Family
- Technology
- Education
- Utilities

Document Types:

- Statements
- Receipts
- Invoices
- Contracts
- Reports
- Warranties

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

Read:

/storage/documents/paperless/consume

Read/Write:

/storage/documents/paperless/data

Read/Write:

/storage/documents/paperless/media

Read/Write:

/storage/documents/paperless/export

Create:

- OCR Output
- Metadata Files
- Archive Records
- Search Index Data

Modify:

- Tags
- Metadata
- Document Associations

Delete:

- Processed Consume Files
- Temporary OCR Files
- Temporary Processing Data

---

# Permission Validation

Verify:

- Document Upload
- Consume Directory Processing
- OCR Output Creation
- Metadata Updates
- Search Index Updates
- Export Generation

Result:

PASS / FAIL

Without correct permissions Paperless will fail document ingestion, OCR processing, and export operations.

---

# Security Requirements

Document Classification:

Critical Personal Data

Possible Contents:

- Medical Records
- Financial Records
- Insurance Records
- Tax Documents
- Identity Documents
- Property Records
- Family Records

Requirements:

- No Internet Exposure
- Tailscale Protected Access
- Strong Authentication
- Regular Backups
- Recovery Validation

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

Reference:

secrets-management-standard.md

---

# Monitoring Requirements

Monitor:

- Container Health
- Web Interface Availability
- OCR Processing
- Storage Capacity
- Database Health
- Consume Folder Processing
- Search Index Health

Alert Level:

Critical

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Application Configuration
- Data Directory
- Media Directory
- Export Directory
- Database
- OCR Metadata
- Search Indexes

Do Not Backup:

- Temporary Cache Files
- Processing Cache
- Temporary OCR Files

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
- OCR Functional
- Document Upload Successful
- Consume Directory Processing Functional
- Metadata Extraction Functional
- Search Functional
- Export Functional
- Backup Functional

Validation Workflow:

1. Start Service
2. Upload Test Document
3. Verify OCR Processing
4. Search For Document Text
5. Verify Metadata Extraction
6. Verify Tag Creation
7. Export Document
8. Verify Backup Included
9. Verify Restore Procedure

---

# Failure Scenarios

## OCR Failure

Symptoms:

- Documents Uploaded
- Search Not Functional

Actions:

- Verify OCR Engine
- Review Logs
- Restart Processing Services

---

## Storage Failure

Symptoms:

- Upload Failures
- Missing Documents

Actions:

- Verify OMV Availability
- Verify Mounts
- Verify Permissions

---

## Database Failure

Symptoms:

- Missing Metadata
- Search Failures

Actions:

- Verify Database Availability
- Restore Database Backup
- Validate Storage

---

## Consume Directory Failure

Symptoms:

- Documents Not Imported

Actions:

- Verify Permissions
- Verify Watch Folder
- Review Logs

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Restore Database
4. Restore Media Repository
5. Restore Export Repository
6. Verify OCR Functionality
7. Verify Search Functionality
8. Verify Document Access
9. Perform Restore Validation
10. Return Service To Production

---

# Success Criteria

Deployment is complete when:

- Paperless Operational
- OCR Functional
- Search Functional
- Metadata Extraction Functional
- Document Archive Functional
- Backups Operational
- Recovery Validation Successful
- Monitoring Configured
- Documentation Updated