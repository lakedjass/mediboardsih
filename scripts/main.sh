
source install_svn.sh
source install_php.sh
source install_pecl.sh
source install_composer.sh
source install_mysql.sh
source get_mediboard.sh
#source configure_mediboard.sh

cat <<EOF | sudo tee /etc/php/7.3/mods-available/apcu.ini 
extension=apcu.so 
apc.enabled=1 
apc.write_lock=1 
apc.shm_size=100M 
apc.slam_defense=0 
apc.enable_cli=1
EOF