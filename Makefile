TARGETS ?= $(wildcard */)
SERVER_TARGETS ?= tmux vim zsh

fullconfig: $(addprefix apply-,$(TARGETS))
serverconfig: $(addprefix apply-,$(SERVER_TARGETS))

ensure-bin:
	mkdir -p $(HOME)/bin/

apply-%: ensure-bin
	stow --verbose --target $(HOME) $*

rollback-%:
	stow --verbose --target $(HOME) --delete $*

ubuntu: fullconfig
	_setup/chrome-setup.sh
	_setup/code-setup.sh
	_setup/font-bootstrap.sh
	_setup/gnome-bootstrap.sh
