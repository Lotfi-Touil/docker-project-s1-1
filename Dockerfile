FROM php:8.0.3-fpm-alpine3.12

LABEL maintainer="Touil Lotfi"

WORKDIR /var/www/html

RUN docker-php-ext-install mysqli pdo pdo_mysql 

RUN docker-php-ext-enable pdo_mysql

RUN apk add libzip-dev

RUN apk add --update nodejs npm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
