#!/bin/sh

cd $HOME/.dotfiles
git submodule init && git submodule update

if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    mkdir -p $HOME/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

if [ ! -d $HOME/.local/lib/python2.7/site-packages/powerline ]; then
    pip install --user powerline-status
fi

#bin/dfm install

