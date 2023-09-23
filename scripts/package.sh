#!/bin/bash

# 3. Installing Git, Ruby, Node.js, and Yarn
sudo apt-get install -y git-core; 
sudo apt-get install -y software-properties-common; 
sudo add-apt-repository ppa:instructure/ruby; 
sudo apt-get update; 
sudo apt-get install -y ruby3.1 ruby3.1-dev zlib1g-dev libxml2-dev libsqlite3-dev postgresql libpq-dev libxmlsec1-dev libidn11-dev curl make g++; 
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -; # will display a version error, can ignore.
sudo apt-get install -y nodejs; 
sudo npm install -g npm@latest; 
curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.19.1;
source /root/.bashrc;
export PATH="$HOME/.yarn/bin:$PATH";