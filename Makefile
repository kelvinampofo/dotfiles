.PHONY: help install uninstall doctor test macos brew brew-check

help:
	@echo "Targets:"
	@echo "  make install      # link managed dotfiles into place"
	@echo "  make uninstall    # remove symlinks managed by this repo"
	@echo "  make doctor       # check tools, Homebrew, and managed links"
	@echo "  make test         # run shell syntax and ShellCheck checks"
	@echo "  make macos        # apply tracked macOS defaults"
	@echo "  make brew         # install Brewfile dependencies"
	@echo "  make brew-check   # check Brewfile dependencies"

install:
	./scripts/install

uninstall:
	./scripts/uninstall

doctor:
	./scripts/doctor

test:
	bash -n scripts/doctor scripts/install scripts/lib scripts/macos scripts/uninstall
	shellcheck -x -P scripts --exclude=SC2329 scripts/doctor scripts/install scripts/lib scripts/macos scripts/uninstall

macos:
	./scripts/macos

brew:
	brew bundle --file=Brewfile

brew-check:
	brew bundle check --file=Brewfile
