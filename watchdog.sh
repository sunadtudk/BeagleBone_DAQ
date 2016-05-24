#!/bin/sh
app='perl /home/ubuntu/serial_log.pl'
if [ ! "$(pidof $app)" ]
then
#/usr/bin/killall -HUP perl
#/etc/logrotate.d# logrotate --force serial
/usr/sbin/ntpdate 130.226.56.67 >> /var/www/lastdate.txt &
perl /home/ubuntu/serial_log.pl >> /var/www/beaglebone.txt &
fi
