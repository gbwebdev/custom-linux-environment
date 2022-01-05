function nonzero_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo " (returned $RETVAL)"
}
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;38;5;33m\][\u@\h]\[\033[38;5;39m\]\w\[\033[03;38;5;208m\]\`nonzero_return\`\033[m:\n$ "
