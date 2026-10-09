TL-SG1024DE Technical Analysis

The "Easy Smart" series is a hybrid. It supports 802.1Q VLANs, which means your network segmentation will work. However, it does not support LACP (802.3ad).

Architect's Verdict on Backplane: You cannot do a switch-level "Bond" (LAG) with this hardware. To get more than 1Gbps between switches, you would need an upgrade to the JetStream series. For your current build, stick to a single 1GbE uplink or use "Active-Backup" bonding at the Proxmox OS level for redundancy (not speed).
Configuration Guide: TP-Link TL-SG1024DE (VLAN Setup)

To implement your VLAN plan on this switch, follow these steps:

    Access: Log into the Web UI using the default IP (usually 192.168.0.1) or the TP-Link utility.
    Enable 802.1Q VLAN: Navigate to VLAN →→ 802.1Q VLAN. Select Enable.
    Create VLANs:
        Add the VLAN ID (e.g., 10 for Trusted, 20 for IoT).
        Untagged Ports: These are your end-devices (PC, Printer). The switch strips the tag before it hits the device.
        Tagged Ports: These are your Trunks (links to the UDM-Pro or Proxmox nodes). The tag stays on the packet so the receiving device knows which VLAN it belongs to.
    PVID Setup (Critical): For every port you set as Untagged, you must also go to VLAN →→ 802.1Q PVID Setting and change the PVID to match the VLAN ID. If you don't, the traffic will enter the switch on the wrong VLAN.
