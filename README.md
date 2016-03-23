# auto_alpine_php7_fpm_nginx_all_default
autobuild [ alpine + php7-fpm + nginx ] with default config.

# TODO

make a fun script to start m container to run fpm, n container to run nginx

  start_app.sh --nginx=2 --fpm=4 -v /htdocs/:/htdocs -v

nginx(1) => \
          \
           \
nginx(...)  fpm (1..m)
           /
          /
         /
nginx(n) =>
