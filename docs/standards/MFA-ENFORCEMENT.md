# MFA Enforcement Standard

## Purpose

Establish Multi-Factor Authentication (MFA) requirements for the WoogleNet environment while balancing security, usability, family adoption, and operational supportability.

This standard defines:

- Required MFA Accounts
- Optional MFA Accounts
- Service MFA Requirements
- Recovery Procedures
- Administrative Enforcement
- Family User Guidance

Reference Documents:

- SECURITY-BASELINE.md
- REMOTE-ACCESS.md
- secrets-management-standard.md
- credential-management-review.md

---

# Security Philosophy

The objective is to provide strong protection for privileged accounts while minimizing unnecessary burden on family members and media-consumption users.

Core Principle:

Administrative Accounts
=
Mandatory MFA

Standard User Accounts
=
Recommended MFA

Device-Based Media Access
=
No MFA Requirement

Security controls should protect administration and infrastructure without negatively impacting normal household use.

---

# MFA Classification Model

## Tier 1

Required

Administrative Accounts

---

## Tier 2

Recommended

Interactive User Accounts

---

## Tier 3

Optional

Streaming Devices
Media Endpoints
Guest Usage

---

# Administrative MFA Requirements

MFA is mandatory for all accounts capable of administering infrastructure.

Administrative systems include:

- Vaultwarden
- Home Assistant
- Nextcloud
- Paperless
- BookStack
- Tailscale
- Microsoft Accounts Used For Administration
- OneDrive Backup Administration
- Backup Platforms
- Hypervisor Administration
- Storage Administration

Administrative access without MFA is prohibited.

---

# Administrative User Requirements

Administrative Users:

- Eric

Future administrators:

- Must Enable MFA Before Receiving Access
- Must Store Recovery Information Securely
- Must Complete Recovery Validation

---

# Service Account Requirements

Service Accounts:

- Local Service Accounts
- Container Accounts
- Automation Accounts

MFA:

Not Applicable

Requirements:

- Strong Passwords
- Least Privilege
- Credential Storage In Vaultwarden

Reference:

secrets-management-standard.md

---

# Family User MFA Policy

## Recommended

Family users should enable MFA where practical.

Examples:

- Nextcloud
- Paperless
- BookStack

Benefits:

- Better Account Protection
- Reduced Risk From Password Reuse
- Reduced Risk From Credential Exposure

---

## Not Mandatory

Family members are not required to enable MFA if:

- Their account is not administrative
- Their account has limited permissions
- Enabling MFA would significantly reduce usability

This policy exists to reduce operational burden and support adoption.

---
# Family User MFA Rollout Plan

## Purpose

Encourage MFA adoption without creating barriers to media consumption, family device usage, or day-to-day access.

The goal is to improve security through gradual adoption rather than mandatory enforcement.

---

# Rollout Strategy

## Phase 1

Administrative Accounts

Status:

Required

Users:

- Eric
- Future Administrators

Requirements:

- MFA Enabled
- Recovery Codes Stored
- Recovery Procedures Tested

Completion Target:

Immediate

---

## Phase 2

Knowledge Platform Users

Status:

Recommended

Services:

- Nextcloud
- Paperless
- BookStack

Approach:

Offer MFA during account setup.

Users may choose:

- MFA Enabled
- MFA Deferred

Administrative access remains protected regardless of user participation.

---

## Phase 3

Family Adoption

Status:

Optional

Users:

- Beth
- Amara
- Adam
- FeFe
- William

Approach:

Provide simple instructions and support.

Encourage MFA when:

- User is comfortable with mobile authentication
- User regularly accesses personal documents
- User stores important personal information

Do not require MFA for routine media consumption accounts.

---
# User Onboarding Procedure

## Purpose

Provide a simple, repeatable process for creating new user accounts while maintaining security standards and minimizing support requirements.

The onboarding process should take less than 15 minutes for most users.

---

# User Classification

Before creating an account determine the user type.

## Administrative User

Examples:

- Eric
- Future Administrators

Requirements:

- MFA Required
- Recovery Codes Required
- Vaultwarden Record Required

---

## Standard User

Examples:

- Beth
- Amara
- Adam
- FeFe
- William

Requirements:

- Strong Password
- MFA Offered
- Recovery Method Verified

---

## Media User

Examples:

- Streaming Box Profiles
- Shared Media Accounts

Requirements:

- Strong Password
- No Administrative Permissions

MFA:

Optional

---

# Onboarding Process

## Step 1

Determine Account Access

Select Required Services:

- [ ] Nextcloud
- [ ] Paperless
- [ ] BookStack
- [ ] Plex
- [ ] Audiobookshelf
- [ ] Navidrome
- [ ] Home Assistant
- [ ] Other

---

## Step 2

Create User Account

Configure:

- Username
- Display Name
- Email Address
- Initial Password

Requirements:

- Unique Account
- Strong Password
- Least Privilege Permissions

Shared administrative accounts are prohibited.

---

## Step 3

Assign Permissions

Administrative User:

- Administrative Roles
- MFA Required

Standard User:

- User Level Access Only

Media User:

- Media Access Only

Review:

- No Excess Permissions
- No Administrative Access Granted Unnecessarily

---

## Step 4

Offer MFA Enrollment

Administrative User:

Required

Standard User:

Recommended

Media User:

Optional

Preferred MFA Applications:

- Microsoft Authenticator
- Google Authenticator
- Authy
- Bitwarden Authenticator

---

## Step 5

Configure MFA

If MFA Is Enabled:

1. Install Authenticator Application
2. Scan QR Code
3. Verify Login
4. Generate Recovery Codes
5. Store Recovery Codes

Recovery Code Location:

Vaultwarden (Administrative Accounts)

Personal Secure Storage (Standard Users)

---

## Step 6

Validate User Access

Verify:

- Login Successful
- Permissions Correct
- Service Access Functional

Test Services:

- Nextcloud
- Paperless
- BookStack
- Media Services

As Applicable

---

# Streaming Device Onboarding

Examples:

- Roku
- Apple TV
- Fire TV
- Google TV
- Smart Television

Procedure:

1. Login With Approved Media Account
2. Verify Playback
3. Verify Library Access

Requirements:

- No Administrative Accounts
- No Administrative Credentials
- No MFA Requirement

---

# User Acceptance Validation

Verify User Can:

- [ ] Login
- [ ] Access Assigned Services
- [ ] Access Shared Resources
- [ ] Change Password
- [ ] Recover Account (If Applicable)

Result:

PASS / FAIL

---

# Onboarding Record

User:

____________________

User Type:

- Administrator
- Standard User
- Media User

Services Granted:

_________________________________

_________________________________

_________________________________

MFA Status:

- Required
- Enabled
- Offered
- Declined
- Not Applicable

Account Validation:

PASS / FAIL

Reviewer:

____________________

Date:

____________________

Notes:

_________________________________

_________________________________

_________________________________

---

# Simple MFA Option

Preferred Method:

Microsoft Authenticator

Alternative Methods:

- Google Authenticator
- Authy
- Bitwarden Authenticator

Requirements:

- Install Application
- Scan QR Code
- Save Recovery Code

Target Setup Time:

Less Than 5 Minutes

---

# Streaming Device Considerations

Examples:

- Roku
- Apple TV
- Fire TV
- Google TV
- Smart TVs

Policy:

Do Not Require MFA

Reason:

These devices often have limited authentication capabilities and are primarily used for media consumption.

Security is instead provided through:

- Local Network Controls
- Tailscale
- Strong Account Passwords
- Least Privilege Permissions

---

# Family Adoption Checklist

Suggested During User Onboarding:

- [ ] Account Created
- [ ] Strong Password Assigned
- [ ] Recovery Email Verified
- [ ] MFA Offered
- [ ] MFA Decision Recorded

If MFA Enabled:

- [ ] Authenticator Configured
- [ ] Recovery Codes Saved
- [ ] Login Tested

Result:

PASS / FAIL

---

# Annual Review

Once Per Year Review:

- Administrative Accounts
- Family Account MFA Status
- Recovery Methods
- Lost Devices
- Authentication Issues

Goal:

Increase MFA adoption over time without disrupting usability.

Success is measured by:

- 100% Administrative MFA Coverage
- Increased Voluntary Family MFA Adoption
- No Impact To Media Consumption
- No Increase In Support Burden
---

# Streaming Device Policy

Examples:

- Roku
- Apple TV
- Fire TV
- Google TV
- Smart Televisions
- Plex Clients
- Audiobookshelf Clients
- Navidrome Clients

These devices often do not support modern MFA workflows well.

Policy:

MFA is not required.

Protection is achieved through:

- Local Network Access
- Trusted Device Access
- Tailscale Security
- Account Permissions

Administrative accounts must never be shared with streaming devices.

---

# Child And Family Accounts

Purpose:

Media Consumption

Examples:

- Plex
- Audiobookshelf
- Navidrome
- Nextcloud Access

Policy:

MFA Optional

Strong Passwords Recommended

Administrative Permissions Prohibited

---

# MFA Methods

## Preferred

Authenticator Application

Examples:

- Microsoft Authenticator
- Authy
- Google Authenticator
- Bitwarden Authenticator

Reason:

- Strong Security
- Offline Support
- Easy Recovery

---

## Acceptable

Hardware Security Keys

Examples:

- YubiKey
- FIDO2 Devices

Recommended For:

Administrative Accounts

---

## Discouraged

SMS

Reason:

- SIM Swap Risk
- Carrier Dependency

Use only when no better option exists.

---

# Recovery Code Requirements

For every MFA-enabled administrative account:

Verify:

- Recovery Codes Generated
- Recovery Codes Stored
- Recovery Codes Tested

Storage Location:

Vaultwarden

Reference:

secrets-management-standard.md

---

# Tailscale Requirements

Administrative Access:

Required MFA

Requirements:

- MFA Enabled
- Recovery Information Stored
- Device Approval Enabled

Administrative access without MFA is prohibited.

---

# Vaultwarden Requirements

Administrative Accounts:

MFA Required

Vaultwarden contains:

- Infrastructure Credentials
- Recovery Information
- Backup Credentials
- Service Credentials

Because Vaultwarden protects all other systems, MFA is mandatory.

---

# OneDrive Requirements

Backup Administration Accounts:

MFA Required

Reason:

OneDrive contains offsite disaster recovery data.

Reference:

onedrive-offsite-replication.md

---

# Home Assistant Requirements

Administrative Accounts:

MFA Required

Standard User Accounts:

Recommended

Guest Accounts:

Optional

---

# Paperless Requirements

Administrative Accounts:

MFA Required

Standard Users:

Recommended

---

# Nextcloud Requirements

Administrative Accounts:

MFA Required

Family User Accounts:

Recommended

Required only if supported without creating operational issues.

---

# BookStack Requirements

Administrative Accounts:

MFA Required

Read-Only Users:

Recommended

---

# Account Review Frequency

Quarterly

Review:

- Administrative Accounts
- MFA Status
- Recovery Codes
- Disabled Accounts
- Unused Accounts

---

# MFA Validation Checklist

## Administrative Accounts

Verify:

- [ ] MFA Enabled
- [ ] Recovery Codes Generated
- [ ] Recovery Codes Stored In Vaultwarden
- [ ] Login Validation Successful

Result:

PASS / FAIL

---

## Tailscale

Verify:

- [ ] MFA Enabled
- [ ] Device Approval Enabled
- [ ] Administrative Access Functional

Result:

PASS / FAIL

---

## Vaultwarden

Verify:

- [ ] MFA Enabled
- [ ] Recovery Codes Stored
- [ ] Administrative Access Functional

Result:

PASS / FAIL

---

## Backup Administration

Verify:

- [ ] OneDrive MFA Enabled
- [ ] Recovery Codes Stored
- [ ] Login Functional

Result:

PASS / FAIL

---

# Recovery Procedure

If MFA Access Is Lost:

1. Retrieve Recovery Codes From Vaultwarden

2. Use Recovery Code

3. Re-establish MFA

4. Generate New Recovery Codes

5. Store Updated Recovery Codes

6. Validate Administrative Access

---

# Failure Scenarios

## Lost Authenticator Device

Actions:

- Use Recovery Code
- Restore Authenticator
- Generate New Recovery Codes

---

## Lost Recovery Codes

Actions:

- Generate New Recovery Codes
- Replace Existing Records
- Validate Access

---

## Failed MFA Login

Actions:

- Verify Device Time
- Verify Authenticator Application
- Use Recovery Code
- Reconfigure MFA

---

# Exceptions Policy

Exceptions require:

- Administrative Review
- Documented Reason
- Risk Acceptance

Allowed Exception Types:

- Streaming Devices
- Legacy Media Clients
- Non-Administrative Family Accounts

Exceptions are not permitted for:

- Administrative Accounts
- Backup Administration
- Vaultwarden Administration
- Tailscale Administration

---

# Success Criteria

This standard is considered implemented when:

- Administrative Accounts Protected By MFA
- Recovery Codes Stored In Vaultwarden
- Tailscale MFA Enabled
- Backup Administration MFA Enabled
- Vaultwarden MFA Enabled
- Family User Requirements Documented
- Exception Process Defined
- Validation Completed