#!/bin/sh
#
# 2012/08/27 Hideki Yamane <henrich@debian.or.jp>
# pre-announce/start announce/result announce for annual election

 . "$install_dir"/etc/election.conf

cat <<EOM

Debian JP Project 各位

$greeting

ただ今より、会長および監事選挙の投票を行います。
投票期間は、$vote_start 00:00 JST から $vote_end 23:59 JST
の 1 週間です。

投票は debvote を利用して
　会長選挙は leader$year@$vote_list
　監事選挙は auditor$year@$vote_list
へ、それぞれ GPG 署名メールを送る方法により行ないます。

投票用紙は <$vote_admin> から投票案内があります。


---------------------------------------------------------------------------
選挙スケジュール
---------------------------------------------------------------------------

$vote_start 00:00 JST
| 投票開始 (<$vote_admin> から投票案内があります）
|
$vote_end 23:59 JST
| 投票終了
|
$vote_result
| 開票、新理事会開催へ


---------------------------------------------------------------------------
当選の基準について
---------------------------------------------------------------------------

当選の基準は、現行の会則にある総会の成立基準および総会での決議事項
の基準 (第 12 条 8 および 9) に従い、各候補者につき
"Further Discussion" の選択肢に対する優先順位の割合、つまり

Choice #1: 候補者 A
...
is prefered to Choice #5: Further Discussion (N1-N2)

の N1 が「(正会員総数 * 1/3) の過半数 (= `expr $number_of_members / 3`名)」を超えているかどうか
によって決定します。

(N2 > N1 の場合には "Further Discussion" の選択肢より優先されると
3いう条件を満たさないので対象外となります)


EOM

