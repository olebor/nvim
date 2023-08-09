
lint: lint-lua lint-sh

lint-lua:
	luacheck *.lua lua/* tests/* --globals vim

lint-sh:
	shfmt -f . | grep -v jdtls | xargs shellcheck

style: style-lua style-sh

style-lua:
	stylua --config-path .stylua.toml --check .

style-sh:
	shfmt -f . | grep -v jdtls | xargs shfmt -i 2 -ci -l -d

test:
	bash ./utils/bin/test_runner.sh "$(TEST)"

.PHONY: install install-neovim-binary uninstall lint style test
