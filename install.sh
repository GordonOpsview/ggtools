#!/usr/bin/env bash
e=$'\e'
echo "${e}[1mInstalling ggtools${e}[0m"
for ggtool in $(curl https://raw.githubusercontent.com/GordonOpsview/ggtools/main/list 2>/dev/null); do
  if [[ ! -f "/usr/bin/$ggtool" ]] || grep '^#.*ggtool' /usr/bin/$ggtool &>/dev/null; then
    curl -sS -o "/usr/bin/$ggtool" https://raw.githubusercontent.com/GordonOpsview/ggtools/main/ggtools/$ggtool && chmod +x "/usr/bin/$ggtool"
    echo "${e}[1;35m * ${e}[0m $ggtool installed."
  fi
done
echo "${e}[1mggtools installed.${e}[0m"