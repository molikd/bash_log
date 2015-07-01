#!/bin/bash

log_check () {
# doesn't take any arguments, just checks to make sure that logging is going to work, or its off. 
	if [ "$logging" = "on" ]; then
		if [ -d "$log_file" ]; then "error: log directory \"$log_file\" (log files) not found, quiting"; exit; fi
		if [ -d "$error_file" ]; then "error: log directory \"$error_file\" (error files) not found, quiting"; exit; fi; 
	elif [ -z "$logging" ]; then
		echo "ok... no logging then"
	else
		echo "error: \$logging is set to \"$logging\" which is not valid, quiting"
		break
	fi
}

post_to_error () {
	[ "$logging" = "on" ] &&  echo "[$(date)]: $1" >> "$error_file"
	[ -z "$logging" ] &&  echo "[$(date)]: $1"
}

post_to_log () {
	[ "$logging" = "on" ] && echo "[$(date)]: $1" >> "$log_file"
	[ -z "$logging" ] &&  echo "[$(date)]: $1"
}
