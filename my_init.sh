
order=id$1
echo $order > /var/run/nginxphpfpm/order.txt

adduser -g "" -G nginx -D www-data

#adduser --disabled-password --disabled-login --gecos "" --group "nginx" www-data
#addgroup nginx www-data

/usr/sbin/nginx
/usr/sbin/php-fpm7 -F
