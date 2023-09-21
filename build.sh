#!/usr/bin/env bash

cd "${0%/*}"

ls -l | grep 'r[w-]x' | grep -v 'build\.sh' | awk '{print $9}' > list

git add .
git commit -m "build at $(date)" && git push

echo -e"\nThe ggtools are:"
cat list | sed 's/^/ * /g'
echo