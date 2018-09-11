#!/bin/sh

cd $HOME/.dotfiles
git submodule init && git submodule update

if [ ! -d $HOME/.zprezto ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

if [ ! -d $HOME/.config/nvim/bundle/Vundle.vim ]; then
    mkdir -p $HOME/.config/nvim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim
    nvim +PluginInstall +qall
fi

if [ ! -d $HOME/.local/lib/python2.7/site-packages/powerline ]; then
    pip2 install --user powerline-status
fi

