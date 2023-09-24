#!/bin/bash
cd /var/canvas

# 12. Enable Canvas Rich Content Editor
git clone https://github.com/instructure/canvas-rce-api.git; 
cd canvas-rce-api; 
npm install --production;
npm audit fix; 
sudo cp .env.example .env; 
ECOSYSTEM_SECRET=$(unique_string=$(head -c 32 /dev/urandom | base64 | tr -d '+/=' | tr -dc 'a-zA-Z0-9' | head -c 32); echo $unique_string); 
echo $unique_string && ECOSYSTEM_KEY=$(unique_string=$(head -c 32 /dev/urandom | base64 | tr -d '+/=' | tr -dc 'a-zA-Z0-9' | head -c 32); echo $unique_string); 
echo $unique_string && CIPHER_PASSWORD=$(openssl rand -hex 16) && sed -i "s/^\(NODE_ENV=\).*/\1production/; s/^\(ECOSYSTEM_SECRET=\).*/\1$ECOSYSTEM_SECRET/; s/^\(ECOSYSTEM_KEY=\).*/\1$ECOSYSTEM_KEY/; s/^\(CIPHER_PASSWORD=\).*/\1$CIPHER_PASSWORD/" .env; 
sudo sed -i "s|ECOSYSTEM_KEY|$ECOSYSTEM_KEY|g" /var/dcc-scripts/config/vault_contents.yml 
sudo sed -i "s|ECOSYSTEM_SECRET|$ECOSYSTEM_SECRET|g" /var/dcc-scripts/config/vault_contents.yml 
sudo cp /var/dcc-scripts/config/vault_contents.yml /var/canvas/config/vault_contents.yml

sudo a2enmod proxy_http; 
sudo service apache2 restart;
cd /var/canvas/canvas-rce-api; 
sudo apt install screen; 
screen -dmS canvas-rce-api npm run start;

