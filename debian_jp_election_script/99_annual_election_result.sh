#!/bin/sh
#
# 2012/08/27 Hideki Yamane <henrich@debian.or.jp>
# pre-announce/start announce/result announce for annual election

if [ -f $script_dir/etc/election.conf ]; then
	. $script_dir/etc/election.conf
fi

cat <<EOM

Debian JP Project 各位

$greeting

会長および監事選挙ですが、投票結果により以下の方が当選されました。
おめでとうございます。


選出された会長は、できるだけすみやかに選出された監事とともに正会員
から副会長 1 名以上、事務局長 1 名を任命し、決定次第 JP private ML
でアナウンスしてください。

また、新理事会を開催し、来年度の活動計画を作成し、決定次第 JP private ML
でアナウンスをしてください。

EOM
