#FROM alpine
FROM iron/php

Maintainer Wanjo Chan ( http://github.com/wanjochan/ )

COPY repositories /etc/apk/

RUN apk update && apk upgrade

#php-mbstring \
#php-session \
#php-mysqlnd \

RUN apk --update add \
php-curl \
php-gmp \
php-gd \
php-json \
php-opcache \
php-pdo \
php-pdo_mysql \
php-zlib \
php-dom \
php-xml \
php-fpm \
php

RUN apk add nginx

RUN apk add wget curl bash openssl

#Save Space but will fail the 'apk search'...
#RUN rm -rf /var/cache/apk/*


