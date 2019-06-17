# Ehime-Uni-Student-project-2019
独立型動画配信プラットフォーム

docker起動後
$ systemctl start php-fpm.service
$ systemctl start nginx.service
$ ps aux | grep -e nginx -e php-fpm

サーバの再起動が行われた場合でも自動で php-fpmとnginxが起動されるように設定
systemctl enable php-fpm.service
systemctl enable nginx.service
systemctl list-unit-files -t service | grep -e nginx -e php-fpm


エラーログの確認
tail -f /var/log/nginx/error.log
ls -l /var/run/php-fpm/php-fpm.sock
