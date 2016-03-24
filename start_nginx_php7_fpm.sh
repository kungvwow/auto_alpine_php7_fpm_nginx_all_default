#!/bin/sh

dd=$(cd `dirname $0`; pwd)
echo $dd

dt=`date +%Y%m%d%H%M%S`
echo $dt

tag=cmptech/auto_alpine_php7_fpm_nginx_all_default

#docker run --rm -ti \
#docker run -d \
#-v $dd/var_nginxphpfpm/:/var/run/nginxphpfpm/ \

#-v $dd/php.ini:/etc/php7/conf.d/50-setting.ini \

#sorry, very busy, optimize later :P

docker run -d \
-p 8801:80 \
-p 127.0.0.1:9901:9000 \
-v $dd/php-fpm.conf:/etc/php7/php-fpm.conf \
-v $dd/php.ini:/etc/php7/php.ini \
-v $dd/htdocs:/htdocs \
-v /var/run/dockernginxphpfpm/$dt/:/var/run/nginxphpfpm/ \
-v $dd/nginx.conf:/etc/nginx/nginx.conf \
-v $dd/my_init.sh:/my_init.sh \
$tag sh /my_init.sh

sleep 1
docker run -d \
-p 8802:80 \
-p 127.0.0.1:9902:9000 \
-v $dd/php-fpm.conf:/etc/php7/php-fpm.conf \
-v $dd/php.ini:/etc/php7/php.ini \
-v $dd/htdocs:/htdocs \
-v /var/run/dockernginxphpfpm/$dt/:/var/run/nginxphpfpm/ \
-v $dd/nginx.conf:/etc/nginx/nginx.conf \
-v $dd/my_init.sh:/my_init.sh \
$tag sh /my_init.sh

sleep 1
docker run -d \
-p 8803:80 \
-p 127.0.0.1:9903:9000 \
-v $dd/php-fpm.conf:/etc/php7/php-fpm.conf \
-v $dd/php.ini:/etc/php7/php.ini \
-v $dd/htdocs:/htdocs \
-v /var/run/dockernginxphpfpm/$dt/:/var/run/nginxphpfpm/ \
-v $dd/nginx.conf:/etc/nginx/nginx.conf \
-v $dd/my_init.sh:/my_init.sh \
$tag sh /my_init.sh

docker ps

exit

#nginx (local not docker) balancing reference:
#nginx.conf:
upstream innerdockers{
    server 127.0.0.1:8801;
    server 127.0.0.1:8802;
    server 127.0.0.1:8803;
}
upstream fpminnerdockers{
    server 127.0.0.1:9901;
    server 127.0.0.1:9902;
    server 127.0.0.1:9903;
}

#site:
server {
        listen 8800;
        location / {
                proxy_http_version 1.1;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_ignore_client_abort on;
                proxy_connect_timeout 90;
                proxy_send_timeout 90; proxy_read_timeout 90;
                proxy_next_upstream error timeout invalid_header http_500 http_503 http_404;
                proxy_set_header Accept-Encoding '';
                proxy_set_header Host $host;
                proxy_pass http://innerdockers;
        }
}

