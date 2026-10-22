# Sprint 09 - Security Hardening

## Sprint Information

| Property | Value |
|----------|----------|
| Sprint ID | Sprint 09 |
| Name | Security Hardening |
| Status | Planned |
| Priority | Critical |
| Estimated Duration | 1 Week |
| Owner | Eric Yacoub |

---

# Sprint Goal

Validate and implement the WoogleNet security baseline across infrastructure, services, accounts, and remote access systems.

This sprint establishes:

- MFA Enforcement
- Credential Management
- SSH Hardening
- Administrative Access Controls
- Fail2Ban Configuration
- Security Validation
- Access Reviews

At completion, the environment will align with the approved Security Baseline and be ready for operational use.

---

# Success Criteria

Sprint 09 is complete when:

- MFA is enabled on required services
- Vaultwarden is the credential source of truth
- SSH is hardened
- Root SSH is disabled
- Administrative access is validated
- Public exposure is minimized
- Security documentation is current
- Security review completed

---

# Prerequisites

## Required Sprint Completion

- [ ] Sprint 00 Complete
- [ ] Sprint 01 Complete
- [ ] Sprint 02 Complete
- [ ] Sprint 03 Complete
- [ ] Sprint 04 Complete
- [ ] Sprint 05 Complete
- [ ] Sprint 06 Complete
- [ ] Sprint 07 Complete
- [ ] Sprint 08 Complete

---

## Required Documentation

- SECURITY-BASELINE.md
- REMOTE-ACCESS.md
- SERVICE-DEPENDENCIES.md
- OPERATIONS-RUNBOOK.md
- DISASTER-RECOVERY.md

---

# Phase 1 - Vaultwarden Security

## Validation

- [ ] Vaultwarden Operational
- [ ] Administrative Access Verified

---

## Credential Management

Verify Credentials Stored For:

- [ ] UDM-Pro
- [ ] Switches
- [ ] Access Points
- [ ] DAX
- [ ] MAX
- [ ] PAX
- [ ] JAX
- [ ] OpenMediaVault
- [ ] Home Assistant
- [ ] AdGuard
- [ ] Tailscale

---

## Password Standards

Verify:

- [ ] No Shared Passwords
- [ ] No Reused Passwords
- [ ] 16 Character Minimum Passwords
- [ ] Randomly Generated Administrative Passwords

---

# Phase 2 - MFA Enforcement

## Required MFA

### Vaultwarden

- [ ] MFA Enabled
- [ ] Recovery Method Documented

---

### Tailscale

- [ ] MFA Enabled
- [ ] Identity Provider Validated

---

### Home Assistant

- [ ] MFA Enabled
- [ ] Recovery Method Documented

---

## Optional MFA

### Immich

- [ ] MFA Evaluated
- [ ] MFA Enabled (Optional)

---

### Nextcloud

- [ ] MFA Evaluated
- [ ] MFA Enabled (Optional)

---

# Phase 3 - Administrative Access Review

## Infrastructure Access

Verify Access Limited To:

- [ ] Trusted VLAN
- [ ] Tailscale
- [ ] Physical Console

---

## Proxmox Access

Verify:

- [ ] No Public Exposure
- [ ] Tailscale Access Works
- [ ] Trusted VLAN Access Works

---

## OpenMediaVault Access

Verify:

- [ ] No Public Exposure
- [ ] Tailscale Access Works
- [ ] Trusted VLAN Access Works

---

# Phase 4 - SSH Hardening

## DAX

Verify:

- [ ] Root SSH Disabled
- [ ] Strong Authentication

---

## MAX

Verify:

- [ ] Root SSH Disabled
- [ ] Strong Authentication

---

## PAX

Verify:

- [ ] Root SSH Disabled
- [ ] Strong Authentication

---

## JAX

Verify:

- [ ] Root SSH Disabled
- [ ] Strong Authentication

---

## SSH Policy

Verify:

- [ ] SSH Enabled Only Where Required
- [ ] Administrative Use Only

---

# Phase 5 - Fail2Ban

## Deployment Review

Enable Where Supported:

- [ ] Vaultwarden
- [ ] Nextcloud
- [ ] SSH Services
- [ ] Other Supported Services

---

## Testing

- [ ] Failed Login Detection
- [ ] Automatic Blocking
- [ ] Alert Validation

---

# Phase 6 - Service Exposure Audit

## Internet Exposed Services

Verify Only:

- [ ] Plex

---

## Internal Only Services

Verify:

- [ ] Vaultwarden
- [ ] Home Assistant
- [ ] Immich
- [ ] Nextcloud
- [ ] Paperless
- [ ] BookStack
- [ ] OpenMediaVault
- [ ] Proxmox
- [ ] AdGuard

---

## Tailscale Validation

Verify Remote Access Through:

- [ ] Tailnet Connectivity
- [ ] Administrative Access
- [ ] Service Access

---

# Phase 7 - Account Review

## Infrastructure Services

Review:

- [ ] Administrative Accounts
- [ ] Disabled Accounts
- [ ] Default Accounts

---

## Family Services

Review:

- [ ] Plex Users
- [ ] Audiobookshelf Users
- [ ] Immich Users
- [ ] Vaultwarden Users

---

## Account Cleanup

- [ ] Remove Unused Accounts
- [ ] Remove Temporary Accounts

---

# Phase 8 - Network Security Validation

## VLAN Isolation

Verify:

### Trusted VLAN

- [ ] Access Functions As Designed

---

### IoT VLAN

- [ ] Cannot Access Trusted
- [ ] Cannot Access Infrastructure
- [ ] Internet Access Works

---

### Guest VLAN

- [ ] Internet Access Works
- [ ] Internal Access Blocked

---

## Firewall Review

Verify:

- [ ] Guest Isolation
- [ ] IoT Isolation
- [ ] Administrative Restrictions

---

# Phase 9 - Disaster Recovery Security Review

## Credential Access

Verify:

- [ ] Recovery Credentials Available
- [ ] Vaultwarden Recovery Documented

---

## Backup Security

Verify:

- [ ] Backup Encryption Enabled
- [ ] Recovery Keys Stored Securely

---

## OneDrive

Verify:

- [ ] Backup Access Protected
- [ ] MFA Enabled

---

# Phase 10 - Security Testing

## Authentication

Verify:

- [ ] MFA Functions Correctly
- [ ] Password Manager Functional

---

## Access Validation

Verify:

- [ ] Local Access
- [ ] Tailscale Access
- [ ] Denied Access Paths

---

## Exposure Scan

Verify:

- [ ] No Unexpected Public Services
- [ ] No Administrative Services Exposed

---

# Monitoring Integration

## Verify Monitoring

Uptime Kuma Should Monitor:

- [ ] Certificate Expiration
- [ ] DNS Resolution
- [ ] Service Availability

---

## Verify Alerts

- [ ] Email Alerts
- [ ] Mobile Alerts
- [ ] Security Related Alerts

---

# Documentation Updates

Review:

- [ ] SECURITY-BASELINE.md
- [ ] REMOTE-ACCESS.md
- [ ] OPERATIONS-RUNBOOK.md
- [ ] SERVICE-DECISIONS.md

---

# Evidence Collection

Store In:

```text
evidence/sprint-09/
```

---

## Required Evidence

- [ ] MFA Screenshots
- [ ] Vaultwarden Configuration
- [ ] Tailscale Validation
- [ ] Firewall Validation
- [ ] Fail2Ban Validation
- [ ] Security Review Results

---

# Lessons Learned

## What Worked

```text
(To be completed during execution)
```

---

## What Failed

```text
(To be completed during execution)
```

---

## Documentation Corrections

```text
(To be completed during execution)
```

---

# Exit Criteria

Sprint 09 cannot be closed until:

- [ ] MFA Enabled On Required Services
- [ ] Vaultwarden Is Source Of Truth
- [ ] Root SSH Disabled Everywhere
- [ ] Fail2Ban Operational
- [ ] Public Exposure Reviewed
- [ ] Account Review Complete
- [ ] Security Review Complete
- [ ] Documentation Updated
- [ ] Evidence Collected

---

# Sprint Outcome

## Start Date

```text
TBD
```

## Completion Date

```text
TBD
```

## Final Status

```text
Planned
```

## Notes

```text
Sprint 09 validates that WoogleNet aligns with the
approved Security Baseline.

Completion ensures the environment is properly protected
before entering Operations Readiness.
```