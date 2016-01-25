#!/bin/sh

if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi 

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    mkdir -p $HOME/.vim/bundle
    git clone clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

