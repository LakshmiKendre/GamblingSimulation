#!/bin/bash

echo "Welcome to the Gambling Simulation"

BET=1
DAY=20
declare -A Array

gamble()
{
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
	echo "Day$day $totalAmount"
done	
if (( $totalAmount > 0 ))
then
	echo Won
else
	echo Lost
fi

}

percentage()
{
	MIN_STAKE=$(( STAKE - $((STAKE*50/100)) ))
	MAX_STAKE=$(( STAKE + $((STAKE*50/100)) ))
}
gamble


