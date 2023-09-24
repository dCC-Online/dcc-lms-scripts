#!/bin/bash


# 8. Obtain SSL Certificate For Your Domain
# sudo apt update; 
# sudo apt install -y certbot;
# sudo apt install -y python3-certbot-apache;

# # TEST: LOCALHOST SSL
cd /var/canvas
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $SSL_CERT_KEY_PATH -out $SSL_CERT_PATH -config /var/dcc-scripts/config/openssl.conf


# sudo apt install libnss3-tools
# wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
# sudo mv mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
# sudo chmod +x /usr/local/bin/mkcert
# mkcert -install
# mkcert $DOMAIN $RCE_SUBDOMAIN