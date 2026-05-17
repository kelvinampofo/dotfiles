.PHONY: install uninstall doctor test brew brew-check

install:
	./scripts/install

uninstall:
	./scripts/uninstall

doctor:
	./scripts/doctor

test:
	bash -n scripts/doctor scripts/install scripts/lib scripts/uninstall
	shellcheck -x -P scripts --exclude=SC2329 scripts/doctor scripts/install scripts/uninstall scripts/lib

brew:
	brew bundle --file=Brewfile

brew-check:
	brew bundle check --file=Brewfile
