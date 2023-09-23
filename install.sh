sudo mkdir -p /var/dcc-scripts
sudo cp . /var/dcc-scripts
sh ./scripts/system.sh
sh ./scripts/db.sh
sh ./scripts/package.sh
sh ./scripts/clone.sh
cd ./scripts//var/canvas
sh ./scripts/config.sh
sh ./scripts/deps.sh
sh ./scripts/apache.sh
# sh ./scripts/ssl.sh #production
sh ./scripts/ssl-test.sh # test
sh ./scripts/vhosts.sh
sh ./scripts/jobs.sh
sh ./scripts/optim.sh
sh ./scripts/rce.sh





















