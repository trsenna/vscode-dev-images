FROM trsenna/vscodedevimages-foundation:base

ENV DEBIAN_FRONTEND=noninteractive

RUN add-apt-repository ppa:ondrej/apache2 \
    && add-apt-repository ppa:ondrej/php

RUN apt-get -y update --no-install-recommends \
    && apt-get -y install --no-install-recommends \
    apache2 \
    libapache2-mod-php7.4 \
    php7.4 \
    php7.4-mysql \
    php7.4-pgsql \
    php7.4-sqlite3 \
    && apt-get autoremove -y \
    && apt-get clean -y

RUN apt-get -y update --no-install-recommends \
    && apt-get -y install --no-install-recommends \
    php7.4-curl \
    php7.4-dev \
    php7.4-gd \
    php7.4-imagick \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-memcached \
    php7.4-soap \
    php7.4-xdebug \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-zip \
    && apt-get autoremove -y \
    && apt-get clean -y

RUN curl -sSL https://getcomposer.org/installer | php \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN a2enmod rewrite expires \
    \
    && echo "xdebug.mode=debug" | tee -a /etc/php/7.4/mods-available/xdebug.ini \
    && echo "xdebug.client_port=9000" | tee -a /etc/php/7.4/mods-available/xdebug.ini \
    && phpenmod -s apache2 xdebug \
    \
    && echo 'ServerName localhost' | tee -a /etc/apache2/conf-available/vscodedevimages-servername.conf \
    && a2enconf vscodedevimages-servername
