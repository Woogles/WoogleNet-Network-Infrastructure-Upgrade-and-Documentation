# AdGuard Primary Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational standards for the Primary DNS server used by WoogleNet.

AdGuard Primary is a critical Tier-1 infrastructure service.

It provides:

- DNS Resolution
- DNS Filtering
- Local DNS Records
- Ad Blocking
- Network Visibility

All internal clients depend upon this service.

---

# Service Information

## Service Summary

| Property | Value |
|----------|----------|
| Service Name | AdGuard Primary |
| Host | DAX |
| Deployment Type | LXC |
| Hostname | adguard-primary |
| IP Address | 10.0.10.50 |
| VLAN | 10 Infrastructure |
| Criticality | Critical |

---

## Dependencies

Requires:

- DAX Operational
- VLAN 10 Operational
- Gateway Available
- Internet Connectivity

References:

- Sprint 01
- Sprint 02

---

# Resource Specification

## Container Configuration

| Resource | Allocation |
|-----------|-----------|
| vCPU | 2 |
| Memory | 2 GB |
| Swap | 512 MB |
| Storage | 8 GB |
| Network | Static |

---

## Container Type

```text
Unprivileged LXC
```

---

## Operating System

Recommended Template:

```text
Debian 12
```

---

# Network Configuration

## Hostname

```text
adguard-primary
```

---

## IPv4 Address

```text
10.0.10.50/24
```

---

## Gateway

```text
10.0.10.1
```

---

## DNS

Temporary During Installation:

```text
1.1.1.1
1.0.0.1
```

After Deployment:

```text
127.0.0.1
```

---

# LXC Creation

## Container ID

Reserved:

```text
100
```

---

## Container Name

```text
adguard-primary
```

---

## Validation

Verify:

- [ ] Container Created
- [ ] Container Starts
- [ ] Container Receives Static IP

---

# Base Operating System

## Update System

Execute:

```bash
apt update
apt upgrade -y
```

---

## Install Utilities

```bash
apt install curl wget sudo net-tools dnsutils -y
```

---

## Validation

Verify:

```bash
nslookup google.com
```

Expected:

```text
Successful Resolution
```

---

# AdGuard Installation

## Installation Command

```bash
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
```

---

## Validation

Verify Service Running:

```bash
systemctl status AdGuardHome
```

Expected:

```text
Active (running)
```

---

# Initial Configuration

## Administrative Account

Create:

```text
Admin User
```

Record Credentials In:

```text
Vaultwarden
```

when available.

---

## Web Interface

URL:

```text
http://10.0.10.50:3000
```

Initial setup only.

---

## Production URL

```text
http://10.0.10.50
```

---

# DNS Configuration

## DNS Listener

Configure:

```text
Port 53
```

---

## Interface Binding

```text
All Interfaces
```

---

# Upstream DNS

## Primary

```text
https://dns.quad9.net/dns-query
```

---

## Secondary

```text
https://cloudflare-dns.com/dns-query
```

---

## Bootstrap DNS

```text
1.1.1.1

9.9.9.9
```

---

# DNS Filtering

## Initial Blocklists

Enable:

### AdGuard DNS Filter

```text
Enabled
```

---

### OISD Basic

```text
Enabled
```

---

### Tracking Protection

```text
Enabled
```

---

## Validation

Verify:

- [ ] Filters Download
- [ ] Filters Active
- [ ] Queries Processed

---

# Local DNS Records

## Initial Records

Create:

| Host | Address |
|---------|---------|
| dax | 10.0.10.30 |
| max | 10.0.10.31 |
| pax | 10.0.10.32 |
| jax | 10.0.10.33 |
| dns1 | 10.0.10.50 |
| dns2 | 10.0.10.51 |

---

## Future Records

Add During Service Deployment:

```text
homepage

uptime-kuma

omv

plex

immich

vaultwarden
```

---

# DNS Rewrites

## Internal Domain

Subject To Approval

Potential Domain:

```text
wooglenet.internal
```

Examples:

```text
homepage.wooglenet.internal

omv.wooglenet.internal

vaultwarden.wooglenet.internal
```

---

# Security Configuration

## Web Interface Access

Permitted From:

```text
Trusted VLAN

Infrastructure VLAN

Tailscale
```

---

## Password Policy

Minimum:

```text
16 Characters
```

---

## MFA

Not Supported Directly

Protect Through:

```text
Network Segmentation

Vaultwarden

Tailscale
```

---

# Homepage Integration

Add Service:

```text
AdGuard Primary
```

Category:

```text
Core Infrastructure
```

---

# Uptime Kuma Integration

Monitor:

```text
HTTP

DNS

Ping
```

---

## Health Checks

Verify:

- DNS Responding
- Web UI Responding
- Host Reachable

---

# Validation Checklist

## Container

- [ ] Container Running
- [ ] Static IP Configured
- [ ] Reboot Successful

---

## DNS

- [ ] Query Resolution Works
- [ ] Internet Resolution Works
- [ ] Local Resolution Works

---

## Filtering

- [ ] Blocklists Loaded
- [ ] Queries Logged
- [ ] Filtering Functional

---

## Access

- [ ] Web UI Accessible
- [ ] Admin Login Functional

---

# Backup Requirements

Export:

## AdGuard Configuration

- [ ] Settings
- [ ] DNS Records
- [ ] Filters

---

Store In:

```text
deployment/sprint-03/exports/adguard-primary/
```

---

# Evidence Collection

Capture:

- [ ] Dashboard Screenshot
- [ ] DNS Configuration
- [ ] Upstream Configuration
- [ ] Filter Configuration
- [ ] Query Log Example

---

Store In:

```text
deployment/sprint-03/evidence/adguard-primary/
```

---

# Recovery Notes

If Service Fails:

1. Restore LXC Backup
2. Restore AdGuard Configuration Export
3. Validate DNS Resolution
4. Re-execute Validation Checklist

Reference:

```text
rollback-procedure.md
```

---

# Completion Record

## Completed By

```text
_____________________
```

---

## Date

```text
_____________________
```

---

## Result

```text
PASS / FAIL
```

---

# Exit Criteria

AdGuard Primary is complete when:

- [ ] Container Operational
- [ ] DNS Functional
- [ ] Filtering Functional
- [ ] Local Records Created
- [ ] Monitoring Configured
- [ ] Backup Export Completed
- [ ] Evidence Collected

---

# Related Documents

- deployment/sprint-03/README.md
- deployment/sprint-03/adguard-secondary.md
- deployment/sprint-03/validation-checklist.md
- CORE-INFRASTRUCTURE.md
- DNS-ARCHITECTURE.md
- MONITORING-AND-ALERTING.md

---
# Host Hardening

## Operating System Hardening

### Automatic Updates

Install:

```bash
apt install unattended-upgrades -y
```

Configure:

```bash
dpkg-reconfigure unattended-upgrades
```

---

### Validation

Verify:

- [ ] Security Updates Enabled
- [ ] Automatic Updates Enabled

---

## Service Management

Disable Unnecessary Services.

Review:

```bash
systemctl list-unit-files --type=service
```

Disable unused services.

---

## User Accounts

Verify:

- [ ] Root SSH Disabled
- [ ] No Additional Accounts
- [ ] Administrative Account Present

---

## Time Synchronization

Verify:

```bash
timedatectl status
```

Expected:

```text
NTP Active
Clock Synchronized
```

---

# Firewall Configuration

## Firewall Platform

```text
LXC Local Firewall
+
UDM-Pro Segmentation
```

Both layers should be used.

---

# UDM-Pro Firewall Requirements

## Source Networks Allowed

### Infrastructure VLAN

```text
10.0.10.0/24
```

Access:

```text
Allowed
```

---

### Trusted VLAN

```text
10.0.20.0/24
```

Access:

```text
Allowed
```

---

### Tailscale

```text
Tailnet
```

Access:

```text
Allowed
```

---

## Source Networks Denied

### IoT VLAN

```text
10.0.30.0/24
```

Access:

```text
Denied
```

---

### Guest VLAN

```text
10.0.40.0/24
```

Access:

```text
Denied
```

---

# Local Container Firewall

## Management Access

Allow:

### HTTP

```text
TCP 80
```

---

### HTTPS

```text
TCP 443
```

---

### DNS

```text
TCP 53
UDP 53
```

---

### Administration

```text
TCP 3000
```

Initial Configuration Only

Disable external access after deployment.

---

# Outbound Rules

Allow:

### DNS Upstream

```text
TCP 53
UDP 53
TCP 443
```

---

### NTP

```text
UDP 123
```

---

### Operating System Updates

```text
TCP 443
TCP 80
```

---

# Deny Rules

Block:

### All Other Inbound Traffic

Default:

```text
Deny
```

---

### Guest VLAN Access

```text
Denied
```

---

### IoT VLAN Access

```text
Denied
```

---

# Administrative Protection

## Web UI

Restrict Access To:

```text
Infrastructure VLAN

Trusted VLAN

Tailscale
```

---

## Initial Setup Port

Port:

```text
3000
```

After configuration:

- [ ] Verify Setup Complete
- [ ] Restrict Access
- [ ] Monitor Access Attempts

---

# Logging

## Query Logs

Enable:

```text
Yes
```

Retention:

```text
90 Days
```

---

## Security Events

Monitor:

- Login Attempts
- Configuration Changes
- Service Restarts

---

# Hardening Validation

## Verify

- [ ] Root SSH Disabled
- [ ] Automatic Updates Enabled
- [ ] Unused Services Disabled
- [ ] Firewall Configured
- [ ] IoT Access Blocked
- [ ] Guest Access Blocked
- [ ] Query Logging Enabled

---

## Security Testing

From Trusted VLAN:

- [ ] DNS Queries Work
- [ ] Web UI Accessible

---

From IoT VLAN:

- [ ] Web UI Blocked

---

From Guest VLAN:

- [ ] Web UI Blocked

---

From Tailnet:

- [ ] Administrative Access Works
---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial AdGuard Primary Deployment Guide |
