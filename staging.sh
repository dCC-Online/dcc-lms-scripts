#!/bin/sh

while true
read -p "Is this the initial deployment y/n? " init_deployment

sudo cp env.example .env.production
sudo nano .env.staging

sudo mkdir -p /var/dcc-scripts
sudo cp -r . /var/dcc-scripts

if [[ -f .env.staging ]]; then
  source ./.env.staging

  . /var/dcc-scripts/scripts/system.sh
  . /var/dcc-scripts/scripts/db.sh
  . /var/dcc-scripts/scripts/package.sh
  . /var/dcc-scripts/scripts/clone.sh
  . /var/dcc-scripts/scripts/config.sh
  . /var/dcc-scripts/scripts/deps.sh
  . /var/dcc-scripts/scripts/apache.sh
  . /var/dcc-scripts/scripts/ssl.sh
  . /var/dcc-scripts/scripts/vhosts.sh
  . /var/dcc-scripts/scripts/jobs.sh
  . /var/dcc-scripts/scripts/optim.sh
  . /var/dcc-scripts/scripts/rce.sh
else
  echo "This script requires a .env.staging file to run. You can acquire one from the danimal or create your own from the README instructions."
fi