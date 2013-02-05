#
# Regular cron jobs for the debian-jp-scripts package
#
0 18	* * *	root	[ -x /usr/local/bin/annual_election_00.sh ] && "install_dir=/usr/local /usr/local/bin/annual_election_00.sh"
