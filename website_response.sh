#!/bin/bash

websites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://sajdajsda.com")

log_file="website_status.log"

> "$log_file"

check_website() {
  url=$1
  response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

  if [ "$response" -eq 200 ]; then
    echo "$url is UP" | tee -a "$log_file"
  else
    echo "$url is DOWN" | tee -a "$log_file"
  fi
}

for site in "${websites[@]}"; do
  check_website "$site"
done

echo "Результати перевірки записані у файл $log_file."
