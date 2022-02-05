#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please use sudo to run this script."
  exit
fi

SUDO_USER_HOME=/home/$SUDO_USER

apt update
apt upgrade

apt install keychain atop zip unzip

exa_version=0.10.0
mkdir /tmp/exa
cd /tmp/exa
wget https://github.com/ogham/exa/releases/download/v$exa_version/exa-linux-x86_64-v$exa_version.zip
unzip exa-linux-x86_64-v$exa_version.zip
cp bin/exa /usr/local/bin/exa
chmod o+x /usr/local/bin/exa
cp completions/exa.bash /etc/bash_completion.d/exa.bash
chmod o+r /etc/bash_completion.d/exa.bash
cd /tmp
rm -rf /tmp/exa

cd $SUDO_USER_HOME

mkdir workspace
chown $SUDO_USER:$SUDO_USER workspace

echo -e "\n\n/usr/bin/keychain -q --nogui \$HOME/.ssh/id_ed25519\nsource \$HOME/.keychain/$(hostname)-sh" >> .bashrc

wget https://raw.githubusercontent.com/gbwebdev/custom-linux-environment/main/.gbi_bash_prompt.sh -O /usr/local/bin/.gbi_bash_prompt.sh
chown root:root  /usr/local/bin/.gbi_bash_prompt.sh
chmod 0555 /usr/local/bin/.gbi_bash_prompt.sh

sed -i 's/#force_color_prompt/force_color_prompt/g' .bashrc
perl -0777 -i -pe 's/if \[ "\$color_prompt" = yes ]; then\n    PS1(.*)/if \[ "\$color_prompt" = yes ]; then\n #   PS1$1\n    source \/usr\/local\/bin\/.gbi_bash_prompt.sh/' .bashrc

wget https://raw.githubusercontent.com/gbwebdev/custom-linux-environment/main/.bash_aliases -O .bash_aliases
chown $SUDO_USER:$SUDO_USER .bash_aliases
source .bashrc


read -p "Do you want to apply the changes for futur users (Y/n)?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    mv /etc/skel/.bashrc /etc/skel/.bashrc.orig
    cp .bashrc /etc/skel/.bashrc
    chown root:root /etc/skel/.bashrc

    cp .bash_aliases /etc/skel/.bash_aliases
    chown root:root /etc/skel/.bash_aliases
fi

