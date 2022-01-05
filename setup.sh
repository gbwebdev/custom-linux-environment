#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please use sudo to run this script."
  exit
fi


read -p "Do you want to apply the changes for futur users?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff
fi

SUDO_USER_HOME=/home/$SUDO_USER

apt update
apt upgrade

apt install keychain exa atop

cd $SUDO_USER_HOME

wget https://raw.githubusercontent.com/ogham/exa/master/completions/bash/exa -O /etc/bash_completion.d/exa
chmod o+r /etc/bash_completion.d/exa

mkdir workspace

echo -e "\n\n/usr/bin/keychain -q --nogui \$HOME/.ssh/id_ed25519\nsource \$HOME/.keychain/$(hostname)-sh" >> .bashrc

wget https://raw.githubusercontent.com/gbwebdev/custom-linux-environment/main/.gbi_bash_prompt.sh -O /usr/local/bin/.gbi_bash_prompt.sh
chown root:root  /usr/local/bin/.gbi_bash_prompt.sh
chmod 0555 /usr/local/bin/.gbi_bash_prompt.sh

sed -i 's/#force_color_prompt/force_color_prompt/g' .bashrc
perl -0777 -pe 's/if \[ "\$color_prompt" = yes ]; then\n    PS1(.*)/  # PS1=$1\n    source /usr/local/bin/.gbi_bash_prompt.sh/' .bashrc

wget https://raw.githubusercontent.com/gbwebdev/custom-linux-environment/main/.bash_aliases -O .bash_aliases
chown $SUDO_USER:$SUDO_USER .bash_aliases
source .bashrc


read -p "Do you want to apply the changes for futur users?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    mv /etc/skel/.bashrc /etc/skel/.bashrc.orig
    cp .bashrc /etc/skel/.bashrc
    chown root:root /etc/skel/.bashrc

    cp .bash_aliases /etc/skel/.bash_aliases
    chown root:root /etc/skel/.bash_aliases
fi

