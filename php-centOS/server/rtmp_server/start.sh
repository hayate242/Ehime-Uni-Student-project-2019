#/bin/sh
systemctl start php-fpm.service
systemctl start nginx.service
ps aux | grep -e nginx -e php-fpm