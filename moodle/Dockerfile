FROM php:7.2.14-apache

# install required packages to support the php modules
RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt1-dev \
    git \
    vim \
    wget \
    lynx \
    psmisc \
    unzip \
    libpq-dev \
	  libcurl4-openssl-dev \
  	dos2unix \
  && apt-get clean

 RUN  pecl install xdebug-2.6.1 \
      && docker-php-ext-enable xdebug

#build and install php modules
RUN docker-php-ext-configure \
    xmlrpc \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
  docker-php-ext-install \
    pgsql \
    gd \
    intl \
    pdo_mysql \
    zip \
    opcache \
    soap ;

# set web root path
 RUN sed -ri -e 's!/var/www/html!/var/www/moodle!g' /etc/apache2/sites-available/*.conf
 RUN sed -ri -e 's!/var/www/!/var/www/moodle!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# set the php ini
ADD php.ini /usr/local/etc/php/conf.d/moodle.ini

# clear the access log
RUN set -ex \
  && . "$APACHE_ENVVARS" \
	&& rm "$APACHE_LOG_DIR/access.log" \
  && ls -ltrha "$APACHE_LOG_DIR"

# add the start script (and ensure line endings)
ADD start.sh /start.sh
RUN dos2unix /start.sh

#get moodle and unpack, add the config.php
RUN wget https://download.moodle.org/download.php/direct/stable36/moodle-3.6.2.zip --directory-prefix=/var/www/; \
    unzip  /var/www/moodle-3.6.2.zip -d /var/www/;
ADD config.php /var/www/moodle
CMD ["/start.sh"]
