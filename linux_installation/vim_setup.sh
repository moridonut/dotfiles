mkdir ~/.vim
mkdir ~/.vim/colors
mkdir ~/.vim/bundle
mkdir ~/Documents
mkdir ~/Documents/vimfiles
mkdir ~/Documents/vimfiles/tmp

cp ../vimfiles/colors/*.vim ~/.vim/colors
cp ../_vimrc ~/.vimrc

cp -R ../vimfiles/bundle/* ~/.vim/bundle
