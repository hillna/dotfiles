#!/bin/sh

echo "Initiating bootstrap"

cd $HOME/.dotfiles
git submodule init && git submodule update

if [ ! -d $HOME/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# Powerline & modules
#if [ $(uname | grep Darwin) ]; then
#  if [ ! -d /usr/local/lib/python3.9/site-packages/powerline ]; then
#    pip3 install powerline-status
#  fi
#else
#  if [ ! -d $HOME/.local/lib/python3.8/site-packages/powerline ]; then
#    pip3 install --user powerline-status
#  fi
#fi

# Original Powerkube: https://github.com/zcmarine/powerkube
# Fixed import: https://github.com/rarguelloF/powerkube/tree/fix-kubernetes-import
#if [ ! -d $HOME/.local/lib/python2.7/site-packages/powerkube ]; then
#    pip2 install --user git+https://@github.com/rarguelloF/powerkube.git@fix-kubernetes-import
#fi

# vim plugins
#if [ ! -f $HOME/.vim/autoload/plug.vim ]; then
#  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi
#vim +'PlugInstall --sync' +qa
#nvim +'PlugInstall --sync' +qa
#nvim +'UpdateRemotePlugins' +qa

#if [ ! -d $HOME/.vim/plugged/deoplete-jedi/rplugin/python3/deoplete/vendored/jedi ]; then
#    cd $HOME/.vim/plugged/deoplete-jedi && \
#    git submodule update --init
#fi

echo "Bootstrap completed!"
