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
backs up real files or directories before replacing them with symlinks. Backups
are written to `~/.dotfiles-backups/<timestamp>/`.

`make doctor` checks that the expected tools and symlinks are in place.

`make uninstall` removes symlinks created by this repo. It leaves unrelated files
and symlinks untouched.

Managed links live in `links.manifest`.

## macOS

```plain
make macos
```

`make macos` applies the tracked macOS defaults.

## Homebrew

```txt
make brew
make brew-check
```

`make brew` installs everything in `Brewfile`. `make brew-check` verifies the
bundle is satisfied.
