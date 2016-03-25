FROM alpine

Maintainer Wanjo Chan ( http://github.com/wanjochan/ )

COPY repositories /etc/apk/

RUN apk update && apk upgrade

RUN apk --update add \
php7-curl \
php7-gmp \
php7-gd \
php7-json \
php7-mbstring \
php7-opcache \
php7-mysqlnd \
php7-pdo \
php7-pdo_mysql \
php7-session \
php7-xml

#php7-dom

RUN apk add php7-fpm

RUN apk add nginx

RUN apk add wget curl bash openssl

#you will need cli sooner or later
RUN apk add php7

#Save Space but will fail the 'apk search'...
#RUN rm -rf /var/cache/apk/*


