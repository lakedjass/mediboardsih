

echo "configure mediboard"
cd trunk

echo "composer install"
composer install

echo "composer update"
composer update

echo "composer ox-install-config"
composer ox-install-config

echo "composer ox-install-database"
composer ox-install-database