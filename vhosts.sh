# 9. Configuring Virtual Hosts for Canvas
sudo unlink /etc/apache2/sites-enabled/000-default.conf
cp /var/dcc-scripts/config/canvas.conf /etc/apache2/sites-available/canvas.conf
cp /var/dcc-scripts/config/canvas-ssl.conf /etc/apache2/sites-available/canvas-ssl.conf
sudo a2ensite canvas.conf; 
sudo a2ensite canvas-ssl.conf;