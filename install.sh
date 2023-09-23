#!/bin/bash

sudo mkdir -p /var/dcc-scripts
sudo cp -r . /var/dcc-scripts
bash /var/dcc-scripts/scripts/system.sh
bash /var/dcc-scripts/scripts/db.sh
bash /var/dcc-scripts/scripts/package.sh
bash /var/dcc-scripts/scripts/clone.sh
bash /var/dcc-scripts/scripts/config-db.sh
bash /var/dcc-scripts/scripts/config-dynamic_settings.sh
bash /var/dcc-scripts/scripts/config-smtp.sh
bash /var/dcc-scripts/scripts/config-domain.sh
bash /var/dcc-scripts/scripts/config-security.sh
bash /var/dcc-scripts/scripts/deps.sh
bash /var/dcc-scripts/scripts/apache.sh
# bash /var/dcc-scripts/scripts/ssl.sh #production
bash /var/dcc-scripts/scripts/ssl-test.sh # test
bash /var/dcc-scripts/scripts/vhosts.sh
bash /var/dcc-scripts/scripts/jobs.sh
bash /var/dcc-scripts/scripts/optim.sh
bash /var/dcc-scripts/scripts/rce.sh


# VARS
# DOMAIN
# RCE_SUBDOMAIN