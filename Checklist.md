# WoogleNet Infrastructure Upgrade: check list

This document serves as the comprehensive roadmap for the WoogleNet network infrastructure upgrade. The goal is to transition the home lab from a basic setup to a professional-grade architecture with full documentation, segmented VLANs, and optimized routing.

---

## Sprint 1: Discovery & Architectural Design
*Status: Completed*

- [x] Define project goals and scope.
- [x] Audit existing hardware and current network state.
- [x] Draft initial network topology.
- [x] Establish basic IP addressing scheme.

## Sprint 2: Core Implementation & Baseline Connectivity
*Status: In Progress*

- [ ] **Core Switch Configuration**
    - Configure management IP and SSH access.
    - Implement basic security hardening on the core device.
    - Verify physical uplink stability.
- [ ] **VLAN Foundation**
    - Define and create all required VLANs on the core switch.
    - Configure Trunk ports for downstream switches.
- [ ] **Core Routing**
    - Establish Inter-VLAN routing (SVI configuration).
    - Configure default gateway and static routes to the WAN edge.
- [ ] **Baseline Documentation**
    - Document Core switch port assignments.
    - Map initial VLAN-to-Subnet relationships.

## Sprint 3: Distribution & Access Layer Deployment
*Status: Pending*

- [ ] **Switch Integration**
    - Deploy configurations to distribution and access switches.
    - Configure tagged/untagged ports based on the VLAN map.
    - Verify LLDP/CDP adjacency across all switches.
- [ ] **End-Device Migration**
    - Move physical hosts to designated VLANs.
    - Test connectivity between different VLANs via the core.
- [ ] **Physical Layer Audit**
    - Physical labeling of all cables and ports.
    - Validation of cable runs against the logical map.
- [ ] **Access Layer Documentation**
    - Create port-level spreadsheets for all access switches.
    - Generate a visual neighbor map using LLDP/CDP data.

## Sprint 4: Storage & Service Integration
*Status: Pending*

- [ ] **Storage Network Optimization**
    - Implement dedicated storage VLANs as per `storage_map.md`.
    - Configure MTU settings (Jumbo Frames) for storage traffic where applicable.
    - Verify path redundancy for storage targets.
- [ ] **Environment Variable Finalization**
    - Update `.env` files with final production IP addresses and API keys.
    - Validate that monitoring tools can reach all hosts via the new routing logic.
- [ ] **Service Validation**
    - Verify DNS, DHCP, and NTP availability across all segments.
    - Test storage mount stability across the upgraded fabric.
- [ ] **Storage Documentation**
    - Finalize the `storage_map.md` with verified paths and IPs.

## Sprint 5: Network Hardening & Security
*Status: Pending*

- [ ] **Access Control Lists (ACLs)**
    - Implement firewall rules to restrict inter-VLAN traffic.
    - Isolate IoT and Guest networks from the Management/Storage core.
- [ ] **Management Plane Security**
    - Restrict SSH/Web UI access to a specific Management VLAN.
    - Implement centralized logging (Syslog) for all network devices.
- [ ] **Redundancy Testing**
    - Simulate link failures to verify Spanning Tree (STP) or LACP convergence.
    - Validate failover behavior for critical services.

## Sprint 6: Final Validation & Full Documentation
*Status: Pending*

- [ ] **Comprehensive Audit**
    - Run a full network scan to ensure no rogue devices or IP conflicts.
    - Verify all devices are appearing correctly in the `.env` tracked environment.
- [ ] **Final Documentation Package**
    - **Physical Map:** Updated rack diagrams and cable labels.
    - **Logical Map:** Finalized VLAN, Subnet, and Routing table.
    - **Port Map:** Complete spreadsheet of every port, its VLAN, and connected device.
    - **Neighbor Map:** Verified LLDP/CDP map of the entire fabric.
- [ ] **Project Sign-off**
    - Final review of "Still todo" list to ensure 100% completion.
    - Archive current configuration backups for all devices.
