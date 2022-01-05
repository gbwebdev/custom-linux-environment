#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Merci de relancer ce script en tant que root"
  exit
fi


apt update
apt upgrade

apt install keychain exa atop

mkdir ~/workspace

echo -e "\n\n/usr/bin/keychain -q --nogui \$HOME/.ssh/id_ed25519\nsource \$HOME/.keychain/$(hostname)-sh" >> ~/.bashrc

wget https://raw.githubusercontent.com/gbwebdev/custom-linux-environment/main/.gbi_bash_prompt.sh -O /usr/local/bin/.gbi_bash_prompt.sh
chown root:root  /usr/local/bin/.gbi_bash_prompt.sh
chmod 0111 /usr/local/bin/.gbi_bash_prompt.sh

sed -i 's/#force_color_prompt/force_color_prompt/g' ~/.bashrc
perl -0777 -pe 's/if \[ "\$color_prompt" = yes ]; then\n    PS1(.*)/  # PS1=$1\n    source /usr/local/bin/.gbi_bash_prompt.sh/' ~/.bashrc

source ~/.bashrc
