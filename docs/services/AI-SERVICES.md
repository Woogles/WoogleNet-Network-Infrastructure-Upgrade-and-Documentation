# AI Services

## Purpose

This document defines the relationship between the WoogleNet infrastructure and the local AI platform.

The goals of the AI platform are:

- Local AI inference
- Private AI experimentation
- Agent development
- Model testing
- Workflow automation
- Knowledge management
- Future RAG development

This document intentionally provides only a high-level overview.

Detailed AI deployment documentation is maintained separately.

---

# Design Decision

## External Project Ownership

The AI platform is managed separately from WoogleNet.

Authoritative Repository:

```text
My_Local_AI_Config
```

---

## Reason

AI infrastructure changes significantly more frequently than the rest of the environment.

Separating AI documentation provides:

- Independent development
- Independent lifecycle management
- Reduced architectural coupling
- Simplified WoogleNet documentation

---

# AI Platform Goals

## Primary Goals

- Local LLM Inference
- AI Agents
- Productivity Enhancement
- Learning and Experimentation

---

## Secondary Goals

- RAG Experimentation
- Workflow Automation
- Research
- Future Home Automation Integration

---

# Infrastructure Relationship

## WoogleNet Responsibilities

WoogleNet provides:

- Compute Platform
- Storage Platform
- Networking
- Remote Access
- Monitoring
- Backup Infrastructure

---

## AI Repository Responsibilities

The AI repository manages:

- Models
- Agents
- Workflows
- AI Applications
- AI Services
- AI Testing

---

# Compute Platform

## Primary Host

| Property | Value |
|----------|----------|
| Host | JAX |
| Operating System | Ubuntu Server |
| Role | AI Application Host |
| Status | Planned |

---

## GPU Resources

### GPU-01

| Property | Value |
|----------|----------|
| Model | NVIDIA RTX 3060 |
| VRAM | 12 GB |
| Purpose | Primary AI Inference |

---

### GPU-02

| Property | Value |
|----------|----------|
| Model | NVIDIA GTX 1070 |
| VRAM | 8 GB |
| Purpose | Secondary AI Workloads |

---

# AI Architecture

## High Level Design

```text
Users
    │
    ▼
Open WebUI
    │
    ▼
Ollama
    │
    ▼
Models
    │
    ▼
GPU Resources
```

---

# Planned Core Components

## Ollama

Purpose:

```text
Model Runtime
```

Responsibilities:

- Model Hosting
- Model Execution
- GPU Utilization

---

## Open WebUI

Purpose:

```text
User Interface
```

Responsibilities:

- Chat Interface
- User Access
- Model Selection

---

# Future Components

The following components are under active evaluation.

## Agent Platforms

Examples:

- Agent Frameworks
- Multi-Agent Systems
- Task Automation

Status:

```text
Research
```

---

## RAG Components

Examples:

- Vector Databases
- Local Knowledge Bases
- Document Retrieval

Status:

```text
Research
```

---

## Workflow Automation

Examples:

- AI Workflows
- Service Integration
- Event Processing

Status:

```text
Research
```

---

# Storage Strategy

## Current Design

Models remain stored locally on JAX.

### Reason

- Performance
- Reduced Network Traffic
- Simplicity

---

## AI Storage Location

```text
JAX Local SSD
```

---

## Shared Storage

Current Status:

```text
Not Required
```

---

# Backup Strategy

## Current Design

Model files are not considered critical data.

Models can be:

```text
Re-downloaded
Rebuilt
Recreated
```

---

## Backup Priority

### Critical

- Configuration Files
- Agent Definitions
- Custom Prompts
- Workflow Definitions

---

### Not Critical

- Public Models
- Cached Models
- Temporary Files

---

# Network Requirements

## DNS

Provided By:

```text
AdGuard Home
```

---

## Remote Access

Provided By:

```text
Tailscale
```

---

## Monitoring

Provided By:

```text
Uptime Kuma
```

---

## Storage

Provided By:

```text
OpenMediaVault
```

when required.

---

# Security Requirements

## Administrative Access

Permitted Through:

- Trusted VLAN
- Tailscale
- Physical Console

---

## Authentication

Strong passwords required.

Administrative credentials stored in:

```text
Vaultwarden
```

---

# Monitoring Requirements

## Host Monitoring

Monitor:

- JAX
- GPU Availability
- Disk Usage
- Memory Utilization

---

## AI Service Monitoring

Monitor:

- Ollama
- Open WebUI

---

## Alert Priority

| Service | Priority |
|----------|----------|
| JAX | Critical |
| Ollama | Important |
| Open WebUI | Important |

---

# Service Dependencies

## Ollama

Depends On:

- JAX
- GPU Resources
- Local Storage

---

## Open WebUI

Depends On:

- Ollama
- DNS
- Networking

---

# Future Expansion

## Planned Growth Areas

- Larger Models
- Additional GPUs
- Agent Platforms
- RAG Architecture
- Workflow Automation

---

## Hardware Expansion

Potential Future Additions:

- Additional GPUs
- Dedicated AI Host
- Expanded SSD Capacity

Status:

```text
Future Review
```

---

# Relationship To WoogleNet

## WoogleNet Scope

Responsible For:

- Hardware
- Networking
- Storage
- Security
- Monitoring
- Backup Platform

---

## AI Repository Scope

Responsible For:

- AI Applications
- AI Services
- AI Models
- AI Agents
- AI Workflows

---

# Open Decisions

| Decision | Status |
|----------|----------|
| Vector Database Platform | Research |
| Agent Framework Selection | Research |
| Model Retention Strategy | Research |
| Future GPU Expansion | Research |
| Dedicated AI Host | Research |

---

# Related Documents

- ARCHITECTURE.md
- HARDWARE-INVENTORY.md
- STORAGE-ARCHITECTURE.md
- REMOTE-ACCESS.md
- SERVICE-DECISIONS.md
- MONITORING-AND-ALERTING.md

---

# External Reference

```text
My_Local_AI_Config
```

Authoritative AI deployment repository.

---

# Revision History

| Version | Date | Author | Notes |
|----------|----------|----------|----------|
| 1.0 | 2026-10-22 | Eric Yacoub | Initial AI Services Documentation |