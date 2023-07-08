#!/bin/bash

set -eu

AFFECTED_PROJECTS="$(yarn --silent nx show projects --affected)"


declare -a lines
while IFS= read -r line; do
  lines+=("$line")
done <<< "$AFFECTED_PROJECTS"

JSON="{\"project\": ["

for line in "${lines[@]}"; do
  if [[ -z $line ]]; then
    continue;
  else
    echo $line
    JSON+="\"$line\","
  fi
done

# Remove trailing comma
JSON="${JSON%,}]}"
echo $JSON

echo "matrix=$JSON" >> $GITHUB_OUTPUT
echo "$JSON" >> $GITHUB_STEP_SUMMARY