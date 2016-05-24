#!/usr/bin/perl -w
use Device::SerialPort;
use DBI;
use DBD::mysql;
#use strict;
#use POSIX; 
#use Time::HiRes;
my $port_n ="/dev/ttyO1";
my $port_obj = new Device::SerialPort ($port_n) || die " Can't open $port_n $!";
my $buffer = 8192;
#Serial port Parameters
$baud_rate=19200;
$port_obj->databits(8);
$port_obj->handshake("none");
$port_obj->baudrate($baud_rate);
$port_obj->parity("none");
$port_obj->stopbits(1);
$port_obj->buffers($buffer,$buffer);#(110,110); #(8192,8192);
###############DB######################
# CONFIG VARIABLES
$database = "beaglebone";
#Serveren
$host = "192.168.1.4"; # Server
#$host = "192.168.1.6"; #Beaglebone
$user = "fotonik";
$pw = "fotonik";
# DATA SOURCE NAME
$dsn = "dbi:mysql:$database:$host:3306";
# PERL DBI CONNECT
#$connect = DBI->connect($dsn, $user, $pw); 
###############DB######################
while(1){
$connect = DBI->connect($dsn, $user, $pw);
#$connect ->disconnect();
select(undef,undef,undef,0.80);
$data_read=$port_obj->read($buffer);
#print "$data_read\n";
##################RAW Log############################
open (MYFILE, '>>/var/www/debug.txt');
print MYFILE "$data_read\n";
close (MYFILE); 
#################RAW log#############################


########################Telit styring##################
$Netnr=42;  
$BBT = time;
########################################################

$query = "INSERT INTO test (Telitnr,Netnr,BBT,T,A,B,C,D,E,F,G,H,I,J,K,L) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
$query_handle = $connect->prepare($query);
######################Telit 0D#######Begin##############
if($data_read =~ m/ed0\s+T=(\d+)\s+A=(\d+)\s+B=(\d+)\s+C=(\d+)\s+D=(\d+)\s+E=(\d+)\s+F=(\d+)\s+G=(\d+)\s+H=(\d+)\s+I=(\d+)\s+J=(\d+)\s+K=(\d+)\s+L=(\d+)/) 
{  
    # Format:  T=3420499518  A=914 B=097 C=049 D=436 E=428 F=863 G=34 H=771 I=214 J=493 K=165 L=111
    #($T,$A,$B,$C,$D,$E,$F,$G,$H,$I,$J,$K,$L) = ($1,$2,$3,$4);
    $Telitnr=13; #String 

printf("ed0:%s\n",join(',',($BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)));
    $query_handle->execute($Telitnr,$Netnr,$BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);
}
###############################
#open (MYFILE, '>>/var/www/dataind.txt');
#print MYFILE "("ed0:%s\n",join(',',($BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)));";
#close (MYFILE);
######################Telit 0D#######END###########

######################Telit 0E#######Begin##############
if($data_read =~ m/ee0\s+T=(\d+)\s+A=(\d+)\s+B=(\d+)\s+C=(\d+)\s+D=(\d+)\s+E=(\d+)\s+F=(\d+)\s+G=(\d+)\s+H=(\d+)\s+I=(\d+)\s+J=(\d+)\s+K=(\d+)\s+L=(\d+)/) 
{  
    # Format:  T=3420499518  A=914 B=097 C=049 D=436 E=428 F=863 G=34 H=771 I=214 J=493 K=165 
    #($T,$A,$B,$C,$D,$E,$F,$G,$H,$I,$J,$K) = ($1,$2,$3,$4);
    $Telitnr=14; #String ?

printf("ee0:%s\n",join(',',($BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)));
$query_handle->execute($Telitnr,$Netnr,$BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);

}
######################Telit 0E#######END###########

######################Telit 0F#######Begin##############
if($data_read =~ m/e0f\s+T=(\d+)\s+A=(\d+)\s+B=(\d+)\s+C=(\d+)\s+D=(\d+)\s+E=(\d+)\s+F=(\d+)\s+G=(\d+)\s+H=(\d+)\s+I=(\d+)\s+J=(\d+)\s+K=(\d+)\s+L=(\d+)/)
{
    # Format:  T=3420499518  A=914 B=097 C=049 D=436 E=428 F=863 G=34 H=771 I=214 J=493 K=165 L=111
    #($T,$A,$B,$C,$D,$E,$F,$G,$H,$I,$J,$K,$L) = ($1,$2,$3,$4);
    $Telitnr=15; #String ?
printf("e0f:%s\n",join(',',($BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)));
    $query_handle->execute($Telitnr,$Netnr,$BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);
}

if($data_read =~ m/ef0\s+T=(\d+)\s+A=(\d+)\s+B=(\d+)\s+C=(\d+)\s+D=(\d+)\s+E=(\d+)\s+F=(\d+)\s+G=(\d+)\s+H=(\d+)\s+I=(\d+)\s+J=(\d+)\s+K=(\d+)\s+L=(\d+)/)
{
    # Format:  T=3420499518  A=914 B=097 C=049 D=436 E=428 F=863 G=34 H=771 I=214 J=493 K=165 L=111
    #($T,$A,$B,$C,$D,$E,$F,$G,$H,$I,$J,$K,$L) = ($1,$2,$3,$4);
    $Telitnr=15; #String ?
printf("ef0:%s\n",join(',',($BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)));
    $query_handle->execute($Telitnr,$Netnr,$BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);
}

######################Telit 0F#######END###########

######################Telit 0G#######Begin##############
if($data_read =~ m/e0g\s+T=(\d+)\s+A=(\d+)\s+B=(\d+)\s+C=(\d+)\s+D=(\d+)\s+E=(\d+)\s+F=(\d+)\s+G=(\d+)\s+H=(\d+)\s+I=(\d+)\s+J=(\d+)\s+K=(\d+)\s+L=(\d+)/) 
{  
    # Format:  T=3420499518  A=914 B=097 C=049 D=436 E=428 F=863 G=34 H=771 I=214 J=493 K=165 
    #($T,$A,$B,$C,$D,$E,$F,$G,$H,$I,$J,$K) = ($1,$2,$3,$4);
    $Telitnr=16; #String ?
#    $query_handle->execute($Telitnr,$Netnr,$BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);
printf("e0g:%s\n",join(',',($BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)));
$query_handle->execute($Telitnr,$Netnr,$BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);
}

if($data_read =~ m/eg0\s+T=(\d+)\s+A=(\d+)\s+B=(\d+)\s+C=(\d+)\s+D=(\d+)\s+E=(\d+)\s+F=(\d+)\s+G=(\d+)\s+H=(\d+)\s+I=(\d+)\s+J=(\d+)\s+K=(\d+)\s+L=(\d+)/)
{
    $Telitnr=16; 
printf("eg0:%s\n",join(',',($BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13)));
$query_handle->execute($Telitnr,$Netnr,$BBT,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);

}



######################Telit 0G#######END###########





##############Telit TIME###################
#my $command1 = (pack( "H8","AB650C00"));
#my $command2 = (pack( "H4","6FCD"));
#my @Func = ($command1,time,$command2);
#my $command = join "", @Func;
#print "Perl Functions: $Func\n";
#my $time = (time);
#my $command = ($command1+$time+$command2);
#$port_obj->write($command);
#print "Send = $command\n";
#print "time = $time\n";

$connect ->disconnect();
}

