sudo apt-get -y install gcc make autoconf libc-dev pkg-config
pecl install redis

sudo bash -c "echo extension=redis.so > /etc/php/7.3/mods-available/redis.ini"

sudo apt install redis-server

sudo apt install php-redis
