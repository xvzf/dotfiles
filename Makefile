TARGETS ?= $(wildcard */)
SERVER_TARGETS ?= tmux vim zsh

all: $(addprefix apply-,$(TARGETS))
server: $(addprefix apply-,$(SERVER_TARGETS))

ensure-bin:
	mkdir -p $(HOME)/bin/

apply-%: ensure-bin
	stow --verbose --target $(HOME) $*

rollback-%:
	stow --verbose --target $(HOME) --delete $*
