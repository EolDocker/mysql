FROM ubuntu:14.04
MAINTAINER Dmitry Mozzherin

RUN apt-get update \
    && apt-get -yq install mysql-server-5.6 pwgen \
    && rm -rf /var/lib/apt/lists/*

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

ADD my.cnf /etc/mysql/my.cnf
# RUN  /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf

# Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**

VOLUME /var/log
VOLUME /var/lib/mysql
EXPOSE 3306

ADD start.sh /start.sh
CMD ["/start.sh"]

