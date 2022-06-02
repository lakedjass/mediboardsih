#!/bin/bash

echo "Installing mysql"

echo "install needs packages"
sudo apt-get install -y gnupg debconf-utils
echo "export variable debian front end to desactive gui install"
export DEBIAN_FRONTEND="noninteractive"
sudo su -c "debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password debian2022'"
sudo su -c "debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password debian2022'"
#download the mysql apt repository
echo "download the mysql apt repository"
wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb -P /tmp

#install mysql apt repository
echo "install mysql apt repository"
sudo -E dpkg -i /tmp/mysql-apt-config_0.8.22-1_all.deb


#update the apt 
sudo apt-get update -y


#install mysql-server
sudo -E apt-get install mysql-server -y

#create vivo database with vivo user

#echo "create Vivo User with Password"
#cat <<EOF | sudo tee ./setup_db_mediboard.sql
#CREATE USER  mediboard@'localhost' IDENTIFIED BY '$VIVO_PASSWORD';
#GRANT ALL ON ${DATABASE_NAME}.* TO '$VIVO_USERNAME'@'localhost';
#FLUSH PRIVILEGES;
#EOF

#echo "execute script"
#mysql -u root -p${MYSQL_PASSWORD} < ./setup_db_vivo.sql

#sudo rm -fv ./setup_db_vivo.sql


sudo systemctl restart mysql
