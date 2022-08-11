#!/usr/bin/env bash

BasePath="$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd)"

cd "${BasePath}"

Projects="$(ls -d */|fgrep -v scripts/)"

for Project in ${Projects}; do
  cd "${Project}"
  npm install --ignore-scripts --prefer-offline --package-lock-only 1>/dev/null 2>/dev/null
  if [ $? -eq 0 ]; then
    echo -n -e "\t\033[32m OK \033[0m"
  else
    echo -n -e "\t\033[31mFAIL\033[0m"
  fi
  echo "${Project}"
  cd "${BasePath}"
done
