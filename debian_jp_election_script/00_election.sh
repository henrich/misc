#!/bin/sh
#
# 2013/02/04 Hideki Yamane <henrich@debian.or.jp>
# pre-announce/start announce/result announce for annual election

set -e


if [ -f $script_dir/etc/election.conf ]; then
	. $script_dir/etc/election.conf
else
	echo "Please check whether election.conf exists"
fi

if [ ! $year = `date +%Y` ]; then
	echo "Please adjust election.conf for annual election"
fi

# exec and send mail each 2 days before
case `date +%F --date 2day` in
	$pre_announce)
	  $script_dir/01_annual_election_pre_announce.sh
	  ;;
	$stand_start)
	  $script_dir/02_annual_election_request.sh
	  ;;
	$vote_start)
	  $script_dir/03_annual_election_start.sh
	  ;;
	$recommendation_start)
	  $script_dir/04_annual_election_no_candidate.sh
	  ;;
	$vote_result)
	  $script_dir/99_annual_election_result.sh
	  ;;
	*)
	  ;;
esac
