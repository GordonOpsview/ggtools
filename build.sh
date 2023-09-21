#!/usr/bin/env bash

cd "${0%/*}"

ls -l | grep 'r[w-]x' | grep -v 'build\.sh' | awk '{print $9}' > list

for tool in $(cat list); do
  grep '^#.*ggtool' ./$tool &>/dev/null || echo -e "\n## ggtool" >> ./$tool
done
echo -ne "\e[94m"
git add .
git commit -m "build at $(date)" && git push
echo -ne "\e[0m"

echo
echo "The ggtools are:"
star='$'\e'[1;35m * $'\e'[0m'
cat list | sed "s/^/$star/g"
echo
echo "To install: \"curl -s https://raw.githubusercontent.com/GordonOpsview/ggtools/main/install.sh | sudo bash -s --\""
echo