# Sprint 03 - Core Infrastructure Services

## Sprint Information

Property | Value
----------|----------
Sprint ID | Sprint 03
Name | Core Infrastructure Services
Status | Planned
Priority | Critical
Owner | Eric Yacoub

---

# Purpose

Deploy the foundational infrastructure services required by the WoogleNet environment.

This sprint establishes:

- Primary DNS
- Secondary DNS
- Infrastructure Dashboard
- Infrastructure Monitoring
- Tailscale Remote Access
- Service Visibility
- DNS Redundancy

These services become core dependencies for all future sprint deployments.

---

# Services Deployed

## DNS Services

### Primary DNS

Service:

dax-adguard

Host:

DAX

Platform:

LXC

IP Address:

10.0.10.50

Purpose:

Primary DNS Resolution and Filtering

Reference:

dax-adguard.md

---

### Secondary DNS

Service:

max-adguard

Host:

MAX

Platform:

LXC

IP Address:

10.0.10.51

Purpose:

Redundant DNS Resolution

Reference:

max-adguard.md

---

## Monitoring Services

### Homepage

Service:

dax-homepage

Host:

DAX

Platform:

LXC

IP Address:

10.0.10.60

Purpose:

Infrastructure Dashboard

Reference:

dax-homepage.md

---

### Uptime Kuma

Service:

dax-uptime

Host:

DAX

Platform:

LXC

IP Address:

10.0.10.61

Purpose:

Monitoring and Alerting

Reference:

dax-uptime.md

---

## Remote Access

### Tailscale

Deployment Targets:

- DAX
- MAX
- PAX
- JAX

Purpose:

- Remote Administration
- Secure Management Access
- Infrastructure Connectivity
- Recovery Access

Reference:

tailscale-deployment.md

---

# Dependencies

Required:

- Sprint 01 Complete
- Sprint 02 Complete

Required Infrastructure:

- UDM-Pro
- VLAN Configuration
- Firewall Rules
- Internet Connectivity

Reference Documents:

- IP-ADDRESS-PLAN.md
- VLAN-PLAN.md
- DNS-ARCHITECTURE.md
- FIREWALL-RULES.md
- REMOTE-ACCESS.md
- SERVICE-DEPENDENCIES.md

---

# Architecture Overview

Internet
↓
UDM-Pro
↓
Infrastructure VLAN
↓
AdGuard Primary
↓
AdGuard Secondary
↓
Homepage
↓
Uptime Kuma

Remote Administration

Administrator
↓
Tailscale
↓
Infrastructure Services

---

# Deliverables

## Service Guides

- dax-adguard.md
- max-adguard.md
- dax-homepage.md
- dax-uptime.md
- tailscale-deployment.md

## Operational Documents

- validation-checklist.md
- rollback-procedure.md

---

# Success Criteria

Sprint 03 is complete when:

- AdGuard Primary operational
- AdGuard Secondary operational
- DNS redundancy tested
- Homepage operational
- Uptime Kuma operational
- Monitoring configured
- Tailscale deployed to all hosts
- Remote administration validated
- Documentation updated
- Evidence collected

---

# Validation Requirements

Validate:

## DNS

- Primary DNS operational
- Secondary DNS operational
- DNS failover operational

## Monitoring

- Homepage operational
- Uptime Kuma operational
- Notifications operational

## Remote Access

- DAX reachable through Tailscale
- MAX reachable through Tailscale
- PAX reachable through Tailscale
- JAX reachable through Tailscale

---

# Evidence Collection

Store Evidence In:

evidence/sprint-03/

Required Evidence:

- AdGuard Primary Screenshots
- AdGuard Secondary Screenshots
- Homepage Screenshots
- Uptime Kuma Screenshots
- DNS Failover Tests
- Tailscale Node Screenshots
- Monitoring Validation Results

---

# Exit Criteria

Sprint 03 cannot be closed until:

- DNS redundancy verified
- Monitoring operational
- Tailscale operational
- Administrative access validated
- Validation checklist completed
- Rollback procedure reviewed
- Documentation approved
- Evidence collected

---

# Sprint Outcome

## Start Date

TBD

## Completion Date

TBD

## Final Status

Planned

## Notes

Sprint 03 establishes the operational foundation for all remaining services. Sprints 04 through 10 depend on the successful deployment of DNS, monitoring, and remote access capabilities delivered in this sprint.