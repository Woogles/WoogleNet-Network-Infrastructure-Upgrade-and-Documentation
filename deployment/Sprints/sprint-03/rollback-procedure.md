# Sprint 03 Rollback Procedure

## Purpose

Restore network services if Sprint 03 deployment introduces instability or service outages.

---

# Rollback Conditions

Execute rollback if:

- DNS resolution fails
- DNS redundancy fails
- Monitoring impacts production systems
- Homepage unavailable
- Infrastructure services disrupted

---

# Rollback Priority

1. Restore DNS
2. Restore Network Services
3. Restore Monitoring
4. Restore Dashboard

---

# Rollback Procedure

## Step 1

Identify failed service.

Examples:

- AdGuard Primary
- AdGuard Secondary
- Homepage
- Uptime Kuma

---

## Step 2

Remove failed deployment.

Actions:

- Shutdown service
- Stop container
- Preserve logs

---

## Step 3

Restore DNS

If Primary DNS failed:

- Promote Secondary DNS
- Update DNS assignments if needed

If both failed:

- Restore previous DNS configuration
- Use temporary public DNS if required

---

## Step 4

Restore Container Backups

Restore:

- dax-adguard
- max-adguard
- dax-homepage
- dax-uptime

From:

- Proxmox backups
- Configuration backups

---

## Step 5

Validate Service Recovery

Verify:

- DNS Resolution
- Internet Access
- Internal Hostname Resolution
- Dashboard Availability

---

# Failure Scenarios

## AdGuard Primary Failure

Impact:

Low

Action:

Continue operations using Secondary DNS.

---

## AdGuard Secondary Failure

Impact:

Low

Action:

Continue operations using Primary DNS.

---

## Dual DNS Failure

Impact:

Critical

Action:

Restore backup configuration immediately.

---

## Homepage Failure

Impact:

Low

Action:

Restore service when practical.

---

## Uptime Kuma Failure

Impact:

Low

Action:

Restore service when practical.

---

# Validation After Rollback

Confirm:

- [ ] DNS operational
- [ ] Internet operational
- [ ] Internal services reachable
- [ ] Monitoring operational
- [ ] Tailscale operational

---

# Rollback Complete

Date:

____________________

Administrator:

____________________

Notes:

____________________