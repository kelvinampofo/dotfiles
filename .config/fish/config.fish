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

abbr -a lls 'ls -lhSr'
abbr -a hs 'history | grep'

# git stuff
abbr -a gd 'git diff'
abbr -a ga 'git add'
abbr -a gc 'git commit'
abbr -a gp 'git push'
abbr -a gpf 'git push --force-with-lease'
abbr -a gu 'git pull'
abbr -a gl 'git log'
abbr -a glg 'git log --oneline --decorate --graph --all'
abbr -a gb 'git branch'
abbr -a gi 'git init'
abbr -a gcl 'git clone'
abbr -a gs 'git status --short'
abbr -a gcm 'git checkout main'
abbr -a gcd 'git checkout develop'
abbr -a gf 'git fetch'
abbr -a gsw 'git switch'
abbr -a gcb 'git switch -c'
abbr -a grb 'git rebase'
abbr -a grbc 'git rebase --continue'
abbr -a gst 'git stash'
abbr -a gsta 'git stash apply'

abbr -a vim 'nvim'
abbr -a c 'clear'
abbr -a e 'exit'

function v
    open $argv[1] -a "Visual Studio Code"
end
