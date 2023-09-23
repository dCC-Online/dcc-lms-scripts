#!/bin/bash
cd /var/canvas


# cp /var/dcc-scripts/config/domain.yml config/domain.yml

sudo echo "test:
  domain: localhost

development:
  domain: "$DOMAIN"
  # If you want to set up SSL and a separate files domain, use the following and set up puma-dev from github.com/puma/puma-dev
  # domain: "canvas-lms.test" # for puma-dev
  # files_domain: "canvas-lms.files" # for puma-dev
  # ssl: true

production:
  domain: "$DOMAIN"
  # whether this instance of canvas is served over ssl (https) or not
  # defaults to true for production, false for test/development
  ssl: true
  # files_domain: "canvasfiles.example.com"
" > config/domain.yml