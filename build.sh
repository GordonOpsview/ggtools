#!/usr/bin/env bash

cd "${0%/*}"

ls -l | grep 'r[w-]x' | grep -v 'build\.sh' | awk '{print $9}' > list

git add .
git commit -m "build at $(date)" && git push

echo
echo "The ggtools are:"
cat list | sed 's/^/ * /g'
echo
echo "To install: \"curl https://raw.githubusercontent.com/GordonOpsview/ggtools/main/install.sh | sudo bash -s --\""
echo