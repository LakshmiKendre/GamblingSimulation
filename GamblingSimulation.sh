#!/bin/bash

echo "Welcome to the Gambling Simulation"
STAKE=100
BET=1
cash=$STAKE

gamble()
{
percentage
while(( cash > MIN_STAKE && cash < MAX_STAKE ))
do
	if (( $((RANDOM%2))==1 ))
	then
		cash=$((cash+BET))
		echo -e "Win \n cash= $cash"
	else
		cash=$((cash-BET))
		echo -e "Loose \n cash= $cash"
	fi
done
}

percentage()
{
	MIN_STAKE=$(( STAKE - $((STAKE*50/100)) ))
	MAX_STAKE=$(( STAKE + $((STAKE*50/100)) ))
}
gamble
