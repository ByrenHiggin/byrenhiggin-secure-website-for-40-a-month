#!/usr/bin/env bash
# PostgreSQL from the two app servers, SSH from the edge only.
set -euo pipefail

sudo ufw default deny incoming
sudo ufw allow from 10.10.0.3 to any port 5432 proto tcp
sudo ufw allow from 10.10.0.4 to any port 5432 proto tcp
sudo ufw allow from 10.10.0.2 to any port 22 proto tcp
sudo ufw enable
