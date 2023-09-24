#!/bin/sh

if [[ ! -f .env.staging ]]; then
  echo "This script requires a .env.staging file to run. You can acquire one from the danimal or create your own from the README instructions."
fi

source ./.env.staging

. scripts/system.sh
. scripts/db.sh
. scripts/package.sh
. scripts/clone.sh
. scripts/config.sh
. scripts/deps.sh
. scripts/apache.sh
. scripts/ssl-staging.sh
. scripts/vhosts.sh
. scripts/jobs.sh
. scripts/optim.sh
. scripts/rce.sh
