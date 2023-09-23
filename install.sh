mkdir -p /var/dcc-scripts
cp . /var/dcc-scripts
sh system.sh
sh db.sh
sh package.sh
sh clone.sh
sh config.sh
sh deps.sh
sh apache.sh
# sh ssl.sh #production
sh ssl-test.sh # test
sh vhosts.sh
sh jobs.sh
sh optim.sh
sh rce.sh





















