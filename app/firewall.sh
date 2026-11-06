#!/usr/bin/env bash
# Web traffic and SSH from the edge only.
set -euo pipefail

sudo ufw default deny incoming
sudo ufw allow from 10.10.0.2 to any port 3000 proto tcp
sudo ufw allow from 10.10.0.2 to any port 22 proto tcp
sudo ufw enable
