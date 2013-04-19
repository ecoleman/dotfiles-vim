
VUNDLE=~/.vim/bundle/vundle

install: $(VUNDLE)
	@rm -f ~/.vimrc
	@rm -f ~/.gvimrc
	@rm -f ~/.ctags
	@ln -s `pwd`/vimrc ~/.vimrc
	@ln -s `pwd`/gvimrc ~/.gvimrc
	@ln -s `pwd`/ctags ~/.ctags
	@vim +BundleInstall +qall

$(VUNDLE):
	@git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

