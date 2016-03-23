# auto_alpine_php7_fpm_nginx_all_default

autobuild [ alpine + php7-fpm + nginx ] with default config.

<pre>
REPOSITORY                                       TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
cmptech/auto_alpine_php7_fpm_nginx_all_default   latest              ba04b8c3ffb5        10 days ago         34.14 MB
</pre>

# TODO

<pre>
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
</pre>
