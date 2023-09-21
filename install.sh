#!/usr/bin/env bash

for ggtool in $(curl https://raw.githubusercontent.com/GordonOpsview/ggtools/main/list 2>/dev/null); do
  curl -sS -o "/usr/bin/$ggtool" https://raw.githubusercontent.com/GordonOpsview/ggtools/main/$ggtool && chmod +x "/usr/bin/$ggtool"
done