#!/usr/bin/env bash

# tmpdir=$(mktemp -d /tmp/XXXXXXX)

for item in $(curl https://raw.githubusercontent.com/GordonOpsview/ggtools/main/list 2>/dev/null); do
  echo "${item}"
done

  # curl -o "$tmpdir/$1" https://raw.githubusercontent.com/GordonOpsview/ggtools/main/$1 2>/dev/null

# rm -rf $tmpdir