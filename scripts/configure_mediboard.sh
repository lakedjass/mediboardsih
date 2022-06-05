

echo "configure mediboard"
cd trunk

echo "composer install"
composer install

npm install

export NODE_OPTIONS="--max-old-space-size=8192"
npx browserslist@latest --update-db
npm run build-vue


echo "composer ox-install-config"
composer ox-install-config

composer install

echo "composer ox-install-database"
composer ox-install-database


cat <<EOF | sudo tee /etc/php/7.3/mods-available/apcu.ini 
extension=apcu.so 
apc.enabled=1 
apc.write_lock=1 
apc.shm_size=100M 
apc.slam_defense=0 
apc.enable_cli=1
EOF
