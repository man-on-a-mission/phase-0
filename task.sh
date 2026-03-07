#!/bin/bash

# This script will add a task in text format to a file. 
# Each new task should be numbered automatically.
# Here we will be able to add, delete, and set tasks as done.

# First we will start with the adding tasks functionality.

TASK_FILE_PATH="/Users/cjnapoleao.dev/dev/phase-0/tasks.txt"

add () {
 local total_lines=$( cat $TASK_FILE_PATH | wc -l )
 local task_number=$(( total_lines + 1 ))
 
 echo $total_lines
 echo $task_number
 
 if [ $total_lines -le 1  ]  
 
 then
   printf "$task_number. $1" >> $TASK_FILE_PATH
   printf "Your task has been inserted successfully ✅"
 else
   printf "\n$task_number. $1" >> $TASK_FILE_PATH
   printf "Your task has been inserted successfully ✅"
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

