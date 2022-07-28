function vrc --wraps='nvim ~/.config/nvim/init.vim' --wraps='nvim ~/.config/nvim/nvim-init.vim' --description 'alias vrc=nvim ~/.config/nvim/init.vim'
  nvim ~/.config/nvim/init.vim $argv; 
end
