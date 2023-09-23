#!/bin/bash

while true; do
    read -p "Do you wish to configure an external database? (y/n) " yn
    case $yn in
        [Yy]* ) 
                read -p "Enter database name: " db_name
                read -p "Enter database host: " db_host
                read -p "Enter database root user: " db_username
                read -p "Enter database name: " db_name
                read -sp "Enter a password for the database root user: " db_pw

                # need to sort out connecting to external db server to create db, root user, pw, role
                
        break;;
        [Nn]* ) 
                read -sp "Enter a password for the database root user: " db_pw
                echo "Database password: $db_pw"


                sudo apt-get install -y postgresql-12; 

              expect <<EOD
                sudo -u postgres createuser canvas --no-createdb --no-superuser --no-createrole --pwprompt;
                expect "Enter password for new role:"
                send "$db_pw\r"
                expect eof
              EOD
              
                sudo -u postgres createdb canvas_production --owner=canvas; 
                sudo -u postgres createdb canvas_development --owner=canvas; 
                sudo -u postgres createuser $USER; 
                sudo -u postgres psql -c "alter user $USER with superuser" postgres;
        break;;
        * ) echo "Please answer y or n.";;
    esac
done

sudo echo "test:
  adapter: postgresql
  encoding: utf8
  database: canvas_test
  host: localhost
  username: canvas
  password: $db_pw
  timeout: 5000

development:
  adapter: postgresql
  encoding: utf8
  database: canvas_development
  password: $db_pw
  timeout: 5000
  secondary:
    replica: true
    username: canvas_readonly_user

production:
  adapter: postgresql
  encoding: utf8
  database: ${db_name:-"canvas_production"}
  host: ${db_host:-"localhost"}
  username: ${db_username:-"canvas"}
  password: $db_pw
  timeout: 5000" > /var/dcc-scripts/config/database.yml




