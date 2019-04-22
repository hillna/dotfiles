#!/bin/sh

echo "Initiating bootstrap"

cd $HOME/.dotfiles
git submodule init && git submodule update

if [ ! -d $HOME/.zprezto ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

if [ ! -d $HOME/.local/lib/python2.7/site-packages/powerline ]; then
    pip2 install --user powerline-status
fi

if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim +'PlugInstall --sync' +qa
nvim +'PlugInstall --sync' +qa

if [ ! -d $HOME/.vim/plugged/deoplete-jedi/rplugin/python3/deoplete/vendored/jedi ]; then
    cd $HOME/.vim/plugged/deoplete-jedi && \
    git submodule update --init
fi

echo "Bootstrap completed!"

