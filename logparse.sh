#!/bin/bash

log=/var/log/syslog

while getopts ":s:" opt; do

case $opt in
    s)
      #echo "-a was triggered, Parameter: $OPTARG"
      grep -E "$OPTARG" $log
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
