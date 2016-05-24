### BEGIN INIT INFO
# Provides:          set_porte.sh
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO

#!/bin/sh
# Port setup.
#
echo 7 > /sys/kernel/debug/omap_mux/gpmc_ad0
echo "32" > /sys/class/gpio/export
#
echo 7 > /sys/kernel/debug/omap_mux/gpmc_ad1
echo "33" > /sys/class/gpio/export
#
# Skal en input!! Ikke 7..
echo 7 > /sys/kernel/debug/omap_mux/gpmc_ad2
echo "34" > /sys/class/gpio/export
#
echo 7 > /sys/kernel/debug/omap_mux/gpmc_ad3
echo "35" > /sys/class/gpio/export
#
echo 7 > /sys/kernel/debug/omap_mux/gpmc_ad4
echo "36" > /sys/class/gpio/export
# Init af porte.. set alle til lav (LOW) - HIGH = alle 3.3volt paa.
# in /out er retning paa data.
echo "high" > /sys/class/gpio/gpio32/direction
echo "low" > /sys/class/gpio/gpio32/direction
echo "low" > /sys/class/gpio/gpio33/direction
echo "low" > /sys/class/gpio/gpio34/direction
echo "in" > /sys/class/gpio/gpio34/direction
echo "low" > /sys/class/gpio/gpio35/direction
echo "low" > /sys/class/gpio/gpio36/direction
echo "in" > /sys/class/gpio/gpio36/direction
echo "high" > /sys/class/gpio/gpio32/direction


echo 20 > /sys/kernel/debug/omap_mux/uart0_rxd
echo 0 > /sys/kernel/debug/omap_mux/uart0_txd

echo 20 > /sys/kernel/debug/omap_mux/uart1_rxd
echo 0 > /sys/kernel/debug/omap_mux/uart1_txd


#start  paa at lytte  paa serial. #/etc/init.d/serialrestart.sh

#kalder watchdog!
#/etc/cron.hourly/watchdog.sh
/usr/sbin/ntpdate 130.226.56.67 >> /var/www/lastdate.txt &
perl /home/ubuntu/serial_log.pl >> /var/www/beaglebone.txt &

