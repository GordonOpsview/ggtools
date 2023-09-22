#!/usr/bin/env bash

for ggtool in $(curl https://raw.githubusercontent.com/GordonOpsview/ggtools/main/list 2>/dev/null); do
  if [[ ! -f "/usr/bin/$ggtool" ]] || grep '^#.*ggtool' /usr/bin/$ggtool &>/dev/null; then
    curl -sS -o "/usr/bin/$ggtool" https://raw.githubusercontent.com/GordonOpsview/ggtools/main/ggtools/$ggtool && chmod +x "/usr/bin/$ggtool"
  fi
done