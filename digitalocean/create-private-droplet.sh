#!/usr/bin/env bash
# Create a Private Droplet (no public IP) in the VPC.
# Usage: DIGITALOCEAN_TOKEN=... ./create-private-droplet.sh app-1
set -euo pipefail

NAME="${1:?usage: $0 <droplet-name>}"

curl -X POST https://api.digitalocean.com/v2/droplets \
  -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "'"$NAME"'",
    "region": "syd1",
    "size": "s-1vcpu-1gb",
    "image": "ubuntu-24-04-x64",
    "vpc_uuid": "YOUR_VPC_ID",
    "ssh_keys": ["YOUR_KEY_ID"],
    "public_networking": false
  }'
