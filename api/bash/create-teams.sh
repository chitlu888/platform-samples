#!/bin/bash

orgname="xxx" 
pattoken="xxxxxxx"
teams=("team-name-1" "team-name-2")

echo "Bulk creating teams in:"
echo $orgname

for i in "${teams[@]}"
  do
    curl --request POST \
      --url "https://api.github.com/orgs/$orgname/teams" \
      --header "accept: application/vnd.github.v3+json" \
      --header "authorization: Bearer ${pattoken}" \
      --header "content-type: application/json" \
      --data "{\"name\": \"$i\", \"privacy\": \"closed\" }" \
      -- fail

    retVal=$?
    if [ $retVal -ne 0 ]; then
      echo "Team creation failed! Please verify validity of supplied configurations."
      exit 1
    fi  
done
echo "Teams succesfully created!"




