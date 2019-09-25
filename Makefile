.PHONY: fzf zsh vim tmux

all: jq fzf zsh vim tmux

fzf:
	bash -c "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || exit 0"
	yes n | ~/.fzf/install

jq:
	mkdir -p ~/bin
	curl https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -sfLo ~/bin/jq
	chmod 744 ~/bin/jq

zsh:
	echo "source ~/dotfiles/zsh/zshrc.sh" > ~/.zshrc

vim:
	echo "source ~/dotfiles/vim/vimrc" > ~/.vimrc

tmux:
	ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
