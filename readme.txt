Beaglebone Setup og installation. (kilde : http://elinux.org/BeagleBoardUbuntu)

Man henter Ubuntu fra : http://rcn-ee.net/deb/rootfs/oneiric/
På en Linux maskine skriver man så: (xx er version)

tar xJf ubuntu-11.10-rxx-minimal-armel.tar.xz
cd ubuntu-11.10-rxx-minimal-armel
./setup_sdcard.sh --mmc /dev/sdX --uboot "bone"

Den vil nu skrive Ubuntu til SD-kortet som sidder på  /dev/sdX
-Udskift sdX der hvor SD-kortet er mountede.

Bemærk! Ubuntu bruger apt-get til at styre pakker.
For at projektet kører skal bruges PERL , APACHE2, MySQL

#dpkg -l | awk '/^[hi]i/{print $2}' | xargs > liste-apt.txt

På det nye kort skrev jeg så:(efter det er installeret og bootede op)
# cat liste-apt.txt | xargs apt-get install -y


Da Beaglebone ikke har så meget plads og ikke har nogle skærm kører
dette lille “rydop” script via cron.weekly :

sudo dpkg --configure -a && sudo apt-get check -y && sudo apt-get autoremove -y --force-yes && sudo apt-get clean -y --force-yes && sudo rm -rf $HOME/.local/share/Trash/files && sudo rm -rf ~/.evolution/mail/local/folders.db && sudo find ~/.thumbnails -type f -exec rm {} \; && sudo rm -rf /var/log/*.gz && sudo updatedb && sudo apt-get update -y && sudo apt-get upgrade -y --force-yes 

##############################################
Install: http://www.howtoforge.com/ubuntu_lamp_for_newbies

sudo apt-get install apache2
sudo apt-get install apache2
 apache2-mpm-prefork

sudo apt-get install apache2-utils

sudo apt-get install apache2.2-bin

sudo apt-get install apache2.2-common 
sudo apt-get install php5
sudo apt-get install libapache2-mod-php5
sodu apt-get install php5-mysql
sudo apt-get install perl 

sudo apt-get install perl-base 

sudo apt-get install perl-modules
 
sudo apt-get install 
php5-cli
 
sudo apt-get install php5-common 
sudo apt-get install 
php5-mysql 
sudo apt-get install munin-common

sudo apt-get install munin-node

sudo apt-get install munin-plugins-extra
sudo apt-get install libapache2-mod-auth-mysql

sudo /etc/init.d/apache2 restart

Online files : /var/www/

Tiden : ntpdate 130.226.56.67
sudo /etc/init.d/apache2 restart

#####Start script ved genstart########
sudo chmod +x /etc/init.d/set_porte.sh
sudo update-rc.d set_porte.sh defaults
########Alle kald fra webinterfacet###############

Doing Root stuff from Webserver.
sudo visudo
Skriv:

#includedir /etc/sudoers.d
%admin  ALL=(ALL) ALL
www-data ALL=NOPASSWD: ALL
#kommando www-data ALL=NOPASSWD: /usr/bin/last

##################DATABASE########################
Database :  (NOT in use!!!/ bruges IKKE!!!)
mysql -u root
mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('yourpassword');

CREATE DATABASE beaglebone;
drop table `beaglebone`.`test`;
use beaglebone
CREATE TABLE test (Telitnr INT,Netnr INT,BBT INT,T INT,A INT,B INT,C INT,D INT,E INT,F INT,G INT,H INT,I INT,J INT,K INT,L INT);
CREATE TABLE board (BoardSN INT,CPU INT,BBT INT,T INT,A INT,B INT,C INT,D INT,E INT,F INT,G INT,H INT,I INT,J INT,K INT,L INT);
GRANT ALL PRIVILEGES ON *.* TO 'fotonik'@'localhost' IDENTIFIED BY 'fotonik' WITH GRANT OPTION;
GRANT ALL ON test.* TO fotonik@'192.168.1.1' IDENTIFIED BY 'fotonik';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON test.* TO 'fotonik'@'localhost' IDENTIFIED BY 'fotonik';
GRANT ALL PRIVILEGES ON *.* TO 'fotonik'@'192.168.1.6' IDENTIFIED BY 'fotonik' WITH GRANT OPTION;