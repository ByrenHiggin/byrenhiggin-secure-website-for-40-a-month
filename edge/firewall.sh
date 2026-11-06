#!/usr/bin/env bash
# eth0 is the public interface, eth1 is the VPC.
# Before enabling, apply etc/ufw/sysctl.conf and etc/ufw/before.rules.nat.
set -euo pipefail

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 80,443/tcp
sudo ufw allow from YOUR_IP to any port 22 proto tcp
sudo ufw route allow in on eth1 out on eth0
sudo ufw enable
