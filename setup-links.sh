#!/bin/bash

mkdir -p ${HOME}/.config

ln -s $(pwd)/.config/nvim $XDG_CONFIG_HOME/nvim
ln -s $(pwd)/.config/fish $XDG_CONFIG_HOME/fish
ln -s $(pwd)/.config/starship.toml $HOME/.config/starship.toml

ln -s $(pwd)/.config/tmux/tmux.conf.local $XDG_CONFIG_HOME/tmux/tmux.conf.local

# TODO move this to the .config folder
#mkdir -p ${HOME}/.config/karabiner/
#ln -s $(pwd)/karabiner-custom.json ${HOME}/.config/karabiner/karabiner.json
