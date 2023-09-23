#!/bin/bash

# 11. Setup Redis in Cache Configuration
sudo add-apt-repository ppa:chris-lea/redis-server; 
sudo apt-get update; 
sudo apt-get install redis-server; 
sudo systemctl start redis-server; 
sudo systemctl enable redis-server; 

sudo cp /var/dcc-scripts/config/cache_store.yml config/cache_store.yml; 
sudo cp /var/dcc-scripts/config/redis.yml config/redis.yml