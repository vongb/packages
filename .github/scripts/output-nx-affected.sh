#!/bin/bash

set -eu

BASE=$(if [ "$GITHUB_REF_NAME" = "master" ]; then echo "origin/master~1"; else echo "origin/master"; fi)

AFFECTED_PROJECTS="$(yarn --silent nx show projects --affected --base=$BASE)"


declare -a lines
while IFS= read -r line; do
  lines+=("$line")
done <<< "$AFFECTED_PROJECTS"

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
JSON="${JSON%,}]"

echo "affected=$JSON" >> $GITHUB_OUTPUT
echo "Base: $BASE. Affected: $JSON" >> $GITHUB_STEP_SUMMARY