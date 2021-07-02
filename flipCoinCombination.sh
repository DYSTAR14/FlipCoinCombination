#!/bin/bash -x
headWins=0
tailWins=0
count=0
declare -A singlet
coinstore=1
while [[ $count -lt 20 ]]
do
	coin=$((RANDOM%2))
	count=$(($count+1))
	if [ $coin -eq 0 ]
	then
		headWins=$((headWins+1))
		singlet[$((coinstore++))]="Head"
	else
		tailWins=$((tailWins+1))
		singlet[$((coinstore++))]="Tail"
	fi
done
echo ${!singlet[@]}
echo ${singlet[@]}
headPercent=`echo " scale=2; ($headWins/20)*100" | bc`
tailPercent=`echo " scale=2; ($tailWins/20)*100" | bc`
echo Heads : $headWins Heads Percentage : $headPercent
echo Tails : $tailWins Tails Percentage : $tailPercent

