# Service Security Review Procedure

## Purpose

Provide a structured process for evaluating the security posture of all WoogleNet services.

This review verifies compliance with:

- SECURITY-BASELINE.md
- MFA-STANDARD.md
- SSH-STANDARD.md
- CREDENTIAL-MANAGEMENT-STANDARD.md
- REMOTE-ACCESS.md
- FIREWALL-RULES.md
- secrets-management-standard.md

The objective is to identify security gaps, validate existing controls, and ensure services remain compliant with WoogleNet security standards.

---

# Review Frequency

## Quarterly

Perform:

- Security Review
- Credential Review
- Access Review
- Service Exposure Review

---

## Annual

Perform:

- Full Security Audit
- Security Standards Review
- Exception Review
- Risk Assessment

---

# Review Scope

The review applies to:

## Infrastructure

- DAX
- MAX
- PAX
- JAX
- OpenMediaVault

---

## Core Services

- AdGuard
- Homepage
- Uptime Kuma
- Tailscale

---

## Media Services

- Plex
- Audiobookshelf
- Immich
- Navidrome

---

## Automation Services

- Home Assistant
- Vaultwarden
- Sonarr
- Radarr
- Lidarr
- Readarr
- Bazarr
- Overseerr
- qBittorrent
- Prowlarr

---

## Knowledge Platform

- Paperless
- Nextcloud
- Syncthing
- BookStack

---

## Backup Platform

- Kopia
- OneDrive Backup Repository

---

# Security Review Objectives

Validate:

- Authentication
- Authorization
- Network Exposure
- Administrative Access
- Secrets Management
- Backup Protection
- Monitoring Coverage
- Recovery Capability

---

# Security Classification Review

## Tier 1 Critical

Services:

- Vaultwarden
- Home Assistant
- Immich
- Paperless
- Nextcloud
- BookStack

Review Focus:

- MFA
- Backup Protection
- Administrative Access
- Recovery Validation

---

## Tier 2 Important

Services:

- Navidrome
- Audiobookshelf
- Syncthing
- Homepage
- Uptime Kuma

Review Focus:

- Authentication
- Backup Protection
- Access Control

---

## Tier 3 Rebuildable

Services:

- Plex
- ARR Stack
- AdGuard
- Gluetun

Review Focus:

- Configuration Backup
- Administrative Access
- Network Exposure

---

# Service Security Review Workflow

Service Inventory
↓
Exposure Review
↓
Authentication Review
↓
Authorization Review
↓
Credential Review
↓
Logging Review
↓
Backup Validation
↓
Risk Assessment
↓
Remediation Plan

---

# Authentication Review

Verify:

- MFA Required Accounts Protected
- MFA Coverage Current
- Administrative Access Controlled
- Shared Accounts Eliminated

Reference:

MFA-STANDARD.md

---

# MFA Validation

Administrative Services:

Verify:

- [ ] Vaultwarden
- [ ] Tailscale
- [ ] Home Assistant
- [ ] Nextcloud Administration
- [ ] Paperless Administration
- [ ] BookStack Administration
- [ ] OneDrive Backup Administration

Result:

PASS / FAIL

---

# Authorization Review

Verify:

- Least Privilege Applied
- Administrative Roles Assigned Correctly
- Unused Accounts Removed
- Permissions Appropriate

Result:

PASS / FAIL

---

# Network Exposure Review

## Public Exposure

Verify:

- Service Publicly Accessible Only When Intended

Expected Public Services:

None

Exception:

Plex (if intentionally exposed)

Result:

PASS / FAIL

---

## Internal Services

Verify:

- Administrative Services Restricted
- Internal-Only Services Protected
- Firewall Policies Applied

Result:

PASS / FAIL

---

# SSH Security Review

Reference:

SSH-STANDARD.md

Verify:

- [ ] Root Login Disabled
- [ ] Public Key Authentication Enabled
- [ ] Internet SSH Exposure Eliminated
- [ ] Tailscale Access Functional
- [ ] Administrative Accounts Validated

Result:

PASS / FAIL

---

# Credential Review

Reference:

CREDENTIAL-MANAGEMENT-STANDARD.md

Verify:

- [ ] Vaultwarden Updated
- [ ] Credential Ownership Documented
- [ ] Recovery Information Current
- [ ] Shared Administrative Accounts Eliminated
- [ ] Unknown Credentials Eliminated

Result:

PASS / FAIL

---

# Secrets Management Review

Verify:

- [ ] Secrets Stored In Vaultwarden
- [ ] No Secrets In Git
- [ ] No Secrets In Documentation
- [ ] No Secrets In Compose Files

Result:

PASS / FAIL

---

# Service Account Review

Verify:

- [ ] Service Accounts Required
- [ ] Permissions Appropriate
- [ ] Credentials Protected
- [ ] Accounts Documented

Result:

PASS / FAIL

---

# Firewall Review

Reference:

FIREWALL-RULES.md

Verify:

- [ ] Administrative Ports Restricted
- [ ] SSH Restricted
- [ ] Management Traffic Restricted
- [ ] VLAN Controls Functional

Result:

PASS / FAIL

---

# Tailscale Review

Verify:

- [ ] Administrative Access Functional
- [ ] Device Inventory Current
- [ ] Unknown Devices Removed
- [ ] MFA Enabled

Result:

PASS / FAIL

---

# Monitoring Review

Verify:

- [ ] Uptime Kuma Coverage Complete
- [ ] Alerts Functional
- [ ] Critical Services Monitored
- [ ] Backup Alerts Functional

Result:

PASS / FAIL

---

# Backup Security Review

Verify:

- [ ] Backup Encryption Enabled
- [ ] Kopia Repository Protected
- [ ] OneDrive Replication Protected
- [ ] Recovery Credentials Protected

Result:

PASS / FAIL

---

# Logging Review

Verify:

- [ ] Authentication Logs Present
- [ ] Administrative Activity Logged
- [ ] Failed Login Activity Reviewed
- [ ] Security Events Reviewed

Result:

PASS / FAIL

---

# Service Security Checklist

## Exposure

Verify:

- [ ] Service Not Exposed Unnecessarily
- [ ] Internet Access Reviewed
- [ ] Firewall Rules Reviewed

Result:

PASS / FAIL

---

## Authentication

Verify:

- [ ] MFA Validated
- [ ] Local Accounts Reviewed
- [ ] Administrative Accounts Reviewed

Result:

PASS / FAIL

---

## Authorization

Verify:

- [ ] Permissions Appropriate
- [ ] Least Privilege Applied
- [ ] Unused Accounts Removed

Result:

PASS / FAIL

---

## Recovery

Verify:

- [ ] Backup Present
- [ ] Recovery Documented
- [ ] Recovery Validated

Result:

PASS / FAIL

---

# Findings Classification

## Critical

Examples:

- Missing MFA
- Public Administrative Exposure
- Unknown Administrative Account
- Missing Backup Protection
- Exposed Credentials

Response Target:

Immediate

---

## High

Examples:

- Weak Password
- Excess Permissions
- Missing Documentation
- Missing Recovery Information

Response Target:

30 Days

---

## Medium

Examples:

- Stale Account
- Delayed Review
- Monitoring Gap

Response Target:

90 Days

---

# Remediation Tracking

Finding ID:

____________________

Service:

____________________

Severity:

- Critical
- High
- Medium

Owner:

____________________

Target Date:

____________________

Status:

OPEN / IN PROGRESS / CLOSED

---

# Security Review Record

Review Date:

____________________

Reviewer:

____________________

Services Reviewed:

_________________________________

_________________________________

_________________________________

Critical Findings:

_________________________________

_________________________________

_________________________________

High Findings:

_________________________________

_________________________________

_________________________________

Medium Findings:

_________________________________

_________________________________

_________________________________

---

# Evidence Collection

Capture:

- MFA Review Results
- SSH Review Results
- Credential Review Results
- Exposure Review Results
- Firewall Validation Results
- Monitoring Validation Results
- Backup Security Results

Store In:

BookStack

And

Security Audit Documentation

---

# Review Success Criteria

The review is complete when:

- All Services Reviewed
- Exposure Reviewed
- MFA Reviewed
- Credentials Reviewed
- SSH Reviewed
- Backup Security Reviewed
- Findings Classified
- Remediation Assigned
- Documentation Updated

Review Status:

PASS / FAIL

Reviewer:

____________________

Date:

____________________