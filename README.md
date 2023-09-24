# dcc-lms-scripts

This is a series of shell scripts that expidite the installation of the devCodeCamp Canvas LMS to a production environment (must be Ubuntu 20.04). Run  `sh install.sh`  to install. This process takes about 15 minutes and will prompt you for credentials & secrets along the way, which vary depending on whether you're spinning up a test or production instance.

## Database
Canvas uses a Postgres db, which must be setup and configured before installing the LMS. In the test branch, a postgresql db is automatically installed and configured, but in production the db will be hosted on a separate server.

## test branch


## prod branch
