FROM php:8.2-fpm-alpine

RUN apk upgrade --no-cache && \
    apk add --no-cache icu-dev libzip-dev zip unzip libpng && \
    docker-php-ext-install pdo_mysql mysqli intl zip mongodb php8-xdebug && \
    pecl install swoole && \
    docker-php-ext-enable swoole

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
