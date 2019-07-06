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
    yum -y update remi-release


COPY nginx.conf /usr/local/nginx/conf/
COPY nginx.service /usr/lib/systemd/system/

RUN yum install -y wget gcc pcre-devel openssl openssl-devel git && \
    rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro && \
    rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm

# [nginx-rtmp-module] [nginx(ソースコード)]のダウンロード
RUN mkdir /Streaming && \
    cd /Streaming && \
    git clone https://github.com/arut/nginx-rtmp-module.git
# [nginx-rtmp-module] のmake
RUN cd /Streaming && \
    wget http://nginx.org/download/nginx-1.12.2.tar.gz && \
    tar zxf nginx-1.12.2.tar.gz && \
    rm -rf nginx-1.12.2.tar.gz
RUN cd /Streaming/nginx-1.12.2/ && \
    ./configure --add-module=/Streaming/nginx-rtmp-module && \
    make && \
    make install

# RUN mkdir /usr/local/nginx/html/movie && \
#     chown nobody /usr/local/nginx/html/movie

RUN chown nobody /usr/local/nginx/html/movie


EXPOSE 80

# enable service.
RUN systemctl enable nginx.service
CMD ["/sbin/init"]
# ADD start_server.sh /tmp/start_server.sh
# RUN chmod 744 /tmp/start_server.sh
# CMD ["/tmp/start_server.sh"]


WORKDIR /usr/local/nginx/html