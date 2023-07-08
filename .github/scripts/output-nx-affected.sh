#!/bin/bash

set -eu

AFFECTED_PROJECTS="$(yarn --silent nx show projects --affected)"

declare -a lines
while IFS= read -r line; do
  lines+=("$line")
done <<< "$AFFECTED_PROJECTS"

JSON="{\"affected\": ["

for line in "${lines[@]}"; do
  JSON+="\"$line\","
done

# Remove trailing comma
JSON="${JSON%,}]}"

echo "matrix=$JSON" >> $GITHUB_OUTPUT
echo "$JSON" >> $GITHUB_STEP_SUMMARY