#!/bin/bash

set -eu

affected-projects="$(yarn --silent nx show projects --affected)"

declare -a lines
while IFS= read -r line; do
  lines+=("$line")
done <<< "$affected-projects"

json="{\"affected\": ["
step-summary="Affected projects:\n"

for line in "${lines[@]}"; do
  step-summary+=":package: $line\n"
  json+="\"$line\","
done

# Remove trailing comma
json="${json%,}]}"

echo "matrix=JSON" >> $GITHUB_OUTPUT
echo "$step-summary" >> $GITHUB_STEP_SUMMARY