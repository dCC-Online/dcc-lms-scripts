cd /var/dcc-scripts

# DATABASE
sed -i "s|DB_NAME|$DB_NAME|g" config/database.yml
sed -i "s|DB_HOST|$DB_HOST|g" config/database.yml
sed -i "s|DB_USERNAME|$DB_USERNAME|g" config/database.yml
sed -i "s|DB_PASSWORD|$DB_PASSWORD|g" config/database.yml
sudo cp config/database.yml /var/canvas/config/database.yml

# DYNAMIC SETTINGS
sed -i "s|RCE_SUBDOMAIN|$RCE_SUBDOMAIN|g" config/dynamic_settings.yml
sudo cp config/dynamic_settings.yml /var/canvas/config/dynamic_settings.yml

# OUTGOING MAIL
sed -i "s|SMTP_ADDRESS|$SMTP_ADDRESS|g" config/outgoing_mail.yml
sed -i "s|SMTP_PORT|$SMTP_PORT|g" config/outgoing_mail.yml
sed -i "s|SMTP_USERNAME|$SMTP_USERNAME|g" config/outgoing_mail.yml
sed -i "s|SMTP_PASSWORD|$SMTP_PASSWORD|g" config/outgoing_mail.yml
sed -i "s|SMTP_PASSWORD|$SMTP_PASSWORD|g" config/outgoing_mail.yml
sed -i "s|SMTP_OUTGOING_ADDRESS|$SMTP_OUTGOING_ADDRESS|g" config/outgoing_mail.yml
sed -i "s|SMTP_DEFAULT_NAME|$SMTP_DEFAULT_NAME|g" config/outgoing_mail.yml
sudo cp config/outgoing_mail.yml /var/canvas/config/outgoing_mail.yml

# DOMAIN
sed -i "s|DOMAIN|$DOMAIN|g" config/domain.yml
sudo cp config/domain.yml /var/canvas/config/domain.yml

if ! grep -q "staging.dcc-lms.com" /etc/hosts; then
    echo "127.0.0.1   staging.dcc-lms.com" | sudo tee -a /etc/hosts
fi

if ! grep -q "rce.staging.dcc-lms.com" /etc/hosts; then
    echo "127.0.0.1   rce.staging.dcc-lms.com" | sudo tee -a /etc/hosts
fi

# SECURITY
ENCRYPTION_KEY=$(unique_string=$(head -c 32 /dev/urandom | base64 | tr -d '+/=' | tr -dc 'a-zA-Z0-9' | head -c 32); echo $unique_string); 
sed -i "s|DOMAIN|$DOMAIN|g" config/security.yml
sed -i "s|ENCRYPTION_KEY|$ENCRYPTION_KEY|g" config/security.yml
sudo cp config/security.yml /var/canvas/config/security.yml

