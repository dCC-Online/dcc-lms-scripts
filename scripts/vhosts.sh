#!/bin/bash
cd /var/canvas

# 9. Configuring Virtual Hosts for Canvas
sudo unlink /etc/apache2/sites-enabled/000-default.conf

cd /var/dcc-scripts
sudo sed -i "s|DOMAIN|$DOMAIN|g" config/canvas.conf
sudo cp config/canvas.conf /etc/apache2/sites-available/canvas.conf

sudo sed -i "s|DOMAIN|$DOMAIN|g" config/canvas-ssl.conf
sudo sed -i "s|SSL_CERT_PATH|$SSL_CERT_PATH|g" config/canvas-ssl.conf
sudo sed -i "s|SSL_CERT_KEY_PATH|$SSL_CERT_KEY_PATH|g" config/canvas-ssl.conf
sudo cp config/canvas-ssl.conf /etc/apache2/sites-available/canvas-ssl.conf


cd /var/canvas
sudo a2ensite canvas.conf; 
sudo a2ensite canvas-ssl.conf;