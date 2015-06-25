#!/bin/bash

log_check () {
# doesn't take any arguments, just checks to make sure that logging is going to work, or its off. 
	if [ "$logging" = "on" ]; then
		[ -d "$log_file" ] || echo "error: log directory \"$log_file\" (log files) not found, quiting"; break
		[ -d "$error_file" ] || echo "error: log directory \"$error_file\" (error files) not found, quiting"; break
	elif [ -z "$logging" ]; then
		echo "ok... no logging then"
	else
		echo "error: \$logging is set to \"$logging\" which is not valid, quiting"
		break
	fi
}

post_to_error () {
	[ "$logging" = "on" ] &&  echo "[$(date)]: $1" >> "$log_file/latest_sauce_$(date +%e_%m_%Y)"
	[ -z "$logging" ] &&  echo "[$(date)]: $1"
}

post_to_log () {
	[ "$logging" = "on" ] && echo "[$(date)]: $1" >> "$error_file/latest_sauce_err_$(date +%e_%m_%Y)"
	[ -z "$logging" ] &&  echo "[$(date)]: $1"
}
