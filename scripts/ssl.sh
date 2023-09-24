#!/bin/bash
cd /var/canvas

# 8. Obtain SSL Certificate For Your Domain
sudo apt update; 
sudo apt install -y certbot;
sudo apt install -y python3-certbot-apache;

# PRODUCTION
sudo certbot --apache -d $DOMAIN; 
# auto-enter data???

# Automatic SSL Renewal
crontab -e;
0 0 * * * /usr/bin/certbot renew --quiet