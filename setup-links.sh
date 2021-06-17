#!/bin/zsh

ln -s $(pwd)/.vimrc ${HOME}/.vimrc
ln -s $(pwd)/.ideavimrc ${HOME}/.ideavimrc
ln -s $(pwd)/.zshrc ${HOME}/.zshrc

mkdir -p ${HOME}/.config/nvim
ln -s $(pwd)/nvim-init.vim ${HOME}/.config/nvim/init.vim

mkdir -p ${HOME}/.config/karabiner/
ln -s $(pwd)/karabiner-custom.json ${HOME}/.config/karabiner/karabiner.json
