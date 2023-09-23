#!/bin/bash
cd /var/canvas
# 9. Configuring Virtual Hosts for Canvas
sudo unlink /etc/apache2/sites-enabled/000-default.conf
sudo cp /var/dcc-scripts/config/canvas.conf /etc/apache2/sites-available/canvas.conf
sudo cp /var/dcc-scripts/config/canvas-ssl.conf /etc/apache2/sites-available/canvas-ssl.conf
sudo a2ensite canvas.conf; 
sudo a2ensite canvas-ssl.conf;