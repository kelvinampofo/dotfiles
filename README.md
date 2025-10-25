# Dotfiles

My personal dotfiles managed under version control. The repository keeps the
canonical copies of configuration files and uses symbolic links to place them
where the tools expect them.

1. Clone the repository into the expected location:

   ```txt
   git clone git@github.com:kelvinampofo/dotfiles.git ~/Developer/dotfiles
   cd ~/Developer/dotfiles
   ```

2. Back up any existing configs before replacing them:

   ```txt
   cp ~/.gitconfig ~/.gitconfig.backup
   cp ~/.config/fish/config.fish ~/.config/fish/config.fish.backup
   ```

3. Link the tracked versions into place:

   ```txt
   ln -sf ~/Developer/dotfiles/.gitconfig ~/.gitconfig
   mkdir -p ~/.config/fish
   ln -sf ~/Developer/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
   ```

4. (Optional) Inspect the symlinks to confirm they point at the repository:

   ```txt
   ls -l ~/.gitconfig ~/.config/fish/config.fish
   ```

With the links in place, edit the files inside `~/Developer/dotfiles` and commit
changes as needed; the symlinked locations will pick up updates automatically.

## Installing with Homebrew

The repository ships with a `Brewfile` so you can install the expected CLI tools
and apps in one pass.

1. Make sure Homebrew is available (install it from [brew.sh](https://brew.sh) if needed):

   ```txt
   brew --version
   ```

2. From the repository root, install everything listed in the bundle:

   ```txt
   cd ~/Developer/dotfiles
   brew bundle --file=Brewfile
   ```

3. (Optional) Remove formulas and casks that are no longer tracked:

   ```txt
   brew bundle cleanup --force --file=Brewfile
   ```
