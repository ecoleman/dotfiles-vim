install: install-vim

install-vim:
	rm -rf ~/.vimrc
	rm -rf ~/.gvimrc
	ln -s `pwd`/vimrc ~/.vimrc
	ln -s `pwd`/gvimrc ~/.gvimrc

