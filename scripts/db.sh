#!/bin/bash

# 2. Create a PostgreSQL user and databases for Canvas 
# Once you execute this command, it will ask for your server password and then, your canvas PostgreSQL password. 
# Note the canvas Postgres PW as it will be used when we will edit the canvas database config file.
sudo apt-get install -y postgresql-12; 
sudo -u postgres createuser canvas --no-createdb --no-superuser --no-createrole --pwprompt; 
sudo -u postgres createdb canvas_production --owner=canvas; 
sudo -u postgres createdb canvas_development --owner=canvas; 
sudo -u postgres createuser $USER; 
sudo -u postgres psql -c "alter user $USER with superuser" postgres;
