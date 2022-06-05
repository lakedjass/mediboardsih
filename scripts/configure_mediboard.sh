

echo "configure mediboard"
cd trunk

echo "composer install"
composer install

npm install
export NODE_OPTIONS="--max-old-space-size=8192"
npm run build-vue

echo "composer ox-install-config"
composer ox-install-config

echo "composer ox-install-database"
composer ox-install-database