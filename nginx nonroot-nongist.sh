# Compile nginx standalone without root access
mkdir ~/installed
mkdir ~/installed/nginx
mkdir ~/src
cd ~/src

# PCRE dependency - we'll compile against this statically
wget http://kent.dl.sourceforge.net/sourceforge/pcre/pcre-7.8.tar.gz
tar -xzvf pcre-7.8.tar.gz

# Grab nginx
wget http://sysoev.ru/nginx/nginx-0.7.50.tar.gz
tar -xzvf nginx-0.7.50.tar.gz

# Compile it
cd nginx-0.7.50
./configure --prefix=/home/simon/installed/nginx --with-pcre=/home/simon/src/pcre-7.8
make
make install

# Edit config to not bind to port 80 (as we aren't root)
vi ~/installed/nginx/conf/nginx.conf