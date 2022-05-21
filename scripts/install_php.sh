echo "installing php"
sudo apt install php libapache2-mod-php -y

echo "restart apache2"
sudo systemctl restart apache2