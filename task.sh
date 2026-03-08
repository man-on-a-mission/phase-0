#!/bin/bash

# This script will add a task in text format to a file. 
# Each new task should be numbered automatically.
# Here we will be able to add, delete, list, and set tasks as done.

# First we will start with the adding tasks functionality.

TASK_FILE_PATH="./tasks.txt"

if test -f $TASK_FILE_PATH; then
  :
else
  touch tasks.txt
  echo "Tasks file created successfully ✅"
fi


TOTAL_LINES=$( cat $TASK_FILE_PATH | wc -l )

has_tasks () {
  if [ $TOTAL_LINES -lt 1  ]
  then
    echo "You must create a task first. Try sh task.sh add <task_description>"
    return 1
  else
    return 0
  fi
}



add () {

  echo $1 >> $TASK_FILE_PATH
  echo "Your task has been inserted successfully ✅"
  
  return 0
}

complete () {
  
  if ! has_tasks; then
    return 1
  fi

  if sed -n "$1p" $TASK_FILE_PATH | grep "✅" > /dev/null; then
    echo "This task has been marked as completed already."
  else
    sed -i "" "$1s,.*,$task ✅," $TASK_FILE_PATH
    echo "Your task has been updated successfully ✅"
  fi
  
  return 0
  
}

list () {

  if ! has_tasks; then
    return 1
  fi
  
  cat -b $TASK_FILE_PATH
  return 0
}

delete () {
  if ! has_tasks; then
    return 1
  fi

  sed -i "" "$1d" $TASK_FILE_PATH 
  
  return 0
  
}

if declare -f "$1" > /dev/null; then

  function_name=$1
  shift 
  "$function_name" "$@"

else
 echo "'$1' is not a known function name" 2>&1
 exit 1

fi

