# WoogleNet Deployment Sprint Plan

This is the execution plan for the service roadmap in `Generalinfo.txt.txt`. The user-confirmed target is a UDM-Pro, Proxmox VE on DAX/MAX/PAX, a bare-metal Ubuntu Docker host named JAX repurposed from its R720, and a separate bare-metal Ubuntu GPU host named SAX. Run the sprints in order and treat each acceptance checklist as a gate. Scripts bootstrap hosts and operate Compose stacks; they do not configure UniFi.

## Confirmed Design and Remaining Inputs

- Trusted LAN: `10.0.0.0/16`, gateway `10.0.0.1`. This is a private `/16`, not the full `10.0.0.0/8` private block. Keep management, servers, and personal clients interconnected for now; recognize that this leaves the trusted LAN flat.
- IoT: VLAN 30, `192.168.1.0/24`, gateway `192.168.1.1`.
- Guest: VLAN 40, `192.168.2.0/24`, gateway `192.168.2.1`.
- Hardware: UDM-Pro; Proxmox VE on DAX, MAX, and PAX; JAX is repurposed as the non-GPU Ubuntu Docker host; SAX is a separate bare-metal Ubuntu GPU host with the RTX 3060 and GTX 1070. GPU passthrough is not part of this design.
- Storage: no NAS export is ready. Leave the NFS settings blank until the NAS platform, export, and permissions are defined.
- UDM-Pro is not configured yet. Use the proposed DHCP pool `10.0.10.100-10.0.20.254`; reserve/exclude JAX `10.0.2.10` and SAX `10.0.2.11`. The final NFS export remains to be recorded.

Never factory-reset the gateway as a routine first step; export a backup and preserve a recovery path. Guest VLAN 40 is an internet-only client network, not a server DMZ. Do not place Nginx Proxy Manager there or forward WAN traffic to it. Any future public publishing needs a separate threat-model and firewall review.

## Shared Operating Rules

- Keep Docker Compose projects under `/opt/wooglenet/<stack>` and persistent application data on a backed-up filesystem.
- For each stack, use `bash scripts/compose-stack.sh validate <directory>` before `up`; use `ps` and `logs` for checks. `down` preserves named volumes.
- Store passwords, API keys, and initial admin credentials in root-readable `.env` files or Docker secrets; do not commit them. Keep a redacted `.env.example` instead.
- Pin image versions after validating upgrades. Back up application data and databases before changing image versions.
- Do not expose Docker's TCP API, database ports, AdGuard administration, or management dashboards to the public internet.
- Use Tailscale for private administration. Publish only selected application routes through Nginx Proxy Manager, with TLS and authentication where appropriate.
- Keep recovery access to the hypervisor and gateway while changing network, DNS, or GPU settings.

## Sprint 0: The Network

### Tasks

1. Export the UDM-Pro and switch configurations. Record WAN details, current LAN mask/DHCP range, management access, uplinks, and a rollback path.
2. Configure the trusted LAN as `10.0.0.0/16` with gateway `10.0.0.1`. Reserve JAX `10.0.2.10` and SAX `10.0.2.11` outside the proposed DHCP pool `10.0.10.100-10.0.20.254`.
3. Create VLAN 30 / `192.168.1.0/24` for IoT and VLAN 40 / `192.168.2.0/24` for Guest. Keep WoogleNet on the trusted LAN (native/untagged), and map WoogleNetIOT and WoogleNetGuest to VLANs 30 and 40. Configure trunk/access ports deliberately.
4. Apply stateful, least-privilege rules: allow DHCP to the UDM-Pro, DNS only to the selected resolver (JAX AdGuard at `10.0.2.10:53` if used), and NTP only to approved time servers; allow trusted Home Assistant to initiate only required device-control flows to IoT; block all other IoT initiation to trusted/Guest; block Guest to private/local networks except its DNS resolver. Keep return traffic stateful and validate UniFi rule order with test clients.
5. Test from wired trusted, IoT, and Guest clients before moving services. Confirm addressing, DNS, internet access, isolation, and gateway management access.

### Acceptance

- Trusted clients receive addresses in `10.0.0.0/16`; IoT and Guest clients receive addresses in their respective `/24`s.
- IoT cannot initiate to trusted or Guest hosts; explicitly permitted Home Assistant control works.
- Guest cannot reach trusted, IoT, or other private networks except the selected DNS resolver, and still has internet access.
- Gateway management remains reachable from a trusted client, and the backup/rollback path is available.
- The previous configuration and a documented rollback procedure are available.

JAX and SAX addresses are applied in Sprint 1 using [setup_network.sh](setup_network.sh); it is not a UniFi configuration script.

## Sprint 1: The Foundation

### Ubuntu Host and Docker

1. Repurpose the R720 named JAX as a bare-metal Ubuntu Server Docker host; keep DAX, MAX, and PAX on Proxmox VE. Connect JAX to the trusted LAN and retain local console access.
2. Reserve JAX at `10.0.2.10` and SAX at `10.0.2.11` in the UDM-Pro. Run `ip -br link` on each host to find its actual NIC name before provisioning. JAX uses these overrides:

   ```bash
   sudo env WOOGLENET_HOSTNAME=jax WOOGLENET_INTERFACE=enpXsY WOOGLENET_STATIC_IP=10.0.2.10/16 ./setup_network.sh
   ```

   Replace `enpXsY` with the actual interface shown by `ip -br link`. Initially use a working external resolver; switch to AdGuard only after it is available and tested.
3. Leave `WOOGLENET_NAS_IP` and `WOOGLENET_NFS_EXPORT` unset. When storage is provisioned, configure one data root with `downloads` and `media` below it; do not split those directories across exports/filesystems.
4. Run the network command from JAX's local console. Confirm Netplan within 120 seconds only after testing the new address and gateway. Check with `ip -br address`, `ip route`, and `resolvectl status`.
5. Install Docker from the normal Ubuntu login account. The Docker group grants root-equivalent privileges; only add trusted administrators:

   ```bash
   chmod 750 "Docker Installation Script for Ubunt.sh"
   sudo ./"Docker Installation Script for Ubunt.sh"
   docker --version
   docker compose version
   sudo systemctl status docker --no-pager
   ```

6. Log out and back in before running Docker without `sudo`.

### SAX Ubuntu GPU Host

1. Install Ubuntu Server directly on the separate SAX system with the RTX 3060 and GTX 1070 installed. Reserve `10.0.2.11` in the UDM-Pro and keep local console access.
2. Set `WOOGLENET_INTERFACE` to SAX's real NIC and run the network script from its console:

   ```bash
   sudo env WOOGLENET_HOSTNAME=sax WOOGLENET_INTERFACE=enpXsY WOOGLENET_STATIC_IP=10.0.2.11/16 ./setup_network.sh
   ```

3. Install Docker on SAX using the same Ubuntu installer and a trusted non-root login account. Leave NFS unset until the NAS/export is ready.

### Direct GPU readiness

1. Confirm SAX's PSU capacity, airflow, PCIe slot layout, and BIOS support for both installed GPUs.
2. Install the Ubuntu-recommended NVIDIA driver and verify both cards using `nvidia-smi -L` and `nvidia-smi`.
3. Install NVIDIA Container Toolkit using NVIDIA's current Ubuntu instructions, configure Docker, and run a GPU container smoke test:

   ```bash
   sudo nvidia-ctk runtime configure --runtime=docker
   sudo systemctl restart docker
   sudo docker run --rm --gpus all nvidia/cuda:12.9.0-base-ubuntu22.04 nvidia-smi
   ```

   Record each GPU UUID for the Compose `.env` file before deploying Ollama.

### AdGuard Home, Tailscale, and Nginx Proxy Manager

Deploy the pinned AdGuard Home and Nginx Proxy Manager services on JAX in `stacks/foundation/compose.yaml`. From the repository root on JAX:

```bash
cp stacks/foundation/.env.example stacks/foundation/.env
# Confirm SERVER_LAN_IP matches JAX's reserved UDM-Pro address before continuing.
bash scripts/compose-stack.sh validate stacks/foundation
bash scripts/compose-stack.sh up stacks/foundation
```

The AdGuard setup wizard is at `127.0.0.1:3000`, its post-setup admin port is `127.0.0.1:3001`, and NPM administration is `127.0.0.1:81`. Reach the loopback-only ports from an administrator workstation with:

```bash
ssh -L 3000:127.0.0.1:3000 -L 3001:127.0.0.1:3001 -L 8181:127.0.0.1:81 <user>@10.0.2.10
```

Open `http://127.0.0.1:3000` for initial AdGuard setup, `http://127.0.0.1:3001` for its admin UI afterward, and `http://127.0.0.1:8181` for NPM. Change initial/default credentials immediately. The stack does not configure WAN forwarding. AdGuard bridge-mode port publishing may obscure source-client addresses in its logs; verify this before relying on per-client rules/statistics. If original client IP visibility is required, choose host/macvlan networking and re-check admin-port bindings before DHCP cutover.

Run the following on both JAX and SAX; authorize each host without storing an auth key in the repository:

```bash
sudo bash scripts/install-tailscale.sh
sudo tailscale up
tailscale status
```

Before advertising AdGuard through DHCP, test DNS from SAX and one client on each network, verify local names and external resolution, and retain a working UDM-Pro DNS/recovery path. Use `bash scripts/compose-stack.sh ps stacks/foundation` for status and `bash scripts/compose-stack.sh logs stacks/foundation adguard` for logs.

### Acceptance

- Ubuntu reboots with the intended static IP, default route, and DNS; management access remains available.
- Docker and Compose work for the intended non-root login on JAX and SAX after a new login session.
- Both GPUs are visible to bare-metal Ubuntu and a container GPU smoke test succeeds.
- AdGuard answers local and external queries; Tailscale access works; NPM serves one test route without exposing its admin UI publicly.

## Sprint 2: The AI Core

### Tasks

1. On SAX, confirm both GPUs and install the Ubuntu-recommended NVIDIA driver. Record the UUIDs from `nvidia-smi -L` and confirm VRAM with `nvidia-smi`.
2. Ensure Tailscale is up on SAX. Copy `stacks/ai/.env.example` to `.env`; set `SAX_LAN_IP=10.0.2.11`, the current SAX Tailnet IP from `tailscale ip -4`, and the exact RTX 3060/GTX 1070 UUIDs. Keep `.env` untracked.
3. Deploy and validate the GPU-pinned Compose services:

   ```bash
   bash scripts/compose-stack.sh validate stacks/ai
   bash scripts/compose-stack.sh up stacks/ai
   bash scripts/compose-stack.sh ps stacks/ai
   ```

4. Open `http://10.0.2.11:3002`, create the first administrator, and disable further sign-ups after setup. In **Settings > Admin > Connections**, assign distinct Prefix IDs (for example `RTX3060` and `GTX1070`) to the two Ollama connections so similarly named models are not randomly routed to the other GPU.
5. Pull one small model on each endpoint, run a prompt, and confirm the expected GPU is active with `nvidia-smi`. Measure VRAM and latency before downloading larger models.
6. Ollama APIs bind only to SAX's Tailnet IP on ports `11434` and `11435`. Restrict Tailnet ACLs to JAX/Home Assistant and trusted admin devices; do not add WAN forwarding. From JAX, verify both endpoints with `curl http://<SAX_TAILNET_IP>:11434/api/tags` and `curl http://<SAX_TAILNET_IP>:11435/api/tags`. The Home Assistant Ollama integration should use the authorized Tailnet endpoint.
7. Back up Open WebUI state and document model names, quantization, GPU UUIDs, and recovery steps.

### Acceptance

- Ollama API is reachable from allowed clients only; Open WebUI can list and use the selected model.
- `nvidia-smi` shows the intended GPU(s) under inference and SAX remains stable under load.
- Each Ollama connection sees only its assigned GPU, Open WebUI can use both, and SAX remains stable under load.
- Restarting the stack preserves user data and downloaded models.

## Sprint 3: The Data & Utility Layer

Deploy these general-purpose application stacks on JAX unless a service requires a separate host. Validate each application independently. Use separate persistent paths, strong unique credentials, and database backups.

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
2. Deploy Prowlarr, Sonarr, Radarr, the download client, and Plex/Jellyfin on JAX. Give all file-management services consistent UID/GID and `/data` mappings.
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

The checked-in scripts cover JAX/SAX network bootstrap, Docker/Tailscale installation, and a reusable Compose lifecycle. Sprint 1's foundation stack and Sprint 2's GPU-pinned AI stack are in `stacks/`. Add the remaining data, media, and polish manifests in sprint order, using an `.env.example`, a reliable health check or documented external probe, pinned images, persistent volumes, least-privilege bindings, backup notes, and successful `bash scripts/compose-stack.sh validate <directory>` checks. Keep NAS mounts disabled until the NAS/export is selected.