# make agent forwarding work with tmux detach and attach
LINK=~/.ssh/$(hostname)-ssh_auth_sock

if [ ! -S "$LINK" ] && [ -S "$SSH_AUTH_SOCK" ]; then
    ln -sf $SSH_AUTH_SOCK "$LINK"
fi

source ~/.bash-powerline.sh

# if interactive
if [[ $- == *i* ]]; then
    # trap cmds and set them as title
    trap '__bash_cmd="|>$BASH_COMMAND"; if [[ $__bash_cmd == "|>ps1" ]]; then __bash_cmd=""; fi; echo -ne "\033]0;$USER@$HOSTNAME$__bash_cmd\007"; unset __bash_cmd' DEBUG
fi

# add home bin to path
export PATH="${HOME}/bin:${PATH}"

# edit button layout based on wm
if [[ $GDMSESSION -eq 'sway' ]]; then
    gsettings set org.gnome.desktop.wm.preferences button-layout ''
else
    gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:icon'
fi

# wayland qt
export QT_QPA_PLATFORM=wayland

# aliases
alias ll="ls -laFh --color=auto"
alias g=git

# editor
export EDITOR='/usr/bin/hx'

# local bashrc
if [ -f $USER/.bashrc.local ]; then
    source $USER/.bashrc.local
fi
