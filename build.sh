#!/usr/bin/env bash

cd "${0%/*}"

ls -l | grep 'r[w-]x' | grep -v 'build\.sh' | awk '{print $9}' > list

for tool in $(cat list); do
  grep '^#.*ggtool' ./$tool &>/dev/null || echo -e "\n## ggtool" >> ./$tool
done

git add .
git commit -m "build at $(date)" && git push

echo
echo "The ggtools are:"
cat list | sed 's/^/ * /g'
echo
echo "To install: \"curl -s https://raw.githubusercontent.com/GordonOpsview/ggtools/main/install.sh | sudo bash -s --\""
echo