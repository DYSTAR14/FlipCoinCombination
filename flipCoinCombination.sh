#!/bin/bash -x
hhh_Wins=0
hht_Wins=0
hth_Wins=0
thh_Wins=0
htt_Wins=0
tht_Wins=0
tth_Wins=0
ttt_Wins=0
count=0
declare -A doublet
coinstore=1
while [[ $count -lt 20 ]]
do
	doubCoins=""
	count=$(($count+1))
	for ((i=1;i<=3;i++))
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
	if [ "$doubCoins" = "HHH" ];then
		hhh_Wins=$(($hhh_Wins+1))
	elif [ "$doubCoins" = "HHT" ];then
		hht_Wins=$(($hht_Wins+1))
	elif [ "$doubCoins" = "HTH" ];then
		hth_Wins=$(($hth_Wins+1))
	elif [ "$doubCoins" = "THH" ];then
		thh_Wins=$(($thh_Wins+1))
	elif [ "$doubCoins" = "HTT" ];then
      htt_Wins=$(($htt_Wins+1))
   elif [ "$doubCoins" = "THT" ];then
      tht_Wins=$(($tht_Wins+1))
   elif [ "$doubCoins" = "TTH" ];then
      tth_Wins=$(($tth_Wins+1))
   elif [ "$doubCoins" = "TTT" ];then
      ttt_Wins=$(($ttt_Wins+1))
	fi
done
hhh_Percent=`echo " scale=2; ($hhh_Wins/20)*100" | bc`
hht_Percent=`echo " scale=2; ($hht_Wins/20)*100" | bc`
hth_Percent=`echo " scale=2; ($hth_Wins/20)*100" | bc`
thh_Percent=`echo " scale=2; ($thh_Wins/20)*100" | bc`
htt_Percent=`echo " scale=2; ($htt_Wins/20)*100" | bc`
tht_Percent=`echo " scale=2; ($tht_Wins/20)*100" | bc`
tth_Percent=`echo " scale=2; ($tth_Wins/20)*100" | bc`
ttt_Percent=`echo " scale=2; ($ttt_Wins/20)*100" | bc`
doublet[hhh_Percent]=$hhh_Percent
doublet[hht_Percent]=$hht_Percent
doublet[hth_Percent]=$hth_Percent
doublet[thh_Percent]=$thh_Percent
doublet[htt_Percent]=$htt_Percent
doublet[tht_Percent]=$tht_Percent
doublet[tth_Percent]=$tth_Percent
doublet[ttt_Percent]=$ttt_Percent
echo ${!doublet[@]}
echo ${doublet[@]}
echo HHH : $hhh_Wins and Percentage : ${doublet[hhh_Percent]}
echo HHT : $hht_Wins and Percentage : ${doublet[hht_Percent]}
echo HTH : $hth_Wins and Percentage : ${doublet[hth_Percent]}
echo THH : $thh_Wins and Percentage : ${doublet[thh_Percent]}
echo HTT : $htt_Wins and Percentage : ${doublet[htt_Percent]}
echo THT : $tht_Wins and Percentage : ${doublet[tht_Percent]}
echo TTH : $tth_Wins and Percentage : ${doublet[tth_Percent]}
echo TTT : $ttt_Wins and Percentage : ${doublet[ttt_Percent]}
