<?php
print "<pre>";
print rand();
print "\n";
print file_get_contents("/var/run/nginxphpfpm/order.txt");
