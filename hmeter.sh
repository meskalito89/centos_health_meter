#!/bin/bash

#!/bin/bash

while getopts 's:l:h' opt; do
  case "$opt" in
    s)
      script_number="$OPTARG" 
      cmd=$( sed "${script_number}q;d" ./config.conf)
      ;;
    l)
      logfile="$OPTARG"
      logstring="--logfile $logfile"
      ;;
   
    ?|h)
      echo "Usage: $(basename $0)"
      echo "-s number of script from ./config.conf"
      echo "-l logfile" 
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

echo "$cmd $logstring"
