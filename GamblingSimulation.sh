#!/bin/bash -x

echo "Welcome to the Gambling Simulation"
STAKE=100
BET=1
cash=$STAKE

if (( $((RANDOM%2))==1 ))
then
	cash=$((cash+BET))
	echo win
else
	cash=$((cash-BET))
	echo loose
fi
