#!/bin/bash
cd /var/canvas

# generate config/outgoing_mail.yml

echo "***CONFIGURE SMTP***"
read -p "Enter smtp address: " address
read -p "Enter smtp port number: " port
read -p "Enter smtp email address: " user_name
read -p "Enter smtp password: " password
read -p "Enter smtp domain: " domain
read -p "Enter stmp outgoing address (noreply@example.com): " outgoing_address
read -p "Enter stmp default sender name: " default_name



sudo echo "development:
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
  address: "$address"
  port: "$port"
  user_name: "$user_name"
  password: "$password"
  authentication: "plain" # plain, login, or cram_md5
  domain: "$domain"
  outgoing_address: "$outgoing_address"
  default_name: "$default_name"

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
" > config/outgoing_mail.yml