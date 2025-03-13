TARGETS ?= $(wildcard */)

all: $(addprefix apply-,$(TARGETS))

ensure-bin:
	mkdir -p $(HOME)/bin/

apply-%: ensure-bin
	stow --verbose --target $(HOME) $*

rollback-%:
	stow --verbose --target $(HOME) --delete $*
