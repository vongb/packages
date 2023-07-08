#!/bin/bash

set -eu

AFFECTED_PROJECTS="$(yarn --silent nx show projects --affected)"


declare -a lines
while IFS= read -r line; do
  lines+=("$line")
done <<< "$AFFECTED_PROJECTS"

# JSON="{\"project\":["
JSON="["

for line in "${lines[@]}"; do
  if [[ -z $line ]]; then
    continue;
  else
    echo $line
    JSON+="\"$line\","
  fi
done

# Remove trailing comma
# JSON="${JSON%,}]}"
JSON="${JSON%,}]"

echo "affected=$JSON"
# echo "$JSON" >> $GITHUB_STEP_SUMMARY