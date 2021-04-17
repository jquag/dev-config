#!/bin/zsh

ln -s $(pwd)/.vimrc ${HOME}/.vimrc
ln -s $(pwd)/.ideavimrc ${HOME}/.ideavimrc

mkdir -p ${HOME}/.config/nvim
ln -s $(pwd)/nvim-init.vim ${HOME}/.config/nvim/init.vim

mkdir -p ${HOME}/.config/karabiner/assets/complex_modifications
ln -s $(pwd)/karabiner-custom.json ${HOME}/.config/karabiner/assets/complex_modifications
