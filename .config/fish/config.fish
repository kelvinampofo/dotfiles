if status is-interactive
    # Use the latest LTS Node version when nvm is installed, but keep shell
    # startup quiet and resilient on machines without nvm.
    type -q nvm; and nvm use lts > /dev/null
end

# Keep the greeting disabled for this shell session without writing a universal
# variable on every startup.
set -g fish_greeting

# Add Homebrew and personal utility scripts to PATH for this session only.
# fish_add_path avoids duplicates, and --path avoids mutating universal vars.
fish_add_path --path /opt/homebrew/bin
test -d $HOME/Developer/workspaces/utils/bin; and fish_add_path --path $HOME/Developer/workspaces/utils/bin

alias lls='ls -lhSr'
alias hs='history | grep'

# git stuff
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
