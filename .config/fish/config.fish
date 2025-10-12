if status is-interactive
    # Commands to run in interactive sessions can go here
    nvm use lts > /dev/null
end

set -U fish_greeting
set -U fish_user_paths $HOME/Developer/utils/bin $fish_user_paths
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths 

alias lls='ls -lhSr'
alias hs='history | grep'

alias gs='git status'
alias gc='git commit'
alias gcm='git checkout main'
alias gcd='git checkout develop'
alias gd='git diff'
alias gp='git pull'
alias gf='git fetch'
alias up='git push'
alias upf='git push --force-with-lease'

alias vim='nvim'
alias c='clear'
alias e='exit'

function v
  open $argv[1] -a "Visual Studio Code"
end
