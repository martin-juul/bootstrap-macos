#!/usr/bin/env bash

for file in ./LaunchAgents/*.plist; do
  agentFileName=$(basename "${file}")

  echo "Removing ${agentFileName}"

  launchctl unload "${HOME}/Library/LaunchAgents/${agentFileName}"

  rm "${HOME}/Library/LaunchAgents/${agentFileName}"
done
