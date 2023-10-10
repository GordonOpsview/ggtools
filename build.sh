#!/usr/bin/env bash

cd "${0%/*}"

ls -l ./ggtools | grep 'r[w-]x' | grep -v 'build\.sh' | awk '{print $9}' > list

for tool in $(cat list); do
  grep '^#.*ggtool' ./ggtools/$tool &>/dev/null || echo -e "\n## ggtool" >> ./ggtools/$tool
done
echo -ne "\e[94m"
git add .
git commit -m "build at $(date)" && git push
echo -ne "\e[0m"

echo
echo "The ggtools are:"
cat list | sed "s/^/"$'\e'"[1;35m * "$'\e'"[0m/g"
echo
echo "To install: \"curl -sL https://tinyurl.com/installggtools | sudo bash -s --\""
echo