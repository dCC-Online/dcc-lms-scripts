#!/bin/bash

sudo apt-get install -y postgresql-12; 
sudo -u postgres createuser canvas --no-createdb --no-superuser --no-createrole;
sudo -u postgres psql -c "ALTER USER canvas WITH PASSWORD '$DB_PASSWORD';"
sudo -u postgres createdb canvas_production --owner=canvas; 
sudo -u postgres createdb canvas_development --owner=canvas; 
sudo -u postgres createuser $USER; 
sudo -u postgres psql -c "alter user $USER with superuser" postgres;
