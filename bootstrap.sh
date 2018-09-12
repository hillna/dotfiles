#!/bin/sh

cd $HOME/.dotfiles
git submodule init && git submodule update

if [ ! -d $HOME/.zprezto ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

vundledirs=($HOME/.vim/bundle $HOME/.config/nvim/bundle)
for dir in $vundledirs; do
    if [ ! -d $dir/Vundle.vim ]; then
        mkdir -p $dir
        git clone https://github.com/VundleVim/Vundle.vim.git $dir/Vundle.vim
        vim +PluginInstall +qall
    fi
done

if [ ! -d $HOME/.local/lib/python2.7/site-packages/powerline ]; then
    pip2 install --user powerline-status
fi

