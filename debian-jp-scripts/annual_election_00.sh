#!/bin/sh
#
# 2013/02/04 Hideki Yamane <henrich@debian.or.jp>
# pre-announce/start announce/result announce for annual election

set -e

install_dir="/usr/local/"

if [ -f "$install_dir"/etc/election.conf ]; then
	"$install_dir"/etc/election.conf
else
	echo "Please check whether election.conf exists"
fi

if [ ! $year = `date +%Y` ]; then
	echo "Please adjust election.conf for annual election"
fi

# exec and send mail each 2 days before
case `date +%F --date 2day` in
	"$pre_announce")
	  annual_election_01_pre_announce.sh
	  ;;
	"$stand_start")
	  02_annual_election_02_request.sh
	  ;;
	"$vote_start")
	  03_annual_election_03_start.sh
	  ;;
	"$recommendation_start")
	  04_annual_election_04_no_candidate.sh
	  ;;
	"$vote_result")
	  99_annual_election_05_result.sh
	  ;;
	*)
	  ;;
esac
