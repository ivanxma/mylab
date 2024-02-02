MYPATH=$PWD
if [ -d /var/www/html ]
then
  cd /var/www/html;sudo unzip $MYPATH/latest.zip
  sudo chown -R apache:apache /var/www/html/wordpress
  sudo systemctl restart httpd
else
  echo "check if httpd is installed - folder /var/www/html is not a directory"
fi
