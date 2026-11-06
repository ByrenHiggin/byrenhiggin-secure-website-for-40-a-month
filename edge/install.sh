#!/usr/bin/env bash
set -euo pipefail

sudo apt install nginx certbot python3-certbot-nginx fail2ban

# Point the domain's DNS at the edge first, with a plain port 80 server block.
sudo certbot certonly --nginx -d example.com.au -d www.example.com.au
