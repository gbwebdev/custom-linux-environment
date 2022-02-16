#Make aliases available through sudo :
alias sudo='sudo '

#df/du (human readable + dut=du on 1st level):
alias dut="du -h -d1"
alias df='df -H'

#Use exa instead of ls:
alias ls='exa --color=auto --git -F'
alias ll='exa --color=auto -lahg --git -F'
alias lln='exa --color=auto -lahgn --git -F --octal-permissions'
alias lt='exa --color=auto -lahg --git -TF'
alias ltn='exa --color=auto -lahgn --git -TF --octal-permissions'

#cd (parent dirs):
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../..'

#auto sudo:
alias apt="sudo apt"
alias reboot="sudo reboot"

#Grep/diff (auto color):
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'

#mkdir (prompt to create parent dir):
alias mkdir='mkdir -pv'

alias rr="rm -r"

#Show binded ports:
alias ports='netstat -tulanp'

#activate python venv
alias mkvenv="python3 -m venv venv"
alias vact="source /usr/local/bin/activate_venv.sh"

#Prefer atop to top:
alias top='atop'

alias cls="clear"


#Git:
alias gaa="git add -A"
alias gcm="git commit -m"
alias gps="git push"
alias gpl="git pull"

alias wks="cd ~/workspace"


alias dsktp='ssh -A -p 50022  guillaume@PC-Guillaume.ldgb'
alias gbweblocal='ssh gbadmin@gbweb.ldgb -p 50022'
