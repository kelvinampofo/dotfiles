.PHONY: install uninstall doctor brew brew-check

install:
	./scripts/install

uninstall:
	./scripts/uninstall

doctor:
	./scripts/doctor

brew:
	brew bundle --file=Brewfile

brew-check:
	brew bundle check --file=Brewfile
