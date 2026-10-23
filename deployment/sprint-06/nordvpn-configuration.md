# NordVPN Configuration

## Purpose

Configure NordVPN as the approved VPN provider for the WoogleNet media automation platform.

NordVPN provides:

- Secure Internet Egress
- Traffic Anonymization
- Download Traffic Protection
- Public IP Replacement
- VPN Endpoint Redundancy

Reference Documents:

- VPN-ARCHITECTURE.md
- jax-gluetun.md
- secrets-management-standard.md

---

# Approved Provider

Provider:

NordVPN

Usage:

Media Automation Platform

Host:

JAX

VPN Gateway:

jax-gluetun

---

# Architecture

qBittorrent
↓
Gluetun
↓
NordVPN
↓
Internet

Only download traffic is routed through NordVPN.

All other services remain on the standard network path.

---

# Authentication Method

Approved Method:

WireGuard

Reason:

- Faster Performance
- Lower Overhead
- Better Reliability
- Easier Container Integration

OpenVPN should only be used for troubleshooting or provider compatibility issues.

---

# Credential Management

Store:

- NordVPN Account Information
- WireGuard Private Key
- WireGuard Configuration Data
- Recovery Information

Location:

Vaultwarden

Reference:

secrets-management-standard.md

---

# Secrets Handling

Allowed:

.env Files

Vaultwarden Secure Notes

Prohibited:

- Source Control
- Documentation
- Compose Files
- Screenshots
- Shared Storage

---

# Endpoint Selection

Preferred Region:

United States

Selection Criteria:

- Low Latency
- Stable Connectivity
- Good Throughput
- Reliable WireGuard Endpoints

Avoid:

- Regions with known instability
- Experimental endpoints

---

# DNS Policy

DNS Servers:

10.0.10.50
10.0.10.51

Provided By:

- AdGuard Primary
- AdGuard Secondary

Requirements:

- No DNS Leaks
- Internal Name Resolution Functional
- VPN DNS Validation Successful

---

# Kill Switch Policy

Required:

Yes

Policy:

No VPN
=
No Download Traffic

Expected Behavior:

- Tunnel Failure Blocks Internet
- Tunnel Failure Stops Downloads
- Tunnel Recovery Restores Connectivity

Reference:

VPN-ARCHITECTURE.md

---

# IP Validation

Verify:

Before VPN

Public IP Address:
ISP Assigned

After VPN

Public IP Address:
NordVPN Endpoint

Validation Required:

Before Sprint Acceptance

---

# Performance Validation

Verify:

- Download Performance
- Endpoint Stability
- Long Duration Connectivity
- Reconnect Success

Target:

Stable sustained operation.

---

# Monitoring Requirements

Monitor:

- VPN Connectivity
- Public IP Address
- Tunnel Status
- Endpoint Availability
- DNS Resolution

Alert Level:

Critical

Reference:

MONITORING-AND-ALERTING.md

---

# Failure Scenarios

## Authentication Failure

Symptoms:

- VPN Connection Rejected
- Container Startup Failure

Actions:

- Verify Credentials
- Verify WireGuard Configuration
- Verify Account Status

---

## Endpoint Failure

Symptoms:

- Tunnel Offline
- Connectivity Lost

Actions:

- Select Alternate Endpoint
- Restart Gluetun
- Validate New Connection

---

## DNS Leak Detection

Symptoms:

- Unexpected Resolver Responses

Actions:

- Validate AdGuard Configuration
- Validate Gluetun DNS Settings
- Re-test External DNS

---

## Public IP Exposure

Symptoms:

- ISP Address Visible

Severity:

Critical

Actions:

- Stop qBittorrent
- Verify Tunnel
- Verify Routing
- Verify Kill Switch

---

# Backup Requirements

Backup:

- WireGuard Configuration
- Endpoint Selection Notes
- Operational Configuration

Classification:

Important

Frequency:

Weekly

Storage Location:

Encrypted Backup Repository

---

# Recovery Procedure

1. Verify Internet Connectivity
2. Verify DNS Resolution
3. Verify NordVPN Account Status
4. Verify WireGuard Credentials
5. Verify Endpoint Availability
6. Restart Gluetun
7. Validate Public IP
8. Validate qBittorrent Connectivity
9. Resume Automation

---

# Validation Checklist

Verify:

- NordVPN Credentials Stored In Vaultwarden
- WireGuard Configuration Valid
- Tunnel Established
- Public IP Changed
- No DNS Leaks
- Kill Switch Functional
- Download Traffic Functional
- Monitoring Operational

Result:

PASS / FAIL

---

# Success Criteria

Deployment is complete when:

- NordVPN Operational
- WireGuard Operational
- Public IP Verified
- DNS Leak Tests Passed
- Kill Switch Verified
- Monitoring Configured
- Recovery Procedure Validated