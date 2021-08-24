default: install

install: links plugs

links: link_vimdir link_vimrc

link_vimdir:
	test -L ~/.vim || ln -s ${PWD} ~/.vim

link_vimrc:
	test -L ~/.vimrc || ln -s ~/.vim/vimrc ~/.vimrc

plugs:
	vim +PlugInstall +qall

update:
	vim +PlugUpgrade +PlugUpdate +qall

clean: clean_vimdir clean_vimrc

clean_vimdir:
	test -L ~/.vim && rm ~/.vim

clean_vimrc:
	test -L ~/.vimrc && rm ~/.vimrc
