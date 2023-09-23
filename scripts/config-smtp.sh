#!/bin/bash
cd /var/canvas

while true; do
    read -p "Do you wish to configure SMTP for outgoing emails? (y/n) " yn
    case $yn in
        [Yy]* ) 
                read -p "Enter SMTP address (smtp.gmail.com): " address
                read -p "Enter SMTP port number: (587)" port
                read -p "Enter SMTP email address/username: " user_name
                read -p "Enter SMTP password: " password
                read -p "Enter SMTP domain: (gmail.com)" domain
                read -p "Enter SMTP outgoing address (noreply@devcodecamp.com): " outgoing_address
                read -p "Enter SMTP default sender name (devCodeCamp): " default_name
                
        break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n.";;
    esac
done





echo "***CREATING config/outgoing_mail.yml***"

echo "development:
  address: "smtp.example.com"
  port: "25"
  user_name: "user"
  password: "password"
  authentication: "plain" # plain, login, or cram_md5
  domain: "example.com"
  outgoing_address: "canvas@example.com"
  default_name: "Instructure Canvas"

# or to use sendmail --
#
# development:
#   delivery_method: "sendmail"

test:
  delivery_method: "test"

production:
  address: ${address:-"smtp.gmail.com"}
  port: ${port:-"587"}
  user_name: "$user_name"
  password: "$password"
  authentication: "plain" # plain, login, or cram_md5
  domain: ${domain:-"gmail.com"}
  outgoing_address: ${outgoing_address:-"noreply@devcodecamp.com"}
  default_name: ${default_name:-"devCodeCamp"}

# If receiving mail from multiple inboxes (see incoming_mail.yml.example),
# you'll want to include those addresses in a reply_to_addresses array so
# Canvas will select the Reply-To field of outgoing messages from all of the
# incoming mailboxes.

multiple_inboxes:
  address: "smtp.example.com"
  port: "25"
  user_name: "user"
  password: "password"
  authentication: "plain" # plain, login, or cram_md5
  domain: "example.com"
  outgoing_address: "canvas@example.com"
  default_name: "Instructure Canvas"
  reply_to_addresses:
  - "canvas1@example.com"
  - "canvas2@example.com"
  - "canvas3@example.com"
  - "canvas4@example.com"
" | sudo tee config/outgoing_mail.yml