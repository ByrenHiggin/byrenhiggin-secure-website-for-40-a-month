# A secure, load-balanced website with a private database for $40 a month

Configuration files for the article at
https://byrenhigg.in/blog/secure-website-for-40-a-month/

```text
                Internet
                   │  443, 80 (SSH from your IP only)
          ┌────────▼─────────┐
          │       edge        │  public IP
          │ nginx · fail2ban  │  TLS, load balancing, rate limits
          │ ufw · NAT         │  outbound internet for the private servers
          └────────┬─────────┘
                   │  VPC 10.10.0.0/24, no public IPs below this line
          ┌────────┴─────────┐
     ┌────▼────┐        ┌────▼────┐
     │  app-1  │        │  app-2  │  your website or application
     └────┬────┘        └────┬────┘
          └────────┬─────────┘
              ┌────▼────┐
              │   db    │  PostgreSQL
              └─────────┘
```

| Folder | Goes on | Contents |
| --- | --- | --- |
| `digitalocean/` | your machine | Create a Private Droplet through the API |
| `all/` | every droplet | SSH hardening |
| `edge/` | edge (10.10.0.2) | nginx load balancer, fail2ban, ufw, NAT |
| `private/` | app-1, app-2, db | Route outbound traffic through the edge |
| `app/` | app-1 (10.10.0.3), app-2 (10.10.0.4) | Host firewall |
| `db/` | db (10.10.0.5) | PostgreSQL access rules, host firewall, nightly backups |

Files under `etc/` mirror where they live on the server. Some are lines to add
to an existing file rather than a whole file. The comment at the top of each
one says which.

Replace the example IP addresses, `example.com.au`, `YOUR_IP`, `YOUR_VPC_ID`
and `YOUR_KEY_ID` with your own.
