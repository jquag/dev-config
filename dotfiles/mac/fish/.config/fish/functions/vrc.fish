function vrc --wraps='nvim ~/.config/nvim/init.vim' --wraps='nvim ~/.config/nvim/nvim-init.vim' --wraps='nvim ~/.config/nvim/init.lua' --description 'alias vrc nvim ~/.config/nvim/init.lua'
  nvim ~/.config/nvim/init.lua --cmd "cd ~/.config/nvim";
end
