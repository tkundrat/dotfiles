# make agent forwarding work with tmux detach and attach
LINK=~/.ssh/$(hostname)-ssh_auth_sock

if [ ! -S "$LINK" ] && [ -S "$SSH_AUTH_SOCK" ]; then
    ln -sf $SSH_AUTH_SOCK "$LINK"
fi
