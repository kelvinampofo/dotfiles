if status is-interactive
    # commands to run in interactive sessions can go here
    nvm use lts > /dev/null
end

set -U fish_greeting
set -U fish_user_paths $HOME/Developer/utils/bin $fish_user_paths
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths 

alias lls='ls -lhSr'
alias hs='history | grep'


alias gd='git diff'

alias ga='git add'
alias gc='git commit'

alias gp='git push'
alias gpf='git push --force-with-lease'
alias gu='git pull'

alias gl='git log'
alias gb='git branch'

alias gi='git init'
alias gcl='git clone'

alias gs='git status --short'
alias gcm='git checkout main'
alias gcd='git checkout develop'
alias gf='git fetch'


alias vim='nvim'
alias c='clear'
alias e='exit'

function v
  open $argv[1] -a "Visual Studio Code"
end
