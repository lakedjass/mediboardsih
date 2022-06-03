

echo "configure mediboard"
cd trunk

echo "composer install"
composer install

npm install
npm run build:dev

echo "composer ox-install-config"
composer ox-install-config

echo "composer ox-install-database"
composer ox-install-database