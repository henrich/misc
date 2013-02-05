#
# Regular cron jobs for the debian-jp-scripts package
#
0 4	* * *	root	[ -x /usr/bin/debian-jp-scripts_maintenance ] && /usr/bin/debian-jp-scripts_maintenance
