FROM ubuntu:14.04.1
MAINTAINER Dmitry Mozzherin
ENV LAST_FULL_REBUILD 2015-03-05
RUN apt-get update \
    && apt-get -yq install mysql-server-5.6 pwgen \
    && rm -rf /var/lib/apt/lists/*

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

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

