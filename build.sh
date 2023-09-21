#!/usr/bin/env bash

ls -l | grep 'r[w-]x' | grep -v 'build\.sh' | awk '{print $9}' > list

git add .
git commit -m "build at $(date)" && git push
