#!/bin/bash

dir="/srv/rsyslog/"
log="syslog"

while getopts ":q:d:l:" opt;
do
   case $opt in
      q)
         query=$OPTARG
         ;;
      d)
         dir=$OPTARG
         ;; 
      l)
         log=$OPTARG
         ;;
      \?)
         echo "Invalid option: -$OPTARG"
         exit 1
         ;;
      :)
         echo "Option -$OPTARG requires an argument."
         exit 1
         ;;
   esac
done

echo "          Query - \"$query\""
echo "  TimeStamp     |       Server"
echo "-----------------------------------------"
find $dir -type f -name $log -print0 | while read -d $'\0' file
do
   grep --color "$query" $file | awk '{print $1,$2,$3,"|",$4}'
done
exit 0
