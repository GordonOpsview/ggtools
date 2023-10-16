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

#
cp -f $HOME/Code/ggtools/ggtools /var/www/html/ggtools/ggtools
cp -f $HOME/Code/ggtools/install.sh /var/www/html/ggtools/install.sh
cp -f $HOME/Code/ggtools/list /var/www/html/ggtools/list
sed -i 's|^baseurl=.*$|baseurl="http://127.0.0.1:10080/ggtools/"|g' /var/www/html/ggtools/install.sh

echo
echo "The ggtools are:"
cat list | sed "s/^/"$'\e'"[1;35m * "$'\e'"[0m/g"
echo
echo "To install: \"curl -sL https://tinyurl.com/installggtools | sudo bash -s --\""
echo "         or \"curl -sL http://127.0.0.1:10080/ggtools/install.sh | sudo bash -s --\""
echo
