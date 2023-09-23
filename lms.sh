#!/bin/bash

install() {
    sudo mkdir -p /var/dcc-scripts
    sudo cp -r . /var/dcc-scripts
    . /var/dcc-scripts/scripts/system.sh
    . /var/dcc-scripts/scripts/db.sh
    . /var/dcc-scripts/scripts/package.sh
    . /var/dcc-scripts/scripts/clone.sh
    . /var/dcc-scripts/scripts/config-db.sh
    . /var/dcc-scripts/scripts/config-dynamic_settings.sh
    . /var/dcc-scripts/scripts/config-smtp.sh
    . /var/dcc-scripts/scripts/config-domain.sh
    . /var/dcc-scripts/scripts/config-security.sh
    . /var/dcc-scripts/scripts/deps.sh
    . /var/dcc-scripts/scripts/apache.sh
    # . /var/dcc-scripts/scripts/ssl.sh #production
    . /var/dcc-scripts/scripts/ssl-test.sh # test
    . /var/dcc-scripts/scripts/vhosts.sh
    . /var/dcc-scripts/scripts/jobs.sh
    . /var/dcc-scripts/scripts/optim.sh
    . /var/dcc-scripts/scripts/rce.sh
}

case "$1" in 
    install) 
        install
        ;;
    *) 
        echo "Usage: $0 install"
        exit 1;;
esac
