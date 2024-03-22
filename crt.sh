#!/bin/bash
# Description: This script will help you monitor your public certification usage via https://crt.sh
# Usage: crt.sh <last|count> <domain>
#        crt.sh last example.com -> will output "2024-03-21T12:00:12.012"
#        crt.sh count example.com -> will output 123
# Author: https://github.com/melvin-suter

if [[ "$1" == "last" ]] ; then 
  curl "https://crt.sh/?q=$2&output=json" 2>/dev/null | jq '.[].entry_timestamp'  | sort | tail -n1
fi

if [[ "$1" == "count" ]] ; then 
  curl "https://crt.sh/?q=$2&output=json" 2>/dev/null | jq '.[].entry_timestamp'  | wc -l
fi
