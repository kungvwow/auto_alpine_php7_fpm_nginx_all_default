tag=cmptech/auto_iron_php56_fpm_nginx_all_default
docker build -t $tag .
docker run --rm -ti $tag bash -c "php -m && php -v"
