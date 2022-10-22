#!/bin/bash

if [[ -d ./stress-ng ]]; then
    echo 'file stress-ng exist'
else
    git clone https://github.com/ColinIanKing/stress-ng.git
fi

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

last_n_string=$( awk 'END { print NR }' $logfile)

bash "$ript_number $logstring" && echo "running script $script_number"

new_n_string=$( awk 'END { print NR }' $logfile)
difference=$(($new_n_string-$last_n_string))


