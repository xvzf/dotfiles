.PHONY: brew dotfiles

# Managed configs
CONFIGS=zsh git tmux nvim

macos: brew dotfiles
linux: dotfiles

brew:
	brew bundle install --file Brewfile

dotfiles:
	$(foreach var,$(CONFIGS),stow --dir=$(shell pwd) --target=${HOME} $(var);)
