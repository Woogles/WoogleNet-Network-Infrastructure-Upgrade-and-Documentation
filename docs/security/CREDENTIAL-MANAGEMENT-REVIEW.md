# Credential Management Review Standard

## Purpose

Establish a repeatable process for reviewing credentials, authentication methods, secrets storage, account ownership, and privileged access throughout the WoogleNet environment.

The objective is to:

- Reduce Credential Risk
- Eliminate Unknown Credentials
- Validate MFA Coverage
- Verify Account Ownership
- Enforce Least Privilege
- Improve Audit Readiness
- Support Recovery Operations

Reference Documents:

- SECURITY-BASELINE.md
- secrets-management-standard.md
- mfa-enforcement.md
- ssh-hardening.md
- RECOVERY-TIME-OBJECTIVES.md

---

# Security Philosophy

Every credential should have:

- A Known Owner
- A Business Purpose
- Appropriate Permissions
- Secure Storage
- Recovery Procedures

Unknown credentials represent security risk.

Shared credentials should be eliminated whenever possible.

Administrative credentials require stronger controls than standard user credentials.

---

# Credential Categories

## Administrative Credentials

Examples:

- Proxmox
- OpenMediaVault
- Tailscale
- Vaultwarden
- Home Assistant
- OneDrive Backup Administration

Risk Level:

Critical

MFA:

Required

Review Frequency:

Quarterly

---

## Service Credentials

Examples:

- Databases
- API Keys
- Application Secrets
- Service Accounts

Risk Level:

High

MFA:

Not Applicable

Review Frequency:

Quarterly

---

## User Credentials

Examples:

- Nextcloud
- Paperless
- BookStack

Risk Level:

Medium

MFA:

Recommended

Review Frequency:

Annually

---

## Media Credentials

Examples:

- Plex
- Audiobookshelf
- Navidrome

Risk Level:

Low

MFA:

Optional

Review Frequency:

Annually

---

# Credential Storage Standard

Approved Storage:

✅ Vaultwarden

✅ Local .env Files

---

Prohibited Storage:

❌ Git Repositories

❌ Documentation Files

❌ BookStack Pages

❌ Screenshots

❌ Text Files

❌ Shared Documents

Reference:

secrets-management-standard.md

---

# Vaultwarden Requirements

Vaultwarden serves as the authoritative credential repository.

Store:

- Administrative Credentials
- Service Credentials
- Recovery Codes
- Encryption Passwords
- SSH Recovery Documentation
- Backup Recovery Information

Vaultwarden itself must be protected by MFA.

Reference:

mfa-enforcement.md

---

# Credential Ownership Review

Every credential must have:

Owner:

Named Person

Purpose:

Documented

System:

Documented

Review Date:

Recorded

---

Unknown Ownership:

Not Permitted

Shared Ownership:

Avoid Whenever Possible

---

# Administrative Credential Review

Frequency:

Quarterly

Review:

- Account Ownership
- MFA Status
- Access Requirements
- Privilege Assignment

Systems:

- Vaultwarden
- Tailscale
- Proxmox
- OpenMediaVault
- Home Assistant
- Nextcloud Administration
- Paperless Administration
- BookStack Administration
- Backup Administration

---

# Service Account Review

Frequency:

Quarterly

Review:

- Account Purpose
- Password Rotation
- Secret Storage
- Required Permissions

Verify:

- Account Still Required
- Least Privilege Applied
- Documentation Current

---

# Password Standards

Administrative Accounts:

Minimum:

16 Characters

Recommended:

20+ Characters

---

Service Accounts:

Minimum:

20 Characters

Recommended:

Randomly Generated

---

Family User Accounts:

Minimum:

12 Characters

Recommended:

Passphrase Style

---

# Credential Rotation Policy

## Administrative Accounts

Rotate:

- Upon Suspected Exposure
- Upon Personnel Change
- Upon Security Incident

Annual Rotation Recommended

---

## Service Credentials

Rotate:

- Upon Suspected Exposure
- During Major Platform Changes
- When Application Supports Rotation

---

## Recovery Credentials

Review:

Annually

Verify:

- Accessible
- Functional
- Current

---

# MFA Review

Administrative MFA Coverage Target:

100%

Review:

- Vaultwarden
- Tailscale
- Backup Administration
- Home Assistant Administration
- Nextcloud Administration
- Paperless Administration
- BookStack Administration

Reference:

mfa-enforcement.md

---

# API Key Review

Frequency:

Quarterly

Review:

- API Usage
- Ownership
- Purpose
- Expiration

Remove:

- Unused Keys
- Unknown Keys
- Deprecated Keys

---

# SSH Credential Review

Frequency:

Quarterly

Reference:

ssh-hardening.md

Verify:

- Authorized Users
- SSH Key Owners
- Key Validity
- Unused Keys Removed

---

# Credential Audit Checklist

## Administrative Accounts

Verify:

- [ ] Owner Identified
- [ ] MFA Enabled
- [ ] Strong Password Configured
- [ ] Purpose Documented

Result:

PASS / FAIL

---

## Service Accounts

Verify:

- [ ] Account Required
- [ ] Password Stored In Vaultwarden
- [ ] Permissions Appropriate
- [ ] Documentation Current

Result:

PASS / FAIL

---

## Vaultwarden Review

Verify:

- [ ] Credentials Stored
- [ ] Recovery Codes Present
- [ ] Backup Credentials Present
- [ ] Encryption Passwords Present

Result:

PASS / FAIL

---

## API Keys

Verify:

- [ ] Purpose Documented
- [ ] Owner Known
- [ ] Unused Keys Removed
- [ ] Secrets Protected

Result:

PASS / FAIL

---

## SSH Credentials

Verify:

- [ ] Unknown Keys Removed
- [ ] Shared Keys Removed
- [ ] Documentation Current

Result:

PASS / FAIL

---

## Recovery Documentation

Verify:

- [ ] Recovery Codes Present
- [ ] Recovery Procedures Current
- [ ] Backup Credentials Current

Result:

PASS / FAIL

---

# Credential Inventory Template

Credential Name:

____________________

System:

____________________

Category:

- Administrative
- Service
- User
- Media

Owner:

____________________

Purpose:

____________________

Stored In Vaultwarden:

YES / NO

MFA Enabled:

YES / NO / N/A

Last Reviewed:

____________________

Next Review:

____________________

Status:

ACTIVE / RETIRE / ROTATE

---

# Common Findings

## Critical

- Unknown Credential Owner
- Missing MFA
- Shared Administrative Account
- Credentials Stored Outside Vaultwarden
- Missing Recovery Information

---

## High

- Weak Password
- Excess Permissions
- Unused Administrative Account
- Stale API Key

---

## Medium

- Missing Documentation
- Delayed Review
- Unused User Account

---

# Remediation Process

If Findings Are Discovered:

1. Document Finding

2. Assign Owner

3. Determine Risk Level

4. Create Remediation Plan

5. Execute Remediation

6. Validate Resolution

7. Update Documentation

---

# Evidence Collection

Capture:

- Credential Inventory
- MFA Validation Results
- Vaultwarden Audit Results
- API Key Review Results
- Administrative Account Review
- SSH Credential Review

Store In:

BookStack

And

Security Audit Documentation

---

# Success Criteria

This standard is implemented when:

- All Critical Credentials Have Owners
- Administrative MFA Coverage Is 100%
- Vaultwarden Is Authoritative Source
- Unknown Credentials Eliminated
- Shared Administrative Accounts Eliminated
- Recovery Credentials Verified
- Quarterly Reviews Established
- Audit Checklist Completed
- Documentation Updated