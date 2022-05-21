
echo "installing composer"

echo "install needs package"
sudo apt install wget  php-cli php-curl php-zip unzip -y

sudo apt install wget  php-dom php-gd php-bcmath php-apcu

echo "download the installer of composer"
wget -O composer-setup.php https://getcomposer.org/installer 


echo "lauch install of composer"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo "check update of composer"
sudo composer self-update  