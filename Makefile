.PHONY: fzf zsh vim tmux

all: fzf zsh vim tmux

fzf:
	bash -c "git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || exit 0"
	yes n | ~/.fzf/install

zsh:
	echo "source ~/dotfiles/zsh/zshrc.sh" > ~/.zshrc

vim:
	echo "source ~/dotfiles/vim/vimrc" > ~/.vimrc

tmux:
	ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
