
sudo apt install php-pear php-dev -y

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt-get install -y nodejs

sudo apt install build-essential -y

#sudo npm install -g webpack webpack-cli speed-measure-webpack-plugin

#sudo npm install --save-dev speed-measure-webpack-plugin

#npm link webpack

#node --max_old_space_size=4000 /usr/bin/npm run build-vue

#export NODE_OPTIONS="--max-old-space-size=8192"

cat <<EOF | sudo tee /etc/php/7.3/mods-available/apcu.ini 
extension=apcu.so 
apc.enabled=1 
apc.write_lock=1 
apc.shm_size=100M 
apc.slam_defense=0 
apc.enable_cli=1
EOF