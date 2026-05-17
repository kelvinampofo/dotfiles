.PHONY: install uninstall doctor test macos brew brew-check

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
