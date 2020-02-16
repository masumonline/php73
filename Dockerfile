FROM php:7.3-fpm
RUN apt-get update
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install -j$(nproc) iconv
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install exif
RUN pecl install redis-5.1.1 \
    && pecl install xdebug-2.8.1 \
    && docker-php-ext-enable redis xdebug