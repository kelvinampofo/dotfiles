.PHONY: help bootstrap install uninstall doctor check macos brew brew-check

SCRIPTS := scripts/doctor scripts/install scripts/lib scripts/macos scripts/uninstall

help:
	@echo "Targets:"
	@echo "  make bootstrap    # install packages and links"
	@echo "  make install      # link managed dotfiles into place"
	@echo "  make uninstall    # remove symlinks managed by this repo"
	@echo "  make doctor       # check tools, Homebrew, and managed links"
	@echo "  make check        # validate shell scripts"
	@echo "  make macos        # apply tracked macOS defaults"
	@echo "  make brew         # install Brewfile dependencies"
	@echo "  make brew-check   # check Brewfile dependencies"

bootstrap:
	$(MAKE) brew
	$(MAKE) install
	$(MAKE) doctor

install:
	./scripts/install

uninstall:
	./scripts/uninstall

doctor:
	./scripts/doctor

check:
	bash -n $(SCRIPTS)
	shellcheck -x -P scripts --exclude=SC2329 $(SCRIPTS)

macos:
	./scripts/macos

brew:
	brew bundle --file=Brewfile

brew-check:
	brew bundle check --file=Brewfile
