# WoogleNet Storage Map
NOT COMPLETE THIS IS AN EXAMPLE AND NEEDS TO BE UPDATED

This document defines where application data lives on the NAS to ensure consistency across the cluster.

| Service | NAS Sub-folder | Container Path | Backup Priority |
| :--- | :--- | :--- | :--- |
| **AdGuard Home** | `/adguard/config` | `/opt/adguardhome/conf` | High |
| **Nginx Proxy Mgr**| `/npm/data` | `/data` | High |
| **Vaultwarden** | `/vault/data` | `/data` | Critical |
| **Immich** | `/immich/library` | `/usr/src/app/upload` | High |
| **Nextcloud** | `/nextcloud/data` | `/var/www/html/data` | High |
| **Homepage** | `/homepage/config` | `/app/config` | Low |