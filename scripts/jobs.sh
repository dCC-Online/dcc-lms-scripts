#!/bin/bash
cd /var/canvas
# 10. Setup Automated jobs & Firewall Rules
sudo ln -s /var/canvas/script/canvas_init /etc/init.d/canvas_init; 
sudo update-rc.d canvas_init defaults; 
sudo /etc/init.d/canvas_init start; 
sudo ufw allow 80; 
sudo ufw allow 80/tcp; 
sudo ufw allow 443; 
sudo ufw allow 443/tcp; 
sudo ufw allow 3001; 
sudo ufw allow 3001/tcp; 
sudo ufw reload;