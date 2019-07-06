FROM centos
RUN yum -y update && \
#git(特にいらんけど。。)
yum install -y git && \
# EPELリポジトリの追加
rpm -ivh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm && \
yum -y update epel-release && \
# remiの追加
rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi && \
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
yum -y update remi-release && \
# install php
yum -y --enablerepo=remi-php73,epel install php-fpm php-gd php-gmp php-mbstring php-mcrypt php-opcache php-pdo php-pear-MDB2-Driver-mysqli php-pecl-memcached php-pecl-msgpack php-xml && \
# install nginx
rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
yum -y update nginx-release-centos && \
yum -y --enablerepo=nginx install nginx



COPY php.ini /etc/
COPY www.conf /etc/php-fpm.d/
COPY php-fpm.conf /etc/tmpfiles.d/

# enable service.
RUN systemctl enable php-fpm.service &&\
    systemctl enable nginx.service


RUN yum install -y wget gcc pcre-devel openssl openssl-devel git && \
    rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro && \
    rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
# EXPOSE 80
CMD ["/sbin/init"]
# ADD start_server.sh /tmp/start_server.sh
# RUN chmod 744 /tmp/start_server.sh
# CMD ["/tmp/start_server.sh"]


WORKDIR /usr/share/nginx/html