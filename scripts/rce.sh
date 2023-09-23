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
# sudo cp /var/dcc-scripts/config/vault_contents.yml /var/canvas/vault_contents.yml;

# create vault_contents.yml
sudo echo "# standard vault config, including address of
# vault server as a string (addr) or in a file (addr_path)
# and path where vault token can
# be found (token_path) or the token itself (token)
# production:
#   addr_path: /path/to/vault/address
#   token_path: /path/to/vault/token
# test:
#   addr: "https://vault.test.domain"
#   token: s.wOrq9dO9kzOcuvB06CMviJhZ
# development:
#   addr: "https://vault.dev.domain"
#   token: s.wOrq9dO9kzOcuvB06CMviJhZ

# if you don't want to run vault, you can make use
# of a "vault_contents.yml" file in this directory and
# specify "file" as both your addr and token_path.
# this will make Canvas Vault read from the file
# contents rather than trying to talk to a vault agent.
development:
  addr: file
  token: file
test:
  addr: file
  token: file
production:
  'sts/testaccount/sts/canvas-shards-lookupper-dev':
    access_key: 'fake-access-key'
    secret_key: 'fake-secret-key'
    security_token: 'fake-security-token'
  'sts/testaccount/sts/canvas-release-notes':
    access_key: 'fake-access-key'
    secret_key: 'fake-secret-key'
    security_token: 'fake-security-token'
  'app-canvas/data/secrets':
    data:
      canvas_security:
        encryption_secret: "$ECOSYSTEM_SECRET"
        signing_secret: "$ECOSYSTEM_KEY"" > /var/canvas/vault_contents.yml


sudo a2enmod proxy_http; 
sudo service apache2 restart;
cd canvas-rce-api; 
sudo apt install screen; 
screen -S canvas-rce-api;
npm run start;

