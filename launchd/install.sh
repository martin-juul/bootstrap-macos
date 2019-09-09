#!/usr/bin/env bash

for file in ./LaunchAgents/*.plist; do
  cp "${file}" "${HOME}/Library/LaunchAgents/"

  # shellcheck disable=SC2181
  [[ $? -eq 0 ]] || echo "Couldn't copy plist." && continue

  agentFileName=$(basename "${file}")

  echo "Enabling ${agentFileName}"

  launchctl load "${HOME}/Library/LaunchAgents/${agentFileName}"
done
