# remirepo
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum-config-manager --enable remi-php74


# Oracle repo
# install php
sudo yum install -y oracle-php-release-el7 oracle-epel-release-el7 mysql-release-el7
sudo yum install -y php php-mysqlnd php-json 
sudo yum install -y php php-cli php-mysqlnd php-zip php-gd php-mcrypt php-mbstring php-xml php-json php-pear php-devel php-common

# install mysql_xdevapi
sudo yum install -y boost-devel protobuf-devel
sudo yum install -y devtoolset-8 

# mysql_xdevapi 8.0.21 (cannot be directly compiled)
# sudo pecl install mysql_xdevapi
# - using 8.0.20
sudo scl enable devtoolset-8 bash << EOL
sudo pecl install mysql_xdevapi-8.0.20
EOL

# vi /etc/php.d/40-mysql_xdevapi.ini
sudo echo "extension=mysql_xdevapi.so" > /etc/php.d/40-mysql_xdevapi.ini

