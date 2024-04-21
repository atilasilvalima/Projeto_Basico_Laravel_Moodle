FROM php:8.1.2-fpm-alpine

RUN apk add --no-cache openssl bash nodejs npm postgresql-dev

RUN docker-php-ext-install bcmath pdo mysqli pdo_mysql pdo_pgsql

WORKDIR /var/www

RUN rm -rf /var/www/html
RUN ln -s public html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www

EXPOSE 9000

ENTRYPOINT [ "php-fpm" ]
