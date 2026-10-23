# SSH Hardening Standard

## Purpose

Establish standardized SSH security controls for the WoogleNet environment to reduce attack surface, protect administrative access, and support secure remote administration.

This standard applies to:

- Proxmox Hosts
- Linux Virtual Machines
- Linux Containers
- Storage Platforms
- Future Infrastructure Services

Reference Documents:

- SECURITY-BASELINE.md
- REMOTE-ACCESS.md
- FIREWALL-RULES.md
- TAILSCALE-STANDARD.md
- mfa-enforcement.md
- credential-management-review.md

---

# Security Philosophy

SSH provides powerful administrative access.

Compromise of SSH access can lead to:

- Service Compromise
- Credential Exposure
- Data Loss
- Infrastructure Takeover

For this reason SSH access should be:

- Restricted
- Audited
- Authenticated
- Monitored

Administrative convenience must never override security.

---
# WoogleNet SSH Access Standard

Administrative SSH access is permitted only through:

- Tailscale
- Trusted Management VLANs
- Physical Console Access

Public Internet SSH access is prohibited.

Policy:

Internet SSH Exposure = 0

This policy applies to:

- DAX
- MAX
- PAX
- JAX
- OpenMediaVault
- Future Infrastructure Hosts

All firewall, routing, and access control decisions must support this requirement.

Reference:

REMOTE-ACCESS.md

FIREWALL-RULES.md

SECURITY-BASELINE.md
---

# SSH Usage Policy

SSH is permitted only for:

- Administration
- Maintenance
- Troubleshooting
- Recovery Operations

SSH is not intended for:

- Daily User Access
- File Sharing
- Application Access

---

# Administrative Access Requirements

Administrative Access Methods:

✅ Tailscale

✅ Trusted VLAN

✅ Physical Console

Preferred Method:

Tailscale

Reference:

REMOTE-ACCESS.md

---

# Network Restrictions

Allowed Sources:

- Trusted VLAN
- Tailscale Network

Prohibited Sources:

- Public Internet
- Unknown Networks
- Guest Networks

Requirement:

Direct Internet SSH exposure is prohibited.

No firewall rule shall permit inbound SSH access from the Internet.

---

# Tailscale Access Standard

Preferred Administrative Path:

Administrator
↓
Tailscale
↓
SSH
↓
Infrastructure Host

Examples:

- DAX
- MAX
- PAX
- JAX
- OpenMediaVault

Benefits:

- Identity-Aware Access
- Device-Based Trust
- Encrypted Connectivity
- No Public SSH Exposure

Reference:

TAILSCALE-STANDARD.md

---

# Firewall Requirements

SSH Access Allowed From:

- Infrastructure VLAN
- Management VLAN
- Tailscale Network

SSH Access Denied From:

- Public Internet
- Guest VLAN
- IoT VLAN
- Media VLAN

Example Policy:

```text
ALLOW  Trusted VLAN    → TCP 22
ALLOW  Tailscale       → TCP 22

DENY   Internet        → TCP 22
DENY   Guest VLAN      → TCP 22
DENY   IoT VLAN        → TCP 22
```

Reference:

FIREWALL-RULES.md

---

# Port Configuration

Default SSH Port:

22/TCP

Policy:

Changing the SSH port is optional.

Reason:

Security should rely on access controls rather than obscurity.

If alternate ports are used they must be documented.

---

# SSH Authentication Standard

## Preferred

Public Key Authentication

Required For:

- Administrators
- Infrastructure Systems

---

## Acceptable

Password Authentication

Only When:

- Initial Deployment
- Recovery Procedures
- Temporary Troubleshooting

---

## Prohibited

Shared Credentials

Examples:

❌ Shared Root Password

❌ Shared SSH Key

❌ Generic Administrative Account

Each administrator must have a unique account.

---

# Root Login Policy

Remote Root Login:

Disabled

Administrative Workflow:

Personal Account
↓
Authentication
↓
Privilege Elevation

Permitted Exceptions:

- Emergency Recovery
- Console Recovery

Exceptions must be documented.

---

# Password Policy

If Password Authentication Is Enabled:

Requirements:

Minimum Length:

14 Characters

Recommended:

20+ Characters

Requirements:

- Uppercase
- Lowercase
- Numbers
- Symbols

Storage:

Vaultwarden

Reference:

secrets-management-standard.md

---

# SSH Key Management

## Key Ownership

SSH Keys Must:

- Be Unique
- Be Identifiable
- Be Assigned To Individual Users

Shared Keys Are Prohibited.

---

## Approved Storage

Private Keys:

User Device

Backup Copy:

Vaultwarden Secure Storage

---

## Key Rotation

Requirements:

- Review Annually
- Remove Unused Keys
- Remove Former Administrators

Frequency:

Annual

---

# Administrative Accounts

Administrative Accounts Must:

- Be Individually Assigned
- Be Documented
- Be Audited Quarterly

Requirements:

- MFA Enabled Where Applicable
- Strong Password
- SSH Key Authentication Preferred

Reference:

mfa-enforcement.md

---

# Recommended sshd_config Baseline

The following settings represent the WoogleNet recommended SSH baseline.

```text
Port 22

PermitRootLogin no

PubkeyAuthentication yes

PasswordAuthentication no

ChallengeResponseAuthentication no

UsePAM yes

PermitEmptyPasswords no

MaxAuthTries 3

LoginGraceTime 30

X11Forwarding no

AllowTcpForwarding no

PermitTunnel no

ClientAliveInterval 300

ClientAliveCountMax 2

AllowUsers eric
```

Notes:

- Disable PasswordAuthentication after SSH key validation.
- Maintain console access before changing authentication settings.
- Test access from Tailscale before deployment.

---

# Logging Requirements

Log:

- Successful SSH Logins
- Failed SSH Logins
- Key Authentication Events
- Privilege Escalation Events

Requirements:

- Logs Retained
- Security Events Reviewed
- Failed Login Activity Investigated

---

# Allowed SSH Targets

Infrastructure Hosts:

- DAX
- MAX
- PAX
- JAX

Storage Platforms:

- OpenMediaVault

Future Infrastructure:

- As Approved

Maintain Inventory In:

BookStack

---

# Account Review

Frequency:

Quarterly

Review:

- Active Administrators
- SSH Keys
- Administrative Accounts
- Disabled Accounts
- Unused Accounts

Verify:

- Least Privilege
- Key Ownership
- Access Justification

---

# SSH Hardening Checklist

## Authentication

Verify:

- [ ] Public Key Authentication Enabled
- [ ] Shared Accounts Eliminated
- [ ] Shared Keys Eliminated
- [ ] Strong Passwords Configured

Result:

PASS / FAIL

---

## Root Access

Verify:

- [ ] Remote Root Login Disabled
- [ ] Privilege Elevation Functional

Result:

PASS / FAIL

---

## Access Controls

Verify:

- [ ] Public Internet Access Blocked
- [ ] Trusted VLAN Access Functional
- [ ] Tailscale Access Functional

Result:

PASS / FAIL

---

## Account Review

Verify:

- [ ] Administrative Accounts Current
- [ ] Unused Accounts Removed
- [ ] Unused Keys Removed

Result:

PASS / FAIL

---

# SSH Audit Checklist

Frequency:

Quarterly

Auditor:

____________________

Date:

____________________

---

## Network Validation

Verify:

- [ ] Port 22 Not Exposed To Internet
- [ ] Public Port Scan Clean
- [ ] Tailscale Access Functional
- [ ] Trusted VLAN Access Functional

Result:

PASS / FAIL

---

## Authentication Validation

Verify:

- [ ] SSH Key Authentication Working
- [ ] Password Authentication Disabled
- [ ] Root Login Disabled
- [ ] MFA Requirements Met

Result:

PASS / FAIL

---

## Account Validation

Verify:

- [ ] All Accounts Identified
- [ ] No Unknown Accounts
- [ ] No Shared Accounts
- [ ] No Former Administrators Retained

Result:

PASS / FAIL

---

## SSH Key Validation

Verify:

- [ ] Keys Documented
- [ ] Keys Assigned To Owners
- [ ] No Unknown Keys
- [ ] Unused Keys Removed

Result:

PASS / FAIL

---

## Logging Validation

Verify:

- [ ] Authentication Logs Present
- [ ] Failed Login Attempts Reviewed
- [ ] No Suspicious Activity Identified

Result:

PASS / FAIL

---

## Firewall Validation

Verify:

- [ ] Internet SSH Blocked
- [ ] Guest VLAN SSH Blocked
- [ ] IoT VLAN SSH Blocked
- [ ] Administrative Networks Allowed

Result:

PASS / FAIL

---

## Final Audit Review

- [ ] No Critical Findings
- [ ] Documentation Updated
- [ ] Findings Remediated
- [ ] Next Audit Scheduled

Audit Status:

PASS / FAIL

Reviewer:

____________________

Date:

____________________

---

# User Onboarding

For New Administrators:

1. Create Individual Account

2. Generate SSH Key Pair

3. Install Public Key

4. Validate Login

5. Store Recovery Information

6. Record Account Assignment

7. Complete Security Validation

---

# User Offboarding

When Administrative Access Is Removed:

1. Disable Account

2. Remove SSH Keys

3. Remove Sudo Privileges

4. Remove Authorized Access

5. Validate Account Removal

6. Update Documentation

---

# Incident Response

Immediate Actions For:

- Unauthorized Login
- Unknown SSH Key
- Unknown Administrative Account
- Brute Force Activity

Response Steps:

1. Restrict Access

2. Review Logs

3. Remove Unauthorized Access

4. Rotate Credentials

5. Validate System Integrity

6. Document Incident

---

# Exceptions Policy

Exceptions Require:

- Administrative Review
- Documented Justification
- Risk Acceptance

Allowed Exception Examples:

- Recovery Activities
- Temporary Migration Activities

Permanent exceptions should be avoided.

---

# Validation Procedure

Verify:

- SSH Accessible Through Tailscale
- SSH Accessible From Trusted VLAN
- Root Login Disabled
- SSH Keys Functional
- Logging Functional
- Administrative Accounts Reviewed
- Public Internet Exposure Eliminated

Result:

PASS / FAIL

---

# Evidence Collection

Capture:

- SSH Configuration Review
- Administrative Account Review
- Key Inventory Review
- Firewall Validation
- Access Verification Results
- Security Validation Results

Store In:

BookStack

And

Security Audit Documentation

---

# Success Criteria

This standard is considered implemented when:

- SSH Access Restricted
- Administrative Accounts Reviewed
- Root Login Disabled
- Public Key Authentication Functional
- Direct Internet SSH Exposure Eliminated
- Tailscale Administrative Access Operational
- Logging Operational
- Quarterly Reviews Established
- Audit Process Established
- Documentation Updated