#!/bin/sh

dd=$(cd `dirname $0`; pwd)
echo $dd

dt=`date +%Y%m%d%H%M%S`
echo $dt

tag=cmptech/auto_alpine_php7_fpm_nginx_all_default

#docker run --rm -ti \

docker run -d \
-p 888:80 \
-v $dd/php.ini:/etc/php7/conf.d/50-setting.ini \
-v $dd/php-fpm.conf:/etc/php7/php-fpm.conf \
-v $dd/htdocs:/htdocs \
-v $dd/nginx.conf:/etc/nginx/nginx.conf \
-v $dd/my_init.sh:/my_init.sh \
$tag sh /my_init.sh

