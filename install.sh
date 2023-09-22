#!/usr/bin/env bash
e=$'\e'
if [[ "$1" == "-v" ]]; then echo "${e}[1mInstalling ggtools${e}[0m"; fi
for ggtool in $(curl https://raw.githubusercontent.com/GordonOpsview/ggtools/main/list 2>/dev/null); do
  if [[ ! -f "/usr/bin/$ggtool" ]] || grep '^#.*ggtool' /usr/bin/$ggtool &>/dev/null; then
    curl -sS -o "/usr/bin/$ggtool" https://raw.githubusercontent.com/GordonOpsview/ggtools/main/ggtools/$ggtool && chmod +x "/usr/bin/$ggtool"
    if [[ "$1" == "-v" ]]; then echo "${e}[1;35m * ${e}[0m $ggtool installed."; fi
  fi
done
echo "ggtools installed."