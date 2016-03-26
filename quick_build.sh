docker build -t cmptech/auto_alpine_php7_fpm_nginx_all_default .
docker run --rm -ti cmptech/auto_alpine_php7_fpm_nginx_all_default bash -c "php7 -m && php7 -v"
