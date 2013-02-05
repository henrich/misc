#!/bin/sh
#
# 2012/08/27 Hideki Yamane <henrich@debian.or.jp>
# pre-announce/start announce/result announce for annual election

if [ -f $script_dir/etc/election.conf ]; then
	. $script_dir/etc/election.conf
fi

# adjust date if candidate exists
if [ $stand_as_candidate = "no|No|NO" ]; then
	exit 0
fi


cat <<EOM

Debian JP Project 各位

$greeting 会長、及び監事選挙についてのご案内です。
残念ながら立候補者無しとなりましたので、正会員からの推薦を募ります。

Private ML へ推薦のメールを送付してください。
- Subject: に "[Recommand] <推薦する人の名前>" と記載すること
- 会長か監事どちらへの推薦か明示すること
- 推薦者は、推薦理由を述べること
- 募集期間: $recommendation_end 23:59 JST まで
- なお、推薦された方は推薦を拒否しても構いません

---------------------------------------------------------------------------
選挙スケジュール
---------------------------------------------------------------------------

$recommendation_end
| 会長/監事 推薦終了
|
$vote_start
| 投票開始
|
$vote_end
| 投票終了
|
$vote_result
| 開票、新理事会開催へ

EOM
