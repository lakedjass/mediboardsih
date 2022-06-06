sudo apt-get -y install gcc make autoconf libc-dev pkg-config
pecl install redis
/etc/php/7.3/mods-available/
sudo bash -c "echo extension=redis.so > /etc/php/7.3/mods-available/redis.ini"