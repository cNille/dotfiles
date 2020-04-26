EDITOR=vim

# Ignores to add commands in history if tehy start with a space
setopt HIST_IGNORE_SPACE

alias !!!='!-2'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ll='ls -Flah'
alias xx='exit'
alias livels='watch -n0,1 "ls -lrt ./ | tail "'
alias sshhost='cat ~/.ssh/config  | grep "Host "'
alias gs='git status '

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Autojump stuff
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export PATH="$HOME/Library/Android/sdk/platform-tools/":$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/development/flutter/bin"
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$(go env GOPATH)/bin
