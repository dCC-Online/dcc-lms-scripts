#!/bin/bash


sudo sed -i "s|DOMAIN|$DOMAIN|g" config/openssl.conf

# # TEST: LOCALHOST SSL
cd /var/canvas
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_CERT_KEY_PATH -out $SSL_CERT_PATH -config /var/dcc-scripts/config/openssl.conf

# add self-signed SSL certs to VM's whitelist
sudo cp /var/canvas/fullchain.pem /usr/local/share/ca-certificates/fullchain.crt
sudo cp /var/canvas/privkey.pem /usr/local/share/ca-certificates/privkey.crt

# must add self-signed SSL to node's whitelist
export NODE_EXTRA_CA_CERTS=/var/canvas/fullchain.pem  
