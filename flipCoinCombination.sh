#!/bin/bash -x
hh_Wins=0
ht_Wins=0
th_Wins=0
tt_Wins=0
count=0
declare -A doublet
coinstore=1
while [[ $count -lt 20 ]]
do
	doubCoins=""
	count=$(($count+1))
	for ((i=1;i<=2;i++))
	do
		coin=$((RANDOM%2))
		if [ $coin -eq 0 ];then
			headWins=$((headWins+1))
			doubCoins="${doubCoins}""H"
		elif [ $coin -eq 1 ];then
			tailWins=$((tailWins+1))
			doubCoins="${doubCoins}""T"
		fi
	done
	doublet[$((coinstore++))]=$doubCoins
	if [ "$doubCoins" = "HH" ];then
		hh_Wins=$(($hh_Wins+1))
	elif [ "$doubCoins" = "HT" ];then
		ht_Wins=$(($ht_Wins+1))
	elif [ "$doubCoins" = "TH" ];then
		th_Wins=$(($th_Wins+1))
	elif [ "$doubCoins" = "TT" ];then
		tt_Wins=$(($tt_Wins+1))
	fi
done
hh_Percent=`echo " scale=2; ($hh_Wins/20)*100" | bc`
ht_Percent=`echo " scale=2; ($ht_Wins/20)*100" | bc`
th_Percent=`echo " scale=2; ($th_Wins/20)*100" | bc`
tt_Percent=`echo " scale=2; ($tt_Wins/20)*100" | bc`
doublet[hh_Percent]=$hh_Percent
doublet[ht_Percent]=$ht_Percent
doublet[th_Percent]=$th_Percent
doublet[tt_Percent]=$tt_Percent
echo ${!doublet[@]}
echo ${doublet[@]}
echo HH : $hh_Wins and Percentage : ${doublet[hh_Percent]}
echo HT : $ht_Wins and Percentage : ${doublet[ht_Percent]}
echo TH : $th_Wins and Percentage : ${doublet[th_Percent]}
echo TT : $tt_Wins and Percentage : ${doublet[tt_Percent]}

