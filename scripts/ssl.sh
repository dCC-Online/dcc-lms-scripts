#!/bin/bash
cd /var/canvas

sudo cp /config/options-ssl-apache.conf /etc/letsencrypt/options-ssl-apache.conf



# 8. Obtain SSL Certificate For Your Domain
sudo apt update; 
sudo apt install -y certbot;
sudo apt install -y python3-certbot-apache;

# PRODUCTION
sudo certbot --apache -d $DOMAIN -d $RCE_SUBDOMAIN; 
# auto-enter data???

# Automatic SSL Renewal
crontab -e;
0 0 * * * /usr/bin/certbot renew --quiet