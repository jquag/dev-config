local M = {}

M.config = function()
  local cmd = vim.cmd
  local opt = vim.opt

  vim.g.mapleader = ','

  opt.showmode = false
  opt.cursorline = true
  opt.clipboard = 'unnamed'
  opt.ignorecase = true
  opt.smartcase = true
  opt.infercase = true
  opt.number = true
  opt.relativenumber = true
  opt.tabstop = 4
  opt.shiftwidth = 4
  opt.expandtab = true
  opt.foldenable = false
  opt.foldmethod = 'expr'
  opt.foldexpr = 'nvim_treesitter#foldexpr()'
  opt.timeoutlen = 1000
  opt.ttimeoutlen = 10
  opt.termguicolors = true
  opt.mouse = 'nvi'
  opt.signcolumn = 'yes'
  opt.updatetime = 1000
  -- opt.conceallevel = 0
  -- opt.cmdheight = 0
  opt.mousemodel = 'extend'

  vim.g.loaded_matchparen = 1
  vim.g.markdown_folding = 1

  -- color scheme config
  opt.background = 'dark'

  -- GRUVBOX
  -- vim.g.gruvbox_material_background = 'medium'
  -- vim.g.gruvbox_material_visual = 'reverse'
  -- cmd('colorscheme gruvbox-material')
  -- cmd('highlight CursorLine guibg=#3f3d3b')

  -- EVERFOREST
  -- cmd('colorscheme everforest')
  -- cmd('highlight CursorLine guibg=#595959')
  -- cmd('highlight Visual guibg=#636a6e')

  vim.cmd('colorscheme kanagawa-dragon')

  -- vim.cmd('colorscheme desert')

  cmd('highlight LineNr guifg=#abb3b8')

  vim.g.go_def_mode='gopls'
  vim.g.go_info_mode='gopls'
end

return M
