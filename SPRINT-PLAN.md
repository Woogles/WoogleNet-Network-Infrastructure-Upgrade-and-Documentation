# WoogleNet Deployment Sprint Plan

This is the execution plan for the service roadmap in `Generalinfo.txt.txt`. Run the sprints in order and treat each acceptance checklist as a gate. The checked-in shell scripts currently bootstrap the Ubuntu VM and Docker; they do not configure the UniFi gateway or deploy the application stacks.

## Decisions Required Before Changes

The current documents describe incompatible configurations. Resolve these before applying network settings or passthrough instructions:

- Gateway: README and inventory say UCG-Fiber; `Network upgrade.docx` says UDM-Pro.
- Hypervisor: README says TrueNAS; the Word plan says Proxmox. GPU passthrough steps depend on the selected platform and version.
- Server subnet: README and updated notes use `10.0.2.0/24`; the Word plan and original network script use `192.168.20.0/24`.
- VLANs: updated notes use VLANs 10/20/30 for management, servers, and personal devices, but do not assign VLAN IDs to IoT and Guest. The Word plan instead uses VLAN 1/10/20/30/40.
- Home Assistant: IoT is described as isolated, but Home Assistant needs explicit access to IoT devices and to Ollama. Use narrow firewall allowances rather than bridging all IoT traffic into trusted networks.

The steps below use the README's UCG-Fiber, TrueNAS, and `10.0.2.0/24` as working assumptions. Confirm the final addresses, VLAN IDs, DHCP reservations, firewall policy, hypervisor, GPU ownership, and DNS name before deployment. Never factory-reset network equipment as a routine first step; export a backup and preserve a recovery path.

## Shared Operating Rules

- Keep Docker Compose projects under `/opt/wooglenet/<stack>` and persistent application data on a backed-up filesystem.
- Store passwords, API keys, and initial admin credentials in root-readable `.env` files or Docker secrets; do not commit them. Keep a redacted `.env.example` instead.
- Pin image versions after validating upgrades. Back up application data and databases before changing image versions.
- Do not expose Docker's TCP API, database ports, AdGuard administration, or management dashboards to the public internet.
- Use Tailscale for private administration. Publish only selected application routes through Nginx Proxy Manager, with TLS and authentication where appropriate.
- Keep recovery access to the hypervisor and gateway while changing network, DNS, or GPU settings.

## Sprint 0: The Network

### Tasks

1. Export the gateway and switch configuration. Record current WAN details, management access, uplinks, and a rollback path.
2. Confirm final networks and VLAN IDs. Reserve static addresses outside DHCP pools for gateway infrastructure, NAS, Ubuntu VM, and services. Do not reuse the example IPs in the script without checking for conflicts.
3. Create the management, server, personal, IoT, and guest networks. Tag switch uplinks as trunks and assign endpoint ports explicitly. Map each SSID to its intended network.
4. Apply least-privilege firewall rules: permit established connections; allow trusted clients to required server ports; restrict IoT to required DNS/NTP and explicitly selected controllers; block IoT and Guest from management/server networks; allow their internet access.
5. Test from a wired client and each SSID before moving servers. Confirm DHCP, gateway, DNS, internet access, and isolation; retain gateway access from the management network.

### Acceptance

- A client on each network receives an address in the correct subnet and resolves DNS.
- Guest and IoT cannot initiate connections to management or server hosts; explicitly permitted controller flows work.
- Trusted clients reach only the required management and service ports.
- The previous configuration and a documented rollback procedure are available.

The Ubuntu VM's static address and NAS mount are applied in Sprint 1 using [setup_network.sh](setup_network.sh); it is not a UniFi configuration script.

## Sprint 1: The Foundation

### Ubuntu VM and Docker

1. Create an Ubuntu Server VM on the selected hypervisor. Attach it to the server VLAN, reserve its address, and use the VM console for the first network change.
2. Review `INTERFACE`, `STATIC_IP`, `GATEWAY`, and `DNS_SERVERS` in `setup_network.sh`. Its defaults are examples for the README's server subnet. Initially use a working external resolver; change to AdGuard only after AdGuard is available and tested.
3. If the VM has a stable TrueNAS NFS export, configure both `NAS_IP` and `NFS_EXPORT`; otherwise leave both blank. For the media stack, export one data root with `downloads` and `media` beneath it, not separate filesystems.
4. Run the network script from the VM console. Confirm the Netplan prompt within 120 seconds only after testing the new address and gateway:

   ```bash
   chmod 750 setup_network.sh
   sudo ./setup_network.sh
   ip -br address
   ip route
   resolvectl status
   ```

5. Install Docker from the normal Ubuntu login account. The Docker group grants root-equivalent privileges; only add trusted administrators:

   ```bash
   chmod 750 "Docker Installation Script for Ubunt.sh"
   sudo ./"Docker Installation Script for Ubunt.sh"
   docker --version
   docker compose version
   sudo systemctl status docker --no-pager
   ```

6. Log out and back in before running Docker without `sudo`. Verify the NAS mount with `findmnt /mnt/nas/data` when NFS is configured.

### GPU passthrough readiness

1. Confirm the server model, BIOS settings, hypervisor version, GPU power/cooling, and IOMMU support against that platform's documentation.
2. Enable IOMMU/VT-d or AMD-Vi in firmware as applicable. Identify GPU and audio-function PCI IDs and their IOMMU group; reserve the intended GPU for the Ubuntu VM only if the hypervisor supports safe isolation.
3. Pass through the GPU and its associated audio function as required by the platform. Keep console/recovery graphics available; never pass through the only host display adapter without a tested recovery route.
4. In Ubuntu, verify `lspci -nnk` and `nvidia-smi` before installing the NVIDIA Container Toolkit. Then validate Docker GPU access with NVIDIA's current documented test image for the installed driver/toolkit versions.

### AdGuard Home, Tailscale, and Nginx Proxy Manager

Deploy each service with a reviewed Compose file and persistent volumes. Do not change DHCP-provided DNS to AdGuard until clients can resolve both local names and external domains through it. Keep Tailscale state persistent and its auth key out of source control. Bind NPM's admin UI to a trusted interface or VPN; expose only its intended HTTP/HTTPS ports.

### Acceptance

- Ubuntu reboots with the intended static IP, default route, and DNS; management access remains available.
- Docker and Compose work for the intended non-root login after a new login session.
- GPU passthrough is visible and stable in the guest, if this VM will host GPUs.
- AdGuard answers local and external queries; Tailscale access works; NPM serves one test route without exposing its admin UI publicly.

## Sprint 2: The AI Core

### Tasks

1. Confirm GPU passthrough and install a driver version supported by both GPUs and the chosen Ubuntu release. Record GPU UUIDs with `nvidia-smi -L` and available VRAM with `nvidia-smi`.
2. Deploy Ollama with persistent model storage and Open WebUI with a persistent database/data volume. Keep the Ollama API on the server network; allow access only from Open WebUI, Home Assistant when needed, and trusted clients.
3. Pull one small model first, run a prompt, and confirm GPU utilization. Measure VRAM and response latency before downloading larger models.
4. Treat GPU allocation as an explicit policy, not an automatic guarantee: test whether one Ollama process should use both GPUs or whether separate Ollama instances pinned to individual GPU UUIDs are needed. Keep speech/image workloads off the primary model GPU only after validating both workloads together.
5. Configure model access and user accounts in Open WebUI. Back up its state and document model names, quantization, and hardware requirements.

### Acceptance

- Ollama API is reachable from allowed clients only; Open WebUI can list and use the selected model.
- `nvidia-smi` shows the intended GPU(s) under inference and the VM remains stable under load.
- Restarting the stack preserves user data and downloaded models.

## Sprint 3: The Data & Utility Layer

Deploy and validate each application independently. Use separate persistent paths, strong unique credentials, and database backups.

- **BookStack:** deploy the application and its supported database; configure URL, mail, and backups. Create the network, storage, and recovery runbooks before indexing them for RAG.
- **Vaultwarden:** restrict access to trusted/VPN paths, use HTTPS, create the initial account securely, and verify encrypted backups/restores. Do not expose the admin endpoint without a separate access control.
- **Nextcloud:** deploy with a supported database and Redis; configure trusted domains, TLS/proxy headers, background jobs, file storage, and backup/restore.
- **Paperless-ngx:** deploy with PostgreSQL, Redis, consume/export directories, and document-processing storage; test ingestion, search, and restoration.

### Acceptance

- Each service is reachable only through intended internal or VPN routes and has a tested admin login.
- A test record/file can be created, retrieved, and restored from backup.
- Database and uploaded-data backup schedules are documented and monitored.

## Sprint 4: The Media Empire

### Storage and hardlink requirement

Create one NAS dataset/export for the complete media working tree, for example `/mnt/nas/data/{torrents,media}`. Mount that same root into the download client, Sonarr, Radarr, and related services at the same in-container path, such as `/data`. Do not bind `/downloads` and `/media` from distinct filesystems: hardlinks require one filesystem and compatible permissions.

Verify the actual mount supports hardlinks before importing media:

```bash
mkdir -p /mnt/nas/data/{torrents,media}
touch /mnt/nas/data/torrents/.hardlink-check
ln /mnt/nas/data/torrents/.hardlink-check /mnt/nas/data/media/.hardlink-check
stat -c '%d %i %n' /mnt/nas/data/{torrents,media}/.hardlink-check
rm /mnt/nas/data/{torrents,media}/.hardlink-check
```

Both files must report the same device and inode. If `ln` fails, resolve the NAS export/filesystem behavior before deploying automation.

### Tasks

1. Pick and document a download client; the selected tool list names the ARR apps but not the client.
2. Deploy Prowlarr, Sonarr, Radarr, the download client, and Plex/Jellyfin. Give all file-management services consistent UID/GID and `/data` mappings.
3. Configure library roots under `/data/media`, completed/incomplete downloads under `/data/torrents`, categories, and hardlink imports. Avoid duplicate mounts for the same share.
4. Add media libraries to Plex and Jellyfin. Configure hardware transcoding only after GPU/driver access is validated; do not pass the same GPU to incompatible host and guest workloads.
5. Restrict outbound and web access to trusted users; observe applicable content licensing and service terms.

### Acceptance

- An authorized test file imports without a cross-filesystem copy; source and library paths share an inode where hardlinks are used.
- Sonarr/Radarr see the same paths as the download client; permissions survive container restart.
- Plex and Jellyfin play a test file; backups include configuration and metadata as intended.

## Sprint 5: The Polish

- **Home Assistant AI:** connect to the internal Ollama endpoint. Expose only selected entities/actions to the conversation agent; require confirmation for locks, alarms, destructive actions, and anything that changes network/security configuration. Allow only the specific firewall paths required between Home Assistant, IoT devices, and Ollama.
- **Homepage:** configure links and service health widgets without embedding credentials in a public or client-readable config. Restrict access to trusted/VPN clients.
- **Uptime Kuma:** monitor DNS, HTTP, TCP, and certificate expiry from an appropriate network location. Use notifications with a tested recipient and monitor the monitors/backup status too.
- Document upgrade, backup, restore, credential rotation, and outage procedures. Test one restore and one alert before calling the environment operational.

### Acceptance

- Home Assistant can answer a read-only query and control only explicitly exposed test entities.
- Dashboard access follows the same trust boundary as the services it links to.
- A planned test outage creates an alert and recovery clears it; restore testing succeeds.

## Automation Backlog

The two checked-in scripts cover only the Ubuntu VM's network/NFS bootstrap and Docker installation. Add per-sprint Compose manifests only after the open topology, IP, domain, GPU, storage, and secret-management decisions are recorded. Each stack should include an `.env.example`, health checks, pinned image versions, persistent volumes, least-privilege port bindings, backup notes, and a tested `docker compose config` result before deployment.