# jax-stirlingpdf

## Purpose

Deploy Stirling-PDF on JAX to provide self-hosted PDF management, conversion, manipulation, and document processing services.

Stirling-PDF provides:

- PDF Merging
- PDF Splitting
- OCR Processing
- PDF Compression
- PDF Conversion
- Metadata Management
- Watermarking
- Document Redaction
- Page Manipulation
- Digital Document Utilities

Reference Documents:

- STORAGE-MAP.md
- docker-standard.md
- SECURITY-BASELINE.md
- SERVICE-DEPENDENCIES.md

---

# Deployment Information

Host:

JAX

Platform:

Docker

Service Name:

jax-stirlingpdf

Role:

Document Processing Platform

---

# Architecture Role

Stirling-PDF provides document utility functions for users and complements the document management ecosystem.

Workflow:

User
↓
Stirling-PDF
↓
Document Processing
↓
Processed Output

Related Services:

- Paperless-ngx
- Nextcloud
- Syncthing

Stirling-PDF is not a document repository.

It is a document processing service.

---

# Resource Allocation

CPU:

2 vCPU

Memory:

4 GB

Storage:

10 GB

---

# Storage Configuration

Application Data:

/storage/appdata/stirling-pdf

Working Area:

/storage/documents/stirling-pdf

Container Mounts:

/storage/appdata/stirling-pdf
→
/config

/storage/documents/stirling-pdf
→
/documents

Backup Classification:

Low

Backup Required:

Optional

Reference:

STORAGE-MAP.md

---

# Document Processing Repository

Purpose:

Temporary document staging and processing.

Structure:

/storage/documents/stirling-pdf
├── uploads
├── processed
├── exports
└── archive

Users should move finalized documents into:

/storage/documents/paperless

or

/storage/documents/nextcloud

as appropriate.

---

# Service Dependencies

Required Services:

- DNS
- Storage
- Network

Optional Services:

- Paperless-ngx
- Nextcloud
- Syncthing

Reference:

SERVICE-DEPENDENCIES.md

---

# Supported Functions

## PDF Operations

- Merge PDFs
- Split PDFs
- Reorder Pages
- Rotate Pages
- Remove Pages
- Extract Pages

---

## Conversion Functions

- Images To PDF
- PDF To Images
- Office Documents To PDF
- PDF Format Conversion

---

## OCR Functions

- Optical Character Recognition
- Searchable PDF Creation
- Text Extraction

---

## Security Functions

- Password Protection
- Password Removal
- Redaction
- Metadata Removal
- Watermarking

---

## Optimization Functions

- PDF Compression
- Image Optimization
- File Size Reduction

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

Required Permissions:

- Read Documents
- Write Documents
- Create Processed Files
- Delete Temporary Files

Required Access:

/storage/documents/stirling-pdf

Validation:

- Upload File
- Create Processed Output
- Delete Temporary Data

---

# Security Requirements

Container Execution:

Non-root where supported.

Document Handling:

- Temporary Files Removed After Processing
- Administrative Access Restricted
- Sensitive Documents Protected

Credential Storage:

Vaultwarden

Reference:

SECURITY-BASELINE.md

secrets-management-standard.md

---

# Privacy Requirements

Documents processed by Stirling-PDF may contain:

- Personal Information
- Financial Documents
- Medical Records
- Family Documents

Users are responsible for ensuring processed documents are stored appropriately.

Preferred Long-Term Storage:

- Paperless-ngx
- Nextcloud

---

# Monitoring Requirements

Monitor:

- Container Health
- Web Interface Availability
- Storage Availability
- OCR Processing Availability

Alert Level:

Low

Reference:

MONITORING-AND-ALERTING.md

---

# Backup Requirements

Backup:

- Configuration
- Application Settings

Do Not Backup:

- Temporary Uploads
- Processing Cache
- Temporary Exports
- Container Images

Frequency:

Weekly

---

# Validation

Verify:

- Container Running
- Web Interface Accessible
- PDF Upload Successful
- PDF Merge Successful
- PDF Split Successful
- OCR Successful
- Output File Created
- Storage Permissions Validated

Validation Workflow:

1. Start Container
2. Access Web Interface
3. Upload Test PDF
4. Merge Multiple PDFs
5. Split PDF
6. Perform OCR Operation
7. Export Processed File
8. Verify Output Written To Storage

---

# Failure Scenarios

## Upload Failure

Symptoms:

- Files Cannot Be Uploaded

Actions:

- Verify Storage Mounts
- Verify Permissions
- Verify Available Capacity

---

## OCR Failure

Symptoms:

- OCR Jobs Fail
- Searchable PDFs Not Created

Actions:

- Review Container Logs
- Verify OCR Components
- Restart Service

---

## Processing Failure

Symptoms:

- Conversion Jobs Fail
- Export Files Missing

Actions:

- Verify Available Storage
- Verify File Permissions
- Review Application Logs

---

## Storage Failure

Symptoms:

- Uploads Missing
- Exports Missing
- Processing Errors

Actions:

- Verify OMV Availability
- Verify Storage Mounts
- Verify Capacity
- Verify Permissions

---

# Recovery Procedure

1. Restore Container
2. Restore Configuration
3. Verify Storage Mounts
4. Verify File Permissions
5. Upload Test Document
6. Verify PDF Operations
7. Verify OCR Functionality
8. Validate Export Process
9. Return Service To Production

---

# Success Criteria

Deployment is complete when:

- Stirling-PDF Operational
- Web Interface Accessible
- PDF Operations Functional
- OCR Functional
- Storage Accessible
- Monitoring Configured
- Documentation Updated