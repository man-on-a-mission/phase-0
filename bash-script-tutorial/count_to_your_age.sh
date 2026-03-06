#!/bin/bash

echo "How old are you?: \c"
read my_age

counter=1

while [ $counter -le $my_age ]; do
  
  if [ $counter -lt $my_age ]; then
   echo "$counter"
  elif [ $counter -eq $my_age -a $counter -eq 1 ]; then
    echo "You are $my_age year old !!!🎉"
  elif [ $counter -eq $my_age -a $counter -gt 1 ]; then
    echo "You are $my_age years old !!! 🎉"
  else
    :  
  fi

  (( counter +=1))

done
