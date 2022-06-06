echo "installing php"
sudo apt install php libapache2-mod-php -y
sudo apt -y install php php-common
sudo apt -y install php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath
echo "restart apache2"
sudo systemctl restart apache2
sudo apt install php-text-password -y
sudo apt install php-pear php-gd php-tidy php-intl php-bcmath  php-mbstring php-uuid -y