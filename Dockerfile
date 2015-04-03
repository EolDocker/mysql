FROM ubuntu:14.04.1
MAINTAINER Dmitry Mozzherin
ENV LAST_FULL_REBUILD 2015-03-05
RUN groupadd -f -g 301 -r mysql && \
    useradd -u 301 -g 301 -r -d "/nonexistent" -M -s "/bin/false" mysql && \
    apt-get update && \
    apt-get -yq install mysql-server-5.6 pwgen && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/mysql/*

# Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**

VOLUME /var/log
VOLUME /var/lib/mysql
VOLUME /etc/mysql
EXPOSE 3306

COPY start.sh /start.sh
COPY stop.sh /stop.sh
CMD ["/start.sh"]
