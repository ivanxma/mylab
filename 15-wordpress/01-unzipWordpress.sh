if [ -d /var/www/html ]
then
  cd /var/www/html;sudo unzip /opt/download/wordpress-4.7.2.zip
  sudo chown -R apache:apache /var/www/html/wordpress
  sudo systemctl restart httpd
else
  echo "check if httpd is installed - folder /var/www/html is not a directory"
fi
