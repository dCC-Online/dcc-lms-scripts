#!/bin/sh

if [[ ! -f .env.staging ]]; then
  echo "This script requires a .env.staging file to run. You can acquire one from the danimal or create your own from the README instructions."
  exit 1
fi

source ./.env.staging

. scripts/config.sh
. scripts/system.sh
. scripts/package.sh
. scripts/clone.sh
. scripts/deps.sh
. scripts/apache.sh
. scripts/ssl.sh #production
# . scripts/ssl-test.sh # test
. scripts/vhosts.sh
. scripts/jobs.sh
. scripts/optim.sh
. scripts/rce.sh
