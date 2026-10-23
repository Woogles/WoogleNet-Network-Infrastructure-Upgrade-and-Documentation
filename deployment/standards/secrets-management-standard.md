# Secrets Management Standard

## Purpose

Define credential management requirements.

---

# Source Of Truth

Vaultwarden

All infrastructure credentials belong in Vaultwarden.

---

# Covered Secrets

- Passwords
- API Keys
- MFA Recovery Codes
- SSH Keys
- Tokens
- Service Accounts
- Encryption Keys

---

# Password Requirements

Minimum Length:

16 Characters

Requirements:

- Unique
- Random
- Never Reused

---

# MFA Requirements

Required:

- Vaultwarden
- Tailscale
- Home Assistant

Recommended:

- Nextcloud
- Immich

---

# Storage Rules

Allowed:

Vaultwarden

Prohibited:

- Documentation Files
- Compose Files
- Git Repositories
- Screenshots

---

# Environment Files

Allowed:

.env

Requirements:

- Local Storage Only
- Backup Required

Never commit to source control.

---

# Backup Protection

Secrets backups must be:

- Encrypted
- Backed Up
- Tested Quarterly

---

# Access Control

Administrative credentials available only to approved administrators.

---

# Recovery Requirements

Store:

- Recovery Codes
- MFA Recovery Keys
- Encryption Keys

inside Vaultwarden secure notes.

---

# Review Schedule

Monthly:

- Credential Review

Quarterly:

- MFA Review
- Recovery Key Review

Annual:

- Full Credential Audit