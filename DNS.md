# AdGuard Home + Quad9 Setup

This guide routes DNS requests through AdGuard Home on your local network, then forwards them to Quad9 using encrypted DNS-over-HTTPS (DoH):

**Devices → AdGuard Home on your LAN → Quad9 over DoH**

Replace `10.0.0.X` below with the reserved LAN address of your AdGuard Home machine.

## 1. Give the AdGuard Home machine a stable address

Use a machine that stays powered on and connected to your home network. In your router’s DHCP or LAN settings, create a DHCP reservation for it.

Choose an available address in your `10.0.0.X` network that won’t conflict with another device or the router’s DHCP pool. Record the address for use in the router settings and tests.

A DHCP reservation is usually simpler than configuring a static address on the machine itself.

## 2. Install AdGuard Home

Download the latest stable release for your operating system from the [official AdGuard Home releases page](https://github.com/AdguardTeam/AdGuardHome/releases), then follow the installation instructions for your platform.

For Linux, extract the archive and install AdGuard Home as a service:

```bash
sudo ./AdGuardHome -s install
```

The initial setup uses TCP port `3000`; the web interface uses TCP port `80`, and DNS uses port `53`. Allow both UDP and TCP traffic on port `53` through the machine’s local firewall. If another service is already using port `53`, resolve that conflict before continuing.

From a device on your LAN, open:

```text
http://10.0.0.X:3000
```

In the setup wizard:

- Select the network interface connected to your LAN.
- Set the DNS listening port to `53`.
- Set a strong administrator username and password.
- Keep the admin interface reachable only from your LAN. Do not create a router port-forward for it.
- Note the admin web-interface port so you know how to access it after setup.

## 3. Set Quad9 as the upstream resolver

In AdGuard Home, open **Settings → DNS settings** and configure:

**Upstream DNS servers**

```text
https://dns.quad9.net/dns-query
```

**Bootstrap DNS servers**

```text
9.9.9.9
149.112.112.112
```

Quad9’s recommended DoH endpoint encrypts normal DNS queries sent to Quad9. Bootstrap DNS is used to resolve Quad9’s hostname when AdGuard Home needs it; those occasional lookups use regular DNS. Using both Quad9 bootstrap addresses provides redundancy without sending everyday queries to another provider.

Leave **Fallback DNS servers** empty. Avoid adding public resolvers such as Google or Cloudflare as extra upstreams, since that could send some queries outside Quad9. Quad9’s recommended service provides threat blocking and DNSSEC validation.

**Optional alternatives:**

- **DNS-over-TLS (DoT):** You can use `tls://dns.quad9.net` instead of the DoH address. DoT is also encrypted, but uses port `853`, which some networks block. Try it if DoH has connection problems; keep whichever works reliably.
- **Quad9 Secure + ECS:** The endpoint `https://dns11.quad9.net/dns-query` is intended for cases where CDN routing or location-sensitive performance is poor. It sends partial network-location information to help with routing. Use the standard Quad9 endpoint unless you notice a real performance or location issue.
- **Another upstream provider:** Adding one for “backup” may send some queries to that provider and make Quad9’s threat blocking less consistent. Add another provider only if you specifically want to use and trust both.

Select **Test upstreams**, then save. If AdGuard Home offers an **Enable DNSSEC** option, you can enable it or leave it at its default; Quad9’s recommended resolver already performs DNSSEC validation.

## 4. Turn on DNS filtering

Open **Filters → DNS blocklists** and leave the built-in AdGuard DNS filter enabled. Start with that list alone, then use your usual apps and websites for a few days.

If something you need stops working, find the blocked request in **Query log** and allow only the specific domain that caused the issue. AdGuard Home supports both blocklists and allowlists.

## 5. Configure the router to use AdGuard Home

In your router’s LAN or DHCP settings, set the DNS server advertised to clients to the AdGuard Home address:

```text
10.0.0.X
```

Leave the secondary DNS field blank if the router permits it. A public secondary resolver may let devices bypass AdGuard Home. If the router requires a second address, a second AdGuard Home instance is a better backup.

After saving, reconnect devices to Wi-Fi or renew their network leases so they receive the updated DNS settings.

**Check IPv6:** If your router advertises an IPv6 DNS server, configure it to use AdGuard Home’s stable LAN IPv6 address, if available. Otherwise, some devices may use the router, ISP, or another resolver over IPv6 and bypass AdGuard’s filtering. If the router can’t advertise AdGuard Home as its IPv6 DNS server, test the affected devices and router options before relying on IPv4-only DNS.

## 6. Test the setup

From a computer on your LAN, run this command, replacing the placeholder with your AdGuard Home address:

```bash
nslookup example.com 10.0.0.X
```

On macOS or Linux, you can also test DNS over UDP and TCP:

```bash
dig @10.0.0.X example.com
dig +tcp @10.0.0.X example.com
```

The lookup should return an answer, and the request should appear in AdGuard Home’s **Query log**. Then visit [on.quad9.net](https://on.quad9.net) from a device using the network’s normal DNS settings to check whether Quad9 is being used.

## Notes

- The connection from devices to AdGuard Home on your LAN is normally regular DNS. The connection from AdGuard Home to Quad9 is the encrypted DoH portion.
- You don’t need to enable AdGuard Home’s own DoH or DoT server or set up certificates for this arrangement.
- A device or browser configured to use its own **Private DNS** or DNS-over-HTTPS may bypass the router’s DNS settings. If a device doesn’t appear in AdGuard Home’s **Query log**, check its DNS settings.
