################################################################################
# Base image
################################################################################

FROM ubuntu:trusty

################################################################################
# Build instructions
################################################################################

# Language and Envirement
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Upgrade Ubuntu
RUN apt-get update && apt-get upgrade -y

# Install base packs and tools
RUN apt-get update && apt-get install -my \
  supervisor \
  curl \
  wget \
  htop \
  pkg-config \
  vim \
  iotop \
  git \
  software-properties-common \
  python-software-properties \
  debconf-utils
  
# install Apache
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/apache2
RUN apt-get update && apt-get install -my \
  apache2 apache2-doc apache2-utils

# install php Repository
RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get install -my \
  libapache2-mod-php5.6 \
  mongodb-clients \
  php5.6 \
  php5.6-bcmath \
  php5.6-common \
  php5.6-enchant \
  php5.6-imap \
  php5.6-ldap \
  php5.6-odbc \
  php5.6-pspell \
  php5.6-soap \
  php5.6-xml \
  php5.6-bz2 \
  php5.6-curl \
  php5.6-fpm \
  php5.6-interbase \
  php5.6-mbstring \
  php5.6-opcache \
  php5.6-readline \
  php5.6-sqlite3 \
  php5.6-xmlrpc \
  php5.6-cgi \
  php5.6-dba \
  php5.6-gd \
  php5.6-intl \
  php5.6-mcrypt \
  php5.6-pgsql \
  php5.6-recode \
  php5.6-sybase \
  php5.6-xsl \
  php5.6-cli \
  php5.6-dev \
  php5.6-json \
  php5.6-mysql \
  php5.6-phpdbg \
  php5.6-tidy \
  php5.6-zip \
  php-pear \
  php-amqp \
  php-imagick \
  php-mongo \
  php-mongodb \
  php-redis

# install mongoDb php Lib
RUN pecl install mongodb && phpenmod mongodb
RUN pecl install mongo && phpenmod mongo

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/sbin/composer

#install websocketd
RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.2.12/websocketd-0.2.12_amd64.deb \
  && dpkg -i websocketd-0.2.12_amd64.deb \
  && rm websocketd-0.2.12_amd64.deb

RUN echo "#!/bin/sh" > /usr/sbin/runApache2
RUN echo "rm -f /run/apache2/apache2.pid" >> /usr/sbin/runApache2
RUN echo "apachectl -D "FOREGROUND" -k start" >> /usr/sbin/runApache2
RUN chmod +x /usr/sbin/runApache2

# Criando e configurando usuário docker
RUN useradd -m docker && echo "docker:docker" | chpasswd \
  && adduser docker sudo \
  && adduser docker root \
  && adduser www-data docker
  

# install assets plugin globaly
RUN composer global require "fxp/composer-asset-plugin:>1.2.0"

# install assets plugin globaly no usuário docker
RUN sudo -H -u docker composer global require "fxp/composer-asset-plugin:>1.2.0"

# Add Configurations Files
RUN rm /etc/apache2/sites-available/*
COPY conf/supervisord.conf /etc/supervisor/conf.d/
COPY sites-available/*.conf /etc/apache2/sites-available/

# Enable all sites
RUN a2dissite 0*
RUN a2ensite 0*

# Enable Apache modules
RUN a2enmod rewrite \
  && a2enmod expires
  
#enable xterm, Alias and default folder
RUN echo "export TERM=xterm" >> /etc/bash.bashrc \
  && echo "alias _composer='sudo -H -u docker php composer.phar'" >> /etc/bash.bashrc \
  && echo "alias _composerupdate='sudo -H -u docker php composer.phar update -o'" >> /etc/bash.bashrc \
  && echo "alias _composerdump='sudo -H -u docker php composer.phar dumpautoload -o'" >> /etc/bash.bashrc \
  && echo "alias _testrun='sudo -H -u docker vendor/bin/codecept -vvv run'" >> /etc/bash.bashrc \
  && echo "alias _testbuild='sudo -H -u docker vendor/bin/codecept -vvv build'" >> /etc/bash.bashrc \
  && echo "alias _testgenerateacceptance='sudo -H -u docker vendor/bin/codecept generate:cept acceptance'" >> /etc/bash.bashrc \
  && echo "alias _testgeneratefunctional='sudo -H -u docker vendor/bin/codecept generate:cept functional'" >> /etc/bash.bashrc \
  && echo "alias _testgenerateunit='sudo -H -u docker vendor/bin/codecept generate:test unit'" >> /etc/bash.bashrc \
  && echo "cd /opt/project/protected" >> /etc/bash.bashrc

# USER docker
################################################################################
# Volumes
################################################################################

VOLUME ["/var/www", "/etc/apache2/sites-available", "/opt/project"]

################################################################################
# Ports
################################################################################

EXPOSE 80 443 8080 9000

################################################################################
# Entrypoint
################################################################################

ENTRYPOINT ["/usr/bin/supervisord"]