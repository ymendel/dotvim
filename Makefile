default: install

install: links plugs

links: link_vimdir link_vimrc link_nvimdir

link_vimdir: ~/.vim
link_vimrc: ~/.vimrc

~/.vim:
	ln -s ${PWD} ~/.vim

~/.vimrc:
	ln -s ~/.vim/vimrc ~/.vimrc

link_nvimdir: ~/.config/nvim

~/.config/nvim:
	mkdir -p ~/.config
	ln -s ${PWD} ~/.config/nvim

plugs:
	vim +PlugInstall +qall

update:
	vim +PlugUpgrade +PlugUpdate +qall

clean: clean_vimdir clean_vimrc

clean_vimdir:
	rm -f ~/.vim

clean_vimrc:
	rm -f ~/.vimrc
