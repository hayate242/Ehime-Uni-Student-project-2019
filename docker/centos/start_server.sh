#/bin/sh
/sbin/init
systemctl enable php-fpm.service
systemctl enable nginx.service
