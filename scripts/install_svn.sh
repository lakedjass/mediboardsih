sudo apt update -y
sudo apt upgrade -y

echo "installing apache2"
sudo apt install apache2 -y

echo "make enable apache2"
sudo systemctl enable apache2
sudo systemctl start apache2



echo "installing subversion and tools"
sudo apt install -y subversion subversion-tools libapache2-mod-svn

echo "check enable of modules"
sudo a2enmod dav
sudo a2enmod dav_svn


echo "restart apache2 service"
sudo service apache2 restart
