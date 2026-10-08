#!/bin/bash
# WoogleNet System Audit Tool

echo "--- SYSTEM AUDIT: $(hostname) ---"
echo "Date: $(date)"
echo ""

echo "[1] OS & Kernel"
lsb_release -a 2>/dev/null || cat /etc/os-release
uname -r
echo ""

echo "[2] Network Configuration"
ip -br addr
echo ""

echo "[3] Storage & Mounts"
df -h | grep -E 'Filesystem|/mnt|/vol'
echo ""

echo "[4] Docker Environment"
docker version --format '{{.Server.Version}}' 2>/dev/null || echo "Docker not installed"
docker compose version 2>/dev/null || echo "Docker Compose not installed"
echo ""

echo "[5] Active Containers"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""

echo "--- END AUDIT ---"
