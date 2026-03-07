#!/bin/bash

# This script will add a task in text format to a file. 
# Each new task should be numbered automatically.
# Here we will be able to add, delete, and set tasks as done.

# First we will start with the adding tasks functionality.

TASK_FILE_PATH="./tasks.txt"
TOTAL_LINES=$( cat $TASK_FILE_PATH | wc -l )


add () {
 local task_number=$(( TOTAL_LINES + 1 ))
 
 if [ $TOTAL_LINES -le 1  ]  
 
 then
   echo "$task_number. $1" >> $TASK_FILE_PATH
   echo -n "Your task has been inserted successfully ✅"
 
 else
   echo -ne "\n$task_number. $1" >> $TASK_FILE_PATH
   echo -n "Your task has been inserted successfully ✅"
 fi
 return 0
}

completed () {
  
  if [ $TOTAL_LINES -lt 1  ]
  then

    echo -n "There are no tasks to be checked as completed." 
  
  elif [ $TOTAL_LINES -lt $1 ]
  then

    echo -n "There is no task $1."

  else

    local task=$( sed -n "$1p" $TASK_FILE_PATH )
    sed -i "" "$1s/.*/$task ✅/" $TASK_FILE_PATH
    echo -n "Your task has been updated successfully ✅"
  
  fi
  return 0
}

if declare -f "$1" > /dev/null; then

  function_name=$1
  shift 
  "$function_name" "$@"

else
 echo "'$1' is not a known function name" >&2
 exit 1

fi

