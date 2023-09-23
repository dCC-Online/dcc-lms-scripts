#!/bin/bash
cd /var/canvas
# 5. Copy dcc-lms config files
cp /var/dcc-scripts/config/database.yml config/database.yml;
sudo nano config/database.yml
cp /var/dcc-scripts/config/dynamic_settings.yml config/dynamic_settings.yml
cp /var/dcc-scripts/config/outgoing_mail.yml config/outgoing_mail.yml
cp /var/dcc-scripts/config/domain.yml config/domain.yml
cp /var/dcc-scripts/config/security.yml config/security.yml