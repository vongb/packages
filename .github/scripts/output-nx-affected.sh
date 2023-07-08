#!/bin/bash

set -eu

AFFECTED_PROJECTS="$(yarn --silent nx show projects --affected)"


declare -a lines
while IFS= read -r line; do
  lines+=("$line")
done <<< "$AFFECTED_PROJECTS"

JSON=""

if [[ ${#lines} -eq 0 ]]; then
  echo "No projects affect! 🤷‍♂️"
  JSON="{\"affected\": false, \"project\": []}"
else 
  echo "Projects affected!"
  JSON="{\"affected\": true, \"project\": ["

  for line in "${lines[@]}"; do
    JSON+="\"$line\","
  done

  # Remove trailing comma
  JSON="${JSON%,}]}"
fi

echo "matrix=$JSON" >> $GITHUB_OUTPUT
echo "$JSON" >> $GITHUB_STEP_SUMMARY