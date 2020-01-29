#!/bin/bash

echo "Welcome to the Gambling Simulation"

BET=1
DAY=20
declare -A Array

gamble(){
totalAmount=0
for((day=1; day<=DAY; day++))
do
	STAKE=100
	cash=$STAKE
	percentage

	while(( cash > MIN_STAKE && cash < MAX_STAKE ))
	do
		if (( $((RANDOM%2))==1 ))
		then
			cash=$((cash+BET))
		else
			cash=$((cash-BET))
		fi
	done

	Array[$day]=$((cash-STAKE))
	totalAmount=$((totalAmount+${Array[$day]}))
	Array[$day]=$totalAmount
done

echo -e "Luckiest: $(lucky | head -1 ) \nUnluckiest: $(lucky | tail -1 )"	
}

percentage(){
	MIN_STAKE=$(( STAKE - $((STAKE*50/100)) ))
	MAX_STAKE=$(( STAKE + $((STAKE*50/100)) ))
}

lucky(){
    for day in ${!Array[@]}
    do
        echo "Day$day ${Array[$day]}"
    done | sort -rn -k2 
}

gamble

