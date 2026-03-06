#!/bin/bash

echo "Enter your first number: \c"
read number_1

echo "Now, enter your second number: \c"
read number_2

echo "Great!!! Now, let me see..."

if [ $number_1 -gt $number_2 ]; then
  echo "$number_1 is greater than $number_2."
elif [ $number_1 -lt $number_2 ]; then
  echo "$number_2 is greater than $number_1."
else
  echo "It seems like you are dealing with Equal numbers. 😂"
fi

