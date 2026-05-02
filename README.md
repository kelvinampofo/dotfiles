# Dotfiles

Personal macOS dotfiles. The repo stores the source files; the live config
locations point back here with symlinks.

## Setup

```txt
git clone git@github.com:kelvinampofo/dotfiles.git ~/Developer/workspaces/dotfiles
cd ~/Developer/workspaces/dotfiles
make install
make doctor
```

`make install` links the tracked configs into their normal local locations. It
will not replace a real file or directory; move anything conflicting aside first.

`make doctor` checks that the expected tools and symlinks are in place.

## Homebrew

```txt
make brew
make brew-check
```

`make brew` installs everything in `Brewfile`. `make brew-check` verifies the
bundle is satisfied.
