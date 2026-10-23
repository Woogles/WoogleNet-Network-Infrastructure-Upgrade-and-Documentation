#!/bin/bash
# WoogleNet Connectivity Validator

# Load variables from .env
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "Error: .env file not found. Please create one from .env.example"
    exit 1
fi

echo "--- NETWORK PRE-FLIGHT CHECK ---"

# Test 1: NAS Connectivity
echo -n "Testing NAS Connectivity ($NAS_IP)... "
if ping -c 1 $NAS_IP &> /dev/null; then
    echo "PASS"
else
    echo "FAIL (Check UDM-Pro Firewall/VLANs)"
fi

# Test 2: NAS Path Accessibility
echo -n "Testing NAS Path Access ($NAS_BASE_PATH)... "
if [ -d "$NAS_BASE_PATH" ]; then
    echo "PASS"
else
    echo "FAIL (Check NFS/SMB Mounts)"
fi

# Test 3: Port Availability (80/443)
echo -n "Checking Web Ports (80/443) availability... "
if ! ss -tuln | grep -qE ':80|:443'; then
    echo "PASS (Ports are free)"
else
    echo "FAIL (Ports already in use by another service)"
fi

echo "--- CHECK COMPLETE ---"
