# make agent forwarding work with tmux detach and attach
LINK=~/.ssh/$(hostname)-ssh_auth_sock

if [ ! -S "$LINK" ] && [ -S "$SSH_AUTH_SOCK" ]; then
    ln -sf $SSH_AUTH_SOCK "$LINK"
fi

source ~/.bash-powerline.sh

# trap cmds and set them as title
trap '__bash_cmd="|>$BASH_COMMAND"; if [[ $__bash_cmd == "|>ps1" ]]; then __bash_cmd=""; fi; echo -ne "\033]0;$USER@$HOSTNAME$__bash_cmd\007"; unset __bash_cmd' DEBUG
