# Sprint 03 Validation Checklist

## DNS Validation

### Primary DNS

- [ ] AdGuard installed
- [ ] DNS service running
- [ ] Admin interface accessible
- [ ] Quad9 configured
- [ ] Cloudflare configured
- [ ] Local hostnames resolve

Result:

PASS / FAIL

---

### Secondary DNS

- [ ] AdGuard installed
- [ ] DNS service running
- [ ] Admin interface accessible
- [ ] Upstream resolvers configured
- [ ] Local hostnames resolve

Result:

PASS / FAIL

---

### DNS Failover

Shutdown:

Primary DNS

Verify:

- [ ] Secondary DNS resolves internet names
- [ ] Secondary DNS resolves local names
- [ ] Clients continue functioning

Result:

PASS / FAIL

---

# Homepage Validation

Verify:

- [ ] Dashboard accessible
- [ ] Infrastructure section complete
- [ ] Service links functional
- [ ] DNS links functional
- [ ] Monitoring links functional

Result:

PASS / FAIL

---

# Uptime Kuma Validation

Verify:

- [ ] Web interface accessible
- [ ] Notifications configured
- [ ] DNS monitoring configured
- [ ] Host monitoring configured

Result:

PASS / FAIL

---

# Infrastructure Monitoring

Verify Monitoring:

- [ ] UDM-Pro
- [ ] DAX
- [ ] MAX
- [ ] PAX
- [ ] JAX

Result:

PASS / FAIL

---
# Infrastructure Host Validation

## DAX

Verify:

- [ ] Host reachable via Infrastructure VLAN
- [ ] Host reachable via Tailscale
- [ ] Proxmox Web UI accessible
- [ ] DNS services operational
- [ ] Homepage operational
- [ ] Uptime Kuma operational

Result:

PASS / FAIL

---

## MAX

Verify:

- [ ] Host reachable via Infrastructure VLAN
- [ ] Host reachable via Tailscale
- [ ] Proxmox Web UI accessible
- [ ] Secondary DNS operational

Result:

PASS / FAIL

---

## PAX

Verify:

- [ ] Host reachable via Infrastructure VLAN
- [ ] Host reachable via Tailscale
- [ ] Proxmox Web UI accessible

Result:

PASS / FAIL

---

## JAX

Verify:

- [ ] Host reachable via Infrastructure VLAN
- [ ] Host reachable via Tailscale
- [ ] SSH accessible

Result:

PASS / FAIL
---
# DNS Architecture Validation

Verify:

- [ ] Primary DNS = 10.0.10.50
- [ ] Secondary DNS = 10.0.10.51
- [ ] DHCP distributing correct DNS servers
- [ ] Local hostnames resolve
- [ ] Internet hostnames resolve
- [ ] DNS filtering active

Result:

PASS / FAIL

---

# Remote Access

Verify:

- [ ] Tailscale operational
- [ ] Homepage reachable
- [ ] Uptime Kuma reachable
- [ ] AdGuard dashboards reachable

Result:

PASS / FAIL

---
# Tailscale Validation

## Node Enrollment

Verify:

- [ ] DAX enrolled
- [ ] MAX enrolled
- [ ] PAX enrolled
- [ ] JAX enrolled

Result:

PASS / FAIL

---

## Tailnet Visibility

Verify:

- [ ] All four nodes visible in admin console
- [ ] Hostnames match naming standard
- [ ] MFA enabled on administrator account

Result:

PASS / FAIL

---

## Connectivity Testing

From Administrator Device Verify:

- [ ] DAX reachable
- [ ] MAX reachable
- [ ] PAX reachable
- [ ] JAX reachable

Result:

PASS / FAIL

---

## Service Access Through Tailscale

Verify:

- [ ] AdGuard dashboard reachable
- [ ] Homepage reachable
- [ ] Uptime Kuma reachable
- [ ] Proxmox hosts reachable

Result:

PASS / FAIL
---

# Evidence Collection

Capture:

- [ ] AdGuard Primary Dashboard
- [ ] AdGuard Secondary Dashboard
- [ ] Homepage Dashboard
- [ ] Uptime Kuma Dashboard
- [ ] DNS Tests
- [ ] Monitoring Screenshots
- [ ] Tailscale Admin Console Screenshot
- [ ] DAX Tailnet Connectivity Test
- [ ] MAX Tailnet Connectivity Test
- [ ] DNS Failover Test Results
- [ ] Alert Notification Test

Stored In:

evidence/sprint-03/

---

# Final Validation

- [ ] All tests passed
- [ ] Documentation updated
- [ ] Evidence collected

Sprint Status:

PASS / FAIL

# Sprint Exit Validation

- [ ] AdGuard Primary Operational
- [ ] AdGuard Secondary Operational
- [ ] DNS Failover Validated
- [ ] Homepage Operational
- [ ] Uptime Kuma Operational
- [ ] Tailscale Operational
- [ ] All Hosts Reachable Remotely
- [ ] Monitoring Operational
- [ ] Alerting Operational
- [ ] Documentation Updated
- [ ] Evidence Collected

Sprint Status:

PASS / FAIL

Reviewer:

____________________

Date:

____________________