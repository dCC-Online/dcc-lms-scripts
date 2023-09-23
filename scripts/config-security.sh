#!/bin/bash
cd /var/canvas

sudo echo "production: &default
  encryption_key: $(unique_string=$(head -c 32 /dev/urandom | base64 | tr -d '+/=' | tr -dc 'a-zA-Z0-9' | head -c 32); echo $unique_string); 
  lti_iss: "$DOMAIN"

development:
  <<: *default
  encryption_key: facdd3a131ddd8988b14f6e4e01039c93cfa0160
  previous_encryption_keys:
    - 0610afc39c93010e4e6f41b8898ddd131a3ddcaf

test:
  <<: *default
  encryption_key: facdd3a131ddd8988b14f6e4e01039c93cfa0160
" > config/security.yml