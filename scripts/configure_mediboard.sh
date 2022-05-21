

echo "configure mediboard"
cd trunk

echo "composer install"
composer install

echo "composer ox-install-config"
composer ox-install-config