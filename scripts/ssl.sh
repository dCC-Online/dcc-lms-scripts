#!/bin/bash
cd /var/canvas
# 8. Obtain SSL Certificate For Your Domain
sudo apt update; 

# PRODUCTION
sudo apt install certbot;
sudo apt install python3-certbot-apache;
sudo certbot --apache -d {your_domain}; 
# auto-enter data???

# Automatic SSL Renewal
crontab -e;
0 0 * * * /usr/bin/certbot renew --quiet