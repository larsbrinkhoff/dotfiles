if [ "$PROFILE_LOADED" \!= "yep" ]; then
    . $HOME/.bash_profile
fi

if [ "$TERM" = dumb ] ; then
  export GIT_PAGER=cat
  export GIT_EDITOR=emacsclient
fi

test -c /dev/tty && stty -ixon -ixoff
