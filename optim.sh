# Permissions
cd /var/canvas; 
current_user=$(whoami); 
sudo chown -R "$current_user":"$current_user" .; 
sudo find config/ -type f -exec chmod 400 {} +;

# Optimized File Downloads
sudo apt-get install libapache2-mod-xsendfile;

# Create production-local.rb
echo "# If you have mod_xsendfile enabled in Apache:
config.action_dispatch.x_sendfile_header = 'X-Sendfile'
# For nginx:
# config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'" > config/environments/production-local.rb;


