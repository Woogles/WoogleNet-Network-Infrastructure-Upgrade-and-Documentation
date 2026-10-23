# max-adguard

## Purpose

Deploy Secondary AdGuard Home for DNS redundancy.

Host:

MAX

Platform:

LXC

IP Address:

10.0.10.51

Role:

Secondary DNS

---

# Architecture Role

Backup resolver for:

- Infrastructure VLAN
- Trusted VLAN
- IoT VLAN
- Guest VLAN

---

# Resource Allocation

CPU: 2 vCPU

Memory: 2 GB

Storage: 20 GB

---

# Deployment

Follow identical installation process used for dax-adguard.

---

# Synchronization

Maintain:

- Matching block lists
- Matching custom records
- Matching upstream resolvers

---

# Monitoring

Monitor:

- Ping
- HTTP
- DNS Resolution

Criticality:

Critical

---

# Validation

Shutdown Primary DNS.

Verify all clients continue resolving names through Secondary DNS.

---

# Recovery Objective

15 Minutes