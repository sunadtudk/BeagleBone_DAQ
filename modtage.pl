#!/usr/bin/perl -w
use Device::SerialPort;

my $port_n ="/dev/ttyO1";
my $port_obj = new Device::SerialPort ($port_n) || die " Can't open $port_n $!";
#Serial port Parameters
my $buffer = 8192;
$baud_rate=19200;
$port_obj->databits(8);
$port_obj->handshake("none");
$port_obj->baudrate($baud_rate);
$port_obj->parity("none");
$port_obj->stopbits(1);
$port_obj->buffers($buffer,$buffer);
###############DB######################
while(1){
select(undef,undef,undef,0.45);### Wait tiden...
$data_read=$port_obj->read($buffer);  #(110);
print "$data_read\n";
}

