#!/bin/bash

#CONFIG
#=======#
#ID SERVER
server_id=`hostname`;

#MYSQL
sql_user='';
sql_pass='';
sql_host='';
sql_table='';

#UPDATE SERVER

mem_total=`cat /proc/meminfo | grep -ohe 'MemTotal[s:][: ].*' | awk '{ print $2 }'`;
nb_cpu=`grep processor /proc/cpuinfo | wc -l`;




while true; do
	sleep 1

	unix_time=`date +'%s'`;

	#CPU
	###################################
	load=`uptime | grep -ohe 'load average[s:][: ].*' | awk '{ print $3 }'`;
	load=${load:0:-1};
  cpu_pc=`ps -A -o %cpu | awk '{s+=$1} END {print s "%"}'`;
	
	echo "INSERT INTO cpu (id,date,load_av,cpu_0) VALUES  ('$server_id', '$unix_time', '$load','$cpu_pc');" | mysql -h$sql_host -u$sql_user -p$sql_pass $sql_table;
	
	
	# MEM
	#######################################
	
	#mem_free=`cat /proc/meminfo | grep -ohe 'MemFree[s:][: ].*' | awk '{ print $2 }'`;
	#mem_available=`cat /proc/meminfo | grep -ohe 'MemAvailable[s:][: ].*' | awk '{ print $2 }'`;
	#mem_active=`cat /proc/meminfo | grep -ohe 'Active[s:][: ].*' | awk '{ print $2 }'`;
	#mem_inactive=`cat /proc/meminfo | grep -ohe 'Inactive[s:][: ].*' | awk '{ print $2 }'`;
	#swap_total=`cat /proc/meminfo | grep -ohe 'SwapTotal[s:][: ].*' | awk '{ print $2 }'`;
	#swap_free=`cat /proc/meminfo | grep -ohe 'MemFree[s:][: ].*' | awk '{ print $2 }'`;
	
	#echo "INSERT INTO mem (id, date, mem_total, mem_free, mem_avaible, mem_active, mem_inactive, swap_total, swap_free) VALUES  ('$server_id','$unix_time','$mem_total', '$mem_free', '$mem_available', '$mem_active', '$mem_inactive', '$swap_total', '$swap_free');" | mysql -h$sql_host -u$sql_user -p$sql_pass $sql_table;
	
	#echo "mysql -h$sql_host -u$sql_user -p$sql_pass $table;";
	# NET
	########################################




	# HDD
	##################################



done
