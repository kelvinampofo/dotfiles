.PHONY: install doctor brew brew-check

install:
	./scripts/install

doctor:
	./scripts/doctor

brew:
	brew bundle --file=Brewfile

brew-check:
	brew bundle check --file=Brewfile
