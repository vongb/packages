#!/bin/bash

set -eu

AFFECTED_PROJECTS="$(yarn --silent nx show projects --affected)"

declare -a lines
while IFS= read -r line; do
  lines+=("$line")
done <<< "$AFFECTED_PROJECTS"

JSON="{\"affected\": ["
STEP_SUMMARY="Affected projects:\n"

for line in "${lines[@]}"; do
  STEP_SUMMARY+=":package: $line\n"
  JSON+="\"$line\","
done

# Remove trailing comma
JSON="${JSON%,}]}"

echo "::set-output matrix=JSON"
echo "$STEP_SUMMARY" >> $GITHUB_STEP_SUMMARY