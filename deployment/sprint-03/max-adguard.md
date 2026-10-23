# MAX AdGuard Deployment

## Purpose

This document defines the deployment, configuration, validation, and operational requirements for the secondary DNS platform within WoogleNet.

Service Name:

```text
max-adguard
```

Role:

```text
Secondary DNS
DNS Redundancy
DNS Failover
```

This service provides:

- DNS high availability
- DNS failover
- Redundant DNS filtering
- Local DNS resolution backup

The service must be capable of independently supporting the entire environment during a failure of:

```text
dax-adguard
```

---

# Service Information

## Service Summary

| Property | Value |
|-----------|-----------|
| Service Name | max-adguard |
| Service Type | AdGuard Home |
| Role | Secondary DNS |
| Host | MAX |
| Container Type | LXC |
| Container ID | 101 |
| Hostname | max-adguard |
| IP Address | 10.0.10.51 |
| VLAN | 10 Infrastructure |
| Tier | Tier 1 Critical |

---

# Standards Compliance

This deployment must comply with:

- naming-standard.md
- lxc-standard.md
- service-hardening-standard.md
- network-security-standard.md
- monitoring-standard.md
- backup-standard.md
- logging-standard.md

---

# Dependencies

Required Before Deployment:

- [ ] Sprint 01 Complete
- [ ] Sprint 02 Complete
- [ ] MAX Operational
- [ ] Networking Operational
- [ ] DNS Functional
- [ ] Internet Connectivity Functional

---

# Resource Specification

## Container Resources

| Resource | Allocation |
|-----------|-----------|
| vCPU | 2 |
| RAM | 2 GB |
| Swap | 512 MB |
| Storage | 8 GB |

---

## Container Type

```text
Unprivileged LXC
```

---

## Operating System

```text
Debian 12
```

---

# Network Configuration

## Hostname

```text
max-adguard
```

---

## IPv4 Address

```text
10.0.10.51/24
```

---

## Gateway

```text
10.0.10.1
```

---

## DNS During Installation

```text
1.1.1.1
1.0.0.1
```

---

## DNS After Installation

```text
127.0.0.1
```

---

# LXC Creation

## Container ID

```text
101
```

---

## Container Name

```text
max-adguard
```

---

## Validation

Verify:

- [ ] Container Created
- [ ] Container Starts Successfully
- [ ] IP Address Assigned
- [ ] Host Reachable

---

# Base Operating System

## Initial Updates

```bash
apt update
apt upgrade -y
```

---

## Utility Packages

```bash
apt install curl wget sudo net-tools dnsutils unattended-upgrades -y
```

---

## Validation

```bash
nslookup google.com
```

Expected:

```text
Successful Resolution
```

---

# AdGuard Home Installation

## Installation Command

```bash
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh
```

---

## Validation

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
Administrative User
```

Store credentials in:

```text
Vaultwarden
```

upon deployment.

---

## Initial Setup Interface

```text
http://10.0.10.51:3000
```

---

## Management Interface

```text
http://10.0.10.51
```

---

# DNS Configuration

## Role

```text
Secondary Resolver
```

---

## Listener Port

```text
53 TCP
53 UDP
```

---

## Interface Binding

```text
All Interfaces
```

---

## Upstream DNS

Primary:

```text
https://dns.quad9.net/dns-query
```

---

Secondary:

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

# DNS Records

This server must maintain the same local DNS records as:

```text
dax-adguard
```

---

## Initial Records

| Record | Address |
|----------|----------|
| dax | 10.0.10.30 |
| max | 10.0.10.31 |
| pax | 10.0.10.32 |
| jax | 10.0.10.33 |
| dax-adguard | 10.0.10.50 |
| max-adguard | 10.0.10.51 |
| dax-homepage | 10.0.10.60 |
| dax-uptime | 10.0.10.61 |

---

# DNS Filtering

## Required Filters

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

- [ ] Lists Download Successfully
- [ ] Rules Applied
- [ ] DNS Queries Logged

---

# Redundancy Requirements

## DNS Distribution

All DHCP scopes will distribute:

Primary:

```text
10.0.10.50
```

Secondary:

```text
10.0.10.51
```

---

## Secondary Server Requirement

max-adguard must operate independently if:

```text
dax-adguard
```

becomes unavailable.

---

# Failover Validation

## Test 1

Stop:

```text
dax-adguard
```

Expected:

```text
DNS Resolution Continues
```

---

## Test 2

Disconnect:

```text
dax-adguard
```

Expected:

```text
DNS Resolution Continues
```

---

## Test 3

Restart:

```text
dax-adguard
```

Expected:

```text
Automatic Recovery
```

---

# Monitoring Requirements

Reference:

```text
monitoring-standard.md
```

---

## Uptime Kuma Configuration

Create Monitors:

### Ping

```text
max-adguard
```

---

### HTTP

```text
max-adguard
```

---

### DNS Query

```text
max-adguard
```

---

## Alert Priority

```text
Priority 1 Critical
```

---

# Backup Requirements

Reference:

```text
backup-standard.md
```

---

## Export Configuration

Backup:

- Settings
- DNS Records
- Filter Lists
- Client Settings

---

## Storage Location

```text
deployment/sprint-03/exports/max-adguard/
```

---

# Logging Requirements

Reference:

```text
logging-standard.md
```

---

## Required Logging

Capture:

- Successful Logins
- Failed Logins
- Configuration Changes
- DNS Errors
- Service Restarts

---

# Evidence Collection

Store In:

```text
deployment/sprint-03/evidence/max-adguard/
```

---

## Capture

- [ ] Dashboard Screenshot
- [ ] DNS Configuration
- [ ] Filters
- [ ] Local Records
- [ ] Query Log
- [ ] Monitoring Configuration
- [ ] Failover Test Results

---

# Validation Checklist

## Container

- [ ] Running
- [ ] Static IP Assigned
- [ ] Updates Installed

---

## DNS

- [ ] Resolution Functional
- [ ] Local Records Functional
- [ ] Filtering Functional

---

## Monitoring

- [ ] Monitored By dax-uptime
- [ ] Alerts Tested

---

## Redundancy

- [ ] Primary DNS Failure Tested
- [ ] Secondary Function Verified

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

max-adguard is complete when:

- [ ] LXC Operational
- [ ] DNS Functional
- [ ] Filtering Enabled
- [ ] Local Records Configured
- [ ] Monitoring Configured
- [ ] Backup Export Completed
- [ ] Failover Testing Completed
- [ ] Evidence Collected

---

# Related Documents

- deployment/sprint-03/README.md
- deployment/sprint-03/dax-adguard.md
- deployment/sprint-03/validation-checklist.md
- deployment/standards/lxc-standard.md
- deployment/standards/network-security-standard.md
- deployment/standards/monitoring-standard.md
- DNS-ARCHITECTURE.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial MAX AdGuard Deployment Guide |