# auto_alpine_php7_fpm_nginx_all_default

autobuild [ alpine + php7-fpm + nginx ] with default config.

<pre>
REPOSITORY                                       TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
cmptech/auto_alpine_php7_fpm_nginx_all_default   latest              d5e2e1c1ae84        3 minutes ago       38.77 MB
</pre>

# Benchmark
Notes: something is wrong, the RPS is too low
<pre>
siege -c 16 -b -t 10S http://127.0.0.1:8800/index.php
** SIEGE 3.0.5
** Preparing 16 concurrent users for battle.
The server is now under siege...
Lifting the server siege...      done.

Transactions:                  15123 hits
Availability:                 100.00 %
Elapsed time:                   9.18 secs
Data transferred:               0.42 MB
Response time:                  0.01 secs
Transaction rate:            1647.39 trans/sec
Throughput:                     0.05 MB/sec
Concurrency:                   11.40
Successful transactions:       15123
Failed transactions:               0
Longest transaction:            0.06
Shortest transaction:           0.00
</pre>
Below is single nginx (not docker) with php5-fpm(not docker)
<pre>
Transactions:                 117587 hits
Availability:                 100.00 %
Elapsed time:                  19.71 secs
Data transferred:               3.30 MB
Response time:                  0.01 secs
Transaction rate:            5965.85 trans/sec
Throughput:                     0.17 MB/sec
Concurrency:                   63.46
Successful transactions:      117587
Failed transactions:               0
Longest transaction:            0.09
Shortest transaction:           0.00
</pre>
# TODO

<pre>
make a fun script to start m container to run fpm, n container to run nginx:

start_app.sh --nginx=2 --fpm=4 -v /htdocs/:/htdocs $tag

nginx(1)=>\
            \
             \
  nginx(...)   fpm (1..m)
             /
            /
           /
nginx(n)=>
</pre>
