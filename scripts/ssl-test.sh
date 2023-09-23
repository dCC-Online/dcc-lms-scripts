#!/bin/bash
cd /var/canvas
# 8. Obtain SSL Certificate For Your Domain
sudo apt update; 

# TEST: LOCALHOST SSL
sudo apt update
sudo apt install libnss3-tools
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
sudo mv mkcert-v1.4.3-linux-amd64 /usr/local/bin/mkcert
sudo chmod +x /usr/local/bin/mkcert
mkcert -install
mkcert localhost