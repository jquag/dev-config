#!/bin/bash

#ln -s $(pwd)/.vimrc ${HOME}/.vimrc
#ln -s $(pwd)/.ideavimrc ${HOME}/.ideavimrc
#ln -s $(pwd)/.zshrc ${HOME}/.zshrc

mkdir -p ${HOME}/.config

ln -s $(pwd)/.config/nvim ${HOME}/.config/nvim
ln -s $(pwd)/.config/fish ${HOME}/.config/fish
ln -s $(pwd)/.config/starship.toml ${HOME}/.config/starship.toml

# TODO move this to the .config folder
#mkdir -p ${HOME}/.config/karabiner/
#ln -s $(pwd)/karabiner-custom.json ${HOME}/.config/karabiner/karabiner.json
