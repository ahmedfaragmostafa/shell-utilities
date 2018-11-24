#!/bin/bash

# get file name
filename="file_$(date +%F)_$(date +%T)"
file_id="$1"

# build URL
query=$(curl -c ./cookie.txt -s -L "https://drive.google.com/uc?export=download&id=${file_id}" |
  perl -nE'say/uc-download-link.*? href="(.*?)\">/' |
  sed -e 's/amp;//g' | sed -n 2p)
url="https://drive.google.com$query"
curl -b ./cookie.txt -L -o ${filename} $url

# clean tmp files
rm -rf cookie.txt
