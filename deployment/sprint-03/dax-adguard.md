# dax-adguard

## Purpose

Deploy the Primary AdGuard Home instance on DAX.

This service provides:

- Primary DNS Resolution
- DNS Filtering
- Ad Blocking
- Malware Domain Protection

Reference Documents:

- DNS-ARCHITECTURE.md
- FIREWALL-RULES.md
- IP-ADDRESS-PLAN.md
- SERVICE-DEPENDENCIES.md

---

# Deployment Information

Host: DAX

Platform: LXC

Hostname:

dax-adguard

IP Address:

10.0.10.50

VLAN:

10 Infrastructure

Role:

Primary DNS

---

# Resource Allocation

CPU: 2 vCPU

Memory: 2 GB

Storage: 20 GB

---

# DNS Configuration

Primary Resolver:

Quad9

Secondary Resolver:

Cloudflare

---

# Installation

## Create Container

Template:

Debian 12 Standard

Features:

- Nesting Disabled
- Unprivileged Container

---

## Update Operating System

apt update
apt upgrade -y

---

## Install AdGuard Home

curl -s -S -L \
https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh \
| sh

---

# Service Configuration

Bind Address:

0.0.0.0

Admin Interface:

10.0.10.50:3000

DNS Listener:

10.0.10.50:53

---

# Security Configuration

Allow Access From:

- Infrastructure VLAN
- Trusted VLAN
- Tailscale

Disallow:

- Guest VLAN Administration

---

# Monitoring

Monitor:

- Ping
- HTTP
- DNS Resolution

Alert Level:

Critical

---

# Backup Requirements

Back Up:

- Configuration
- Custom DNS Entries
- Block Lists

Frequency:

Weekly

---

# Validation

Verify:

- DNS Queries Resolve
- Internet DNS Functions
- Internal DNS Functions
- Dashboard Accessible

---

# Dependencies

Requires:

- Network
- UDM-Pro