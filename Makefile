install: install-vim

install-vim:
	rm -rf ~/.vimrc
	rm -rf ~/.gvimrc
	ln -s `pwd`/vimrc ~/.vimrc
	ln -s `pwd`/gvimrc ~/.gvimrc

update:
	git submodule update --init
	git submodule foreach git pull origin master
	@echo "You should review & commit updates submodules"

