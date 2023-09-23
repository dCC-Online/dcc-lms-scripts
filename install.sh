sudo mkdir -p /var/dcc-scripts
sudo cp -r . /var/dcc-scripts
sh /var/dcc-scripts/scripts/system.sh
sh /var/dcc-scripts/scripts/db.sh
sh /var/dcc-scripts/scripts/package.sh
sh /var/dcc-scripts/scripts/clone.sh
cd /var/canvas
sh /var/dcc-scripts/scripts/config.sh
sh /var/dcc-scripts/scripts/deps.sh
sh /var/dcc-scripts/scripts/apache.sh
# s/var/dcc-scripts ./scripts/ssl.sh #production
sh /var/dcc-scripts/scripts/ssl-test.sh # test
sh /var/dcc-scripts/scripts/vhosts.sh
sh /var/dcc-scripts/scripts/jobs.sh
sh /var/dcc-scripts/scripts/optim.sh
sh /var/dcc-scripts/scripts/rce.sh





















