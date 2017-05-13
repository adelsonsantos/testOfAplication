################################################################################
# Base image
################################################################################

FROM ubuntu:trusty

################################################################################
# Build instructions
################################################################################
ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# add NGINX official stable repository
#RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/nginx.list

# add PHP5.6 unofficial repository (https://launchpad.net/~ondrej/+archive/ubuntu/php)
#RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/php.list
RUN apt-get update && \
    apt-get -y --force-yes upgrade && \
    apt-get update && \
    apt-get -y --force-yes install software-properties-common && \
    add-apt-repository -y ppa:nginx/stable && \
    add-apt-repository -y ppa:ondrej/php

# install packages
RUN apt-get update && \
    apt-get -y --force-yes --no-install-recommends install \
    supervisor \
    nginx \
    curl \
    wget \
    build-essential \
    pkg-config \
    php-pear \
    php5.6-dev \
    php5.6-cli \
    php5.6-fpm \
    php5.6-common \
    php5.6-curl \
    php5.6-intl \
    php5.6-json \
    php5.6-mbstring \
    php5.6-opcache \
    php5.6-gd \
    php5.6-xml \
    php5.6-xmlrpc \
    php5.6-zip \
    php5.6-soap \
    php5.6-sqlite3 \
    php5.6-mysql \
    php5.6-mongo \
    php-imagick \
    php-redis \
    php-amqp \
    php-stomp \
    php-horde-elasticsearch \
    php-mongo \
    php-mongodb

# install mongoDb php Lib
RUN pecl install mongodb
RUN phpenmod mongodb
RUN pecl install mongo
RUN phpenmod mongo

#install websocketd
ENV WEBSKD_VERSION 0.2.12

RUN wget https://github.com/joewalnes/websocketd/releases/download/v$WEBSKD_VERSION/websocketd-$WEBSKD_VERSION\_amd64.deb && \
    dpkg -i websocketd-$WEBSKD_VERSION\_amd64.deb && \
    rm websocketd-$WEBSKD_VERSION\_amd64.deb && \
    apt-get clean

#install extra tools
RUN apt-get update && apt-get install -my \
  vim \
  htop \
  iotop \
  iptraf

# clear apt cache and remove unnecessary packages
RUN apt-get autoclean && apt-get -y autoremove

# configure NGINX as non-daemon
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# configure php-fpm as non-daemon
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php/5.6/fpm/php-fpm.conf

# add a phpinfo script for INFO purposes
RUN echo "<?php phpinfo();" >> /var/www/html/index.php

# Remove default nginx configs.
#RUN rm -f /etc/nginx/conf.d/*

# Pass all docker environment
#RUN sed -i '/^;clear_env = no/s/^;//' /etc/php/5.6/fpm/pool.d/www.conf

# Get access to FPM-ping page /ping
#RUN sed -i '/^;ping\.path/s/^;//' /etc/php/5.6/fpm/pool.d/www.conf
# Get access to FPM_Status page /status
#RUN sed -i '/^;pm\.status_path/s/^;//' /etc/php/5.6/fpm/pool.d/www.conf

# Prevent PHP Warning: 'xdebug' already loaded.
# XDebug loaded with the core
#RUN sed -i '/.*xdebug.so$/s/^/;/' /etc/php/5.6/mods-available/xdebug.ini

# Add configuration files
COPY nginx/conf/supervisord.conf /etc/supervisor/conf.d/
#COPY nginx/conf/php.ini /etc/php/5.6/fpm/conf.d/40-custom.ini

# php-fpm5.6 will not start if this directory does not exist
RUN mkdir /run/php

#enable xterm
RUN echo "export TERM=xterm" >> /etc/bash.bashrc

################################################################################
# Volumes
################################################################################

VOLUME ["/var/www", "/etc/nginx/conf.d", "/etc/nginx/sites-available", "/opt/project"]

################################################################################
# Ports
################################################################################

EXPOSE 80 443 8080 9000

################################################################################
# Entrypoint
################################################################################

ENTRYPOINT ["/usr/bin/supervisord"]
