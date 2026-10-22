# Firewall Rules

## Purpose

This document serves as the authoritative firewall implementation worksheet for the WoogleNet environment.

This is an implementation-focused document intended for actual UDM-Pro configuration.

The goals of this document are:

- Protect infrastructure services
- Enforce VLAN segmentation
- Restrict lateral movement
- Enable secure administration
- Minimize default trust relationships
- Simplify troubleshooting

This document should be used during Sprint 01 deployment.

---

# Security Model

## Trust Hierarchy

```text
Infrastructure
        ▲
        │
Trusted │
        │
        ▼
      IoT

        ▼

      Guest
```

---

## Security Principles

1. Infrastructure is protected.
2. Guest devices are isolated.
3. IoT devices are isolated.
4. Trusted users may access infrastructure.
5. Administrative traffic should be limited.
6. Deny by default whenever practical.

---

# Network Objects

## VLAN 10

### Infrastructure

```text
10.0.10.0/24
```

---

## VLAN 20

### Trusted

```text
10.0.20.0/24
```

---

## VLAN 30

### IoT

```text
10.0.30.0/24
```

---

## VLAN 40

### Guest

```text
10.0.40.0/24
```

---

# Rule Processing Order

Rules should be implemented in the following order.

```text
1. Administrative Access

2. Infrastructure Protection

3. IoT Restrictions

4. Guest Restrictions

5. Internet Access

6. Default Deny
```

---

# Administrative Rules

## Rule 001

### Trusted → Infrastructure

| Property | Value |
|-----------|----------|
| Action | Allow |
| Source | Trusted |
| Destination | Infrastructure |
| Purpose | Administration |

---

### Validation

Verify:

- Proxmox Access
- OpenMediaVault Access
- DNS Access
- Dashboard Access

---

# Infrastructure Protection

## Rule 010

### IoT → Infrastructure

| Property | Value |
|-----------|----------|
| Action | Deny |
| Source | IoT |
| Destination | Infrastructure |
| Purpose | Prevent Lateral Movement |

---

### Validation

Attempt Access To:

- DAX
- MAX
- PAX
- JAX
- AdGuard
- OpenMediaVault

Expected Result:

```text
Blocked
```

---

## Rule 011

### Guest → Infrastructure

| Property | Value |
|-----------|----------|
| Action | Deny |
| Source | Guest |
| Destination | Infrastructure |
| Purpose | Protect Infrastructure |

---

### Validation

Expected Result:

```text
Blocked
```

---

# Trusted Network Rules

## Rule 020

### Trusted → Internet

| Property | Value |
|-----------|----------|
| Action | Allow |
| Source | Trusted |
| Destination | Internet |
| Purpose | Standard Access |

---

## Rule 021

### Trusted → IoT

| Property | Value |
|-----------|----------|
| Action | Allow |
| Source | Trusted |
| Destination | IoT |
| Purpose | Device Management |

---

### Examples

- Smart TVs
- Streaming Devices
- Home Automation Devices

---

# IoT Rules

## Rule 030

### IoT → Trusted

| Property | Value |
|-----------|----------|
| Action | Deny |
| Source | IoT |
| Destination | Trusted |
| Purpose | Isolation |

---

### Validation

Attempt Access To:

- Workstations
- Laptops
- Phones

Expected Result:

```text
Blocked
```

---

## Rule 031

### IoT → Guest

| Property | Value |
|-----------|----------|
| Action | Deny |
| Source | IoT |
| Destination | Guest |
| Purpose | Isolation |

---

## Rule 032

### IoT → Internet

| Property | Value |
|-----------|----------|
| Action | Allow |
| Source | IoT |
| Destination | Internet |
| Purpose | Device Functionality |

---

### Validation

Expected Result:

```text
Allowed
```

---

# Home Assistant Exception

## Rule 040

### Home Assistant → IoT

| Property | Value |
|-----------|----------|
| Action | Allow |
| Source | Home Assistant |
| Destination | IoT |
| Purpose | Automation |

---

### Notes

Implement after Home Assistant deployment.

Reference:

```text
Sprint 06
```

---

### Validation

Verify:

- Device Discovery
- State Updates
- Automation Triggers

---

# Guest Rules

## Rule 050

### Guest → Trusted

| Property | Value |
|-----------|----------|
| Action | Deny |
| Source | Guest |
| Destination | Trusted |
| Purpose | Isolation |

---

## Rule 051

### Guest → IoT

| Property | Value |
|-----------|----------|
| Action | Deny |
| Source | Guest |
| Destination | IoT |
| Purpose | Isolation |

---

## Rule 052

### Guest → Infrastructure

| Property | Value |
|-----------|----------|
| Action | Deny |
| Source | Guest |
| Destination | Infrastructure |
| Purpose | Protection |

---

## Rule 053

### Guest → Internet

| Property | Value |
|-----------|----------|
| Action | Allow |
| Source | Guest |
| Destination | Internet |
| Purpose | Guest Access |

---

### Validation

Expected Result:

```text
Internet Works

Internal Access Blocked
```

---

# DNS Rules

## Rule 060

### Trusted → DNS

| Property | Value |
|-----------|----------|
| Action | Allow |
| Destination | AdGuard |

---

## Rule 061

### IoT → DNS

| Property | Value |
|-----------|----------|
| Action | Allow |
| Destination | AdGuard |

---

## Rule 062

### Guest → DNS

| Property | Value |
|-----------|----------|
| Action | Allow |
| Destination | AdGuard |

---

### DNS Targets

```text
10.0.10.50
10.0.10.51
```

---

# Future Rules

Not implemented initially.

---

## Camera VLAN

Future:

```text
VLAN 50
```

---

## AI VLAN

Future:

```text
VLAN 70
```

---

## Lab VLAN

Future:

```text
VLAN 60
```

---

# Validation Matrix

| Test | Expected Result |
|--------|--------|
| Trusted → Infrastructure | Allow |
| Trusted → IoT | Allow |
| Trusted → Internet | Allow |
| IoT → Internet | Allow |
| IoT → Trusted | Deny |
| IoT → Infrastructure | Deny |
| Guest → Internet | Allow |
| Guest → Trusted | Deny |
| Guest → Infrastructure | Deny |
| Guest → IoT | Deny |

---

# Rollback Criteria

Rollback if:

- Infrastructure access lost
- DNS unavailable
- DHCP unavailable
- Multiple VLANs unable to route
- Internet connectivity broken

Reference:

```text
rollback-procedure.md
```

---

# Deployment Checklist

- [ ] Infrastructure Rules Created
- [ ] Trusted Rules Created
- [ ] IoT Rules Created
- [ ] Guest Rules Created
- [ ] DNS Rules Created
- [ ] Validation Complete
- [ ] Evidence Collected

---

# Evidence Requirements

Capture Screenshots Of:

- Rule Order
- Trusted Rules
- IoT Rules
- Guest Rules
- Validation Results

Store In:

```text
deployment/sprint-01/evidence/firewall/
```

---

# Related Documents

- VLAN-PLAN.md
- FIREWALL-RULES.md
- deployment/sprint-01/vlan-design.md
- deployment/sprint-01/test-matrix.md
- deployment/sprint-01/rollback-procedure.md

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial Firewall Implementation Worksheet |