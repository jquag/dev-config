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
  opt.tabstop = 2
  opt.shiftwidth = 2
  opt.expandtab = false
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
  cmd('highlight LineNr guifg=#abb3b8')
end

return M
