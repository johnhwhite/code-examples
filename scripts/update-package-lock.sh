#!/usr/bin/env bash

BasePath="$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd)"

cd "${BasePath}"

Projects="$(ls -d */|fgrep -v scripts/)"

for Project in ${Projects}; do
  cd "${Project}"
  rm -f package-lock.json
  npm install --ignore-scripts --package-lock-only 1>/dev/null
  if [ $? -eq 0 ]; then
    echo -n -e "\033[32m【 OK 】\033[0m\t"
  else
    echo -n -e "\033[31m【FAIL】\033[0m\t"
  fi
  echo "${Project}"
  cd "${BasePath}"
done
