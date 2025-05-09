#!/bin/bash
# Author: Ethan
# Date Created: 5/9/2025
# Description: Bash script to randomly change the user agent when making https requests to websites

input_file="user_agents.txt"

echo "Reading user agents from external file"
echo

counter=0
user_agents=()  # initialize array

while IFS= read -r user_agent
do
    user_agents[$counter]="$user_agent"
    echo "$counter: $user_agent"
    counter=$((counter + 1))
done < "$input_file"

echo
echo "Picking random user agent..."
random_index=$((RANDOM % ${#user_agents[@]}))
echo "Random index: $random_index"
random_user_agent="${user_agents[$random_index]}"
echo "Random User Agent: $random_user_agent"

wget 'https://httpbin.org/headers' --header "User-Agent: $random_user_agent" -O- -q 
