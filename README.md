# BeagleBone_DAQ
Project Website : http://deadmeat.dk/co2nsl/

The code from my Master Project done @ DTU 2012.

Abstract	
The following report will describe the development of a computer system, and act as the 
final exams project for Sune Andersen prepared at Informatics Mathematical Modelling, 
the Technical University of Denmark acquiring the candidate degree in computer engineering. 
The project lasts 26 weeks, which must cover analyses, design, implementation and documentation 
of the project. Risø National Laboratory is getting more and more requests from The danish government 
on how to save energy. One of the main issue is saving money on power,special when it comes to streetlight. 
Before the end of the year 2012,1500 street lamps around Copenhagen will be changed for light 
sources with low power consumption. Technical and Environmental turn down the energy as a part 
of Copenhagen goal of reducing the citys CO2 emissions by 20 percent by the end of year 2015. 
But how much power will the new lamps comsume? And can a street lamp produce sufficient power 
even in Denmark?. Here will a low cost & lowpower Datalogger come handy. 
The data logger is an electronic device that records earthquakes(Sensor network), 
Wind ,daylight ,power used/produced on the street lamp over time. 
Data will then be uploaded via a wireless radio MESH network(868 Mhz) to a database server for later analyze. 
The Prototype is developed on two microcontrollers(AVR and ARM Cortex-A8) 
with the low power and with fault tolerant in mind, equipped with extra storage for 
offline catching(like a uSD(16/32Gb)).
The ARM CortexA8-board is running a full version of Ubuntu(OMAP), with Apache-webserver,PHP and MySQL-database 
for local catching of data, in case of the network is offline. 
Data will then be sync with the database server then there is connectivity. 
Controlling the Datalogger device can be done from the control centers webinterface 
or on the device it self(via Web or SSH). The device can even be used for other purposes 
like a (MESH) WIFI net, something like freifunk in Berlin & WNDW. 
In a catastrophe area the lamp-network will still be running (because it is off-grid), 
even when the infrastructure is destroyed or very heavy loaded.

#Type	Master's thesis [Academic thesis]
#Year	2012
#Publisher	Technical University of Denmark, DTU Informatics, E-mail: reception@imm.dtu.dk

More info : http://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6410
