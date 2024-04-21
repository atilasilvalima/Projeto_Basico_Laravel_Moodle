FROM php:8.2-apache

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

RUN apt-get update

RUN apt-get install && apt-get install -y libpq-dev

RUN apt-get install -y zlib1g-dev libzip-dev libpng-dev libicu-dev
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libgd-dev

RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo pdo_pgsql pgsql pdo_mysql mysqli

