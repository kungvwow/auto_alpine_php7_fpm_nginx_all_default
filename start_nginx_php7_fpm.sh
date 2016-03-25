#!/bin/sh

dd=$(cd `dirname $0`; pwd)
echo $dd

dt=`date +%Y%m%d%H%M%S`
echo $dt

tag=cmptech/auto_alpine_php7_fpm_nginx_all_default

#TODO getopts for how many container to start
#assume the first param is htdocs...
if [ x$1 != x ]
then
htdocs=$1
else
htdocs=$dd/htdocs
fi
echo $htdocs

i=1
amax=3

while [ $i -le $amax ]
do
nginxport=`expr $i + 8800`
fpmport=`expr $i + 9000`
	docker run -d \
	-p 127.0.0.1:$nginxport:80 \
	-p 127.0.0.1:$fpmport:9000 \
	-v $dd/php-fpm.conf:/etc/php7/php-fpm.conf \
	-v $dd/php.ini:/etc/php7/php.ini \
	-v $htdocs:/htdocs \
	-v /var/run/dockernginxphpfpm/$dt-$i/:/var/run/nginxphpfpm/ \
	-v $dd/nginx.conf:/etc/nginx/nginx.conf \
	-v $dd/my_init.sh:/my_init.sh \
	$tag sh /my_init.sh $i
	sleep 1
	i=`expr $i + 1`
done
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

