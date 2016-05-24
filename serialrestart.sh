#!/bin/sh
/usr/bin/killall -HUP perl
/usr/sbin/ntpdate 130.226.56.67 >> /var/www/lastdate.txt &
perl /home/ubuntu/serial_ny.pl >> /var/www/beaglebone.txt &
