#!/bin/bash

echo "Please enter the number to calculate factorial"

read factorial
output=1
while [ $factorial -gt 0 ]
do 
	output=$(($output * $factorial))
	factorial=$(($factorial - 1))
done

echo $output