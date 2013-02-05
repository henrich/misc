#!/bin/sh
#
# 2013/02/04 Hideki Yamane <henrich@debian.or.jp>
# pre-announce/start announce/result announce for annual election

if [ -f $script_dir/etc/election.conf ]; then
	. $script_dir/etc/election.conf
fi

cat <<EOM

Debian JP Project 各位

$greeting 会長、及び監事選挙についてのご案内です。
「Debian 開発者の会」の現役員の任期が 3 月末をもって満了しますので、
会長および監事の改選を行います。

これまでに投票をされた経験のない方は、http://$vote_list/
の「投票練習・動作確認」で試しておいてください。投票用紙は以下の
ような書式となります。(会長選挙において立候補者が 4 名の場合の例)

-=-=-=-=-=- Don't Delete Anything Between These Lines =-=-=-=-=-=-=-=-
[ ] Choice 1: 候補者 A
[ ] Choice 2: 候補者 B
[ ] Choice 3: 候補者 C
[ ] Choice 4: 候補者 D
[ ] Choice 5: Further Discussion
-=-=-=-=-=- Don't Delete Anything Between These Lines =-=-=-=-=-=-=-=-


Debian JP Project 選挙の方法は、会則に従って行うものとし、その手順は
以下のとおりです。

---------------------------------------------------------------------------
・$date_start 00:00 JST から $stand_end 23:59 JST まで本MLにて立候補者を募ります。
　対象は会長および監事です。

・投票は debvote を利用して leader$year@$vote_list (会長選挙)、
　auditor$year@$vote_list (監事選挙) へ GPG 署名メールを送る方法により行ないます。

・投票用紙は <$vote_admin> から投票案内があります。

・投票期間は、$vote_start 00:00 JST から $vote_end 23:59 JST の 1 週間です。


---------------------------------------------------------------------------
選挙スケジュール
---------------------------------------------------------------------------

$date_start
| 会長/監事 立候補者募集
| (Private ML へ立候補の意志を示すメールを送付)
| Subject: に "[Cadidate] <名前>" と記載すること
| また、会長への立候補か監事への立候補か明示すること
| メールには所信表明を添付してください。
|
$stand_end
| 立候補者終了
| 　＃なお立候補者が足りない場合、推薦を募集(Private ML へ推薦の意志を示すメールを送付)
| 　　この場合Subject: に "[Recommand] <推薦する人の名前>" と記載の上、
|　　 本文へ会長推薦か監事推薦か明示すること
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
