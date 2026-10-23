# Docker Standard

## Purpose

Define deployment standards for all Docker services.

---

# Naming Standard

Format:

host-service

Examples:

dax-homepage
jax-plex
jax-vaultwarden

---

# Restart Policy

Required:

restart: unless-stopped

---

# DNS Policy

Required:

dns:
  - 10.0.10.50
  - 10.0.10.51

---

# Storage Policy

Persistent data resides under:

/storage/appdata

No application data stored inside containers.

---

# Compose Standards

Every deployment includes:

- compose.yml
- .env.example
- README.md

---

# Image Policy

Use:

- Official Images
- Vendor Recommended Images

Avoid:

- Unverified Community Forks

---

# Upgrade Policy

1. Backup
2. Pull Image
3. Deploy
4. Validate
5. Rollback if Needed

---

# Monitoring Policy

All services must support:

- Uptime Monitoring
- Health Checks
- Log Review

---

# Logging Standard

Use Docker JSON Logging.

Log rotation required.

---

# Backup Standard

Configuration and databases backed up.

Do not back up:

- Images
- Caches
- Temporary Data

---

# Security Standard

Container runs as non-root whenever possible.

Secrets must not exist in compose files.
