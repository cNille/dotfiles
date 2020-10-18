EDITOR=vim

# Ignores to add commands in history if tehy start with a space
setopt HIST_IGNORE_SPACE

alias vim="nvim"
alias vi="nvim"
alias !!!='!-2'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias ll='ls -Flah'
alias xx='exit'
alias livels='watch -n0,1 "ls -lrt ./ | tail "'
alias sshhost='cat ~/.ssh/config  | grep "Host "'
alias gs='git status '
alias dev='git co new-mastery-model-develop'
alias killserver='lsof -i :3100 | awk '/node/{print $2}' | xargs kill -9 '

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
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

# Brew
export PATH=/usr/local/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nille/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nille/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nille/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nille/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


# Custom prompt
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
