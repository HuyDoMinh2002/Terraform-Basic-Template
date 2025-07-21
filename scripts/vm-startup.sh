#!/bin/bash
# start up script do not need "sudo" because they already run as root user by default

# Update the package list
apt-get update -y

# Install Apache and PHP
apt-get install -y apache2 php

# Enable Apache to start on boot
systemctl enable apache2

# Delete the index.html in /var/www/html/ folder
rm /var/www/html/index.html

# Create a sample PHP file if you don’t have one in your VM already
echo "<?php echo 'Hello World'; ?>" > /var/www/html/index.php

# Set proper permissions
chown www-data:www-data /var/www/html/index.php

# Restart Apache to load PHP
systemctl restart apache2
