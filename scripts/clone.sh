#!/bin/bash
# 4. Clone and Install Canvas LMS into /var/canvas/
current_user=$(whoami); new_directory="/var"; 
cd "$new_directory"; 
sudo git clone --depth 1 https://github.com/dCC-Online/dcc-lms.git canvas; 
sudo chown -R "$current_user":"$current_user" "$new_directory"/canvas; 
cd canvas;
for config in amazon_s3 database delayed_jobs domain file_store outgoing_mail security external_migration; 
do cp config/$config.yml.example config/$config.yml; 
done;