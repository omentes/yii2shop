FROM php:7.2-apache


WORKDIR /var/www/html

# Install required packages and PHP modules
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install --fix-missing apt-utils build-essential git curl libcurl3 libcurl3-dev zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install xdebug
#RUN pecl install xdebug-2.5.0
#RUN docker-php-ext-enable xdebug

# Other PHP7 Extensions

RUN apt-get -y install libmcrypt-dev

RUN apt-get -y install libsqlite3-dev libsqlite3-0 mysql-client
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-install mysqli

RUN docker-php-ext-install curl
RUN docker-php-ext-install tokenizer
RUN docker-php-ext-install json

RUN apt-get -y install zlib1g-dev
RUN docker-php-ext-install zip

RUN apt-get -y install libicu-dev
RUN apt-get -y install sendmail
RUN docker-php-ext-install -j$(nproc) intl

RUN docker-php-ext-install mbstring

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

RUN apt-get -y install wget

# Install phpunit
RUN wget https://phar.phpunit.de/phpunit-6.0.phar && \
        chmod +x phpunit-6.0.phar && \
        mv phpunit-6.0.phar /usr/local/bin/phpunit


# Install codecept
RUN wget http://codeception.com/codecept.phar && \
        chmod +x codecept.phar && \
        mv codecept.phar /usr/local/bin/codecept
RUN docker-php-ext-install pdo_mysql

RUN a2enmod rewrite
#Update apache2.conf
RUN sed -i 's#DocumentRoot /var/www/html#DocumentRoot /var/www/html/web#' /etc/apache2/apache2.conf

    # Fix write permissions with shared folders
    RUN  usermod -u 1000 www-data

# We first install any composer packages outside of the web root to prevent them
# from being overwritten by the COPY below. If the composer.lock file here didn't
# change, docker will use the cached composer files.
COPY composer.json /var/www/html/
COPY composer.lock /var/www/html/
RUN composer self-update
RUN  composer install

# Finally copy the working dir to the image's web root
COPY . /var/www/html
# Install Postgre PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql