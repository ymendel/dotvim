default:
	echo "use 'install' target"

install: vimdir vimrc

vimdir:
	test -L ~/.vim || ln -s `pwd` ~/.vim

vimrc: vimdir
	test -L ~/.vimrc || ln -s ~/.vim/vimrc ~/.vimrc

clean:
	rm ~/.vim
	rm ~/.vimrc
