local M = {}

M.config = function()
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
	opt.foldlevelstart = 99
	opt.foldlevel = 99
  opt.timeoutlen = 1000
  opt.ttimeoutlen = 10
  opt.termguicolors = true
  opt.mouse = 'nvi'
	opt.mousescroll = 'ver:1,hor:6'
  opt.signcolumn = 'yes'
  opt.updatetime = 1000
  -- opt.conceallevel = 0
  -- opt.cmdheight = 0
  opt.mousemodel = 'extend'
	opt.winminwidth = 10 

  vim.g.loaded_matchparen = 1
  -- vim.g.markdown_folding = 1

  -- color scheme config
  opt.background = 'dark'

	opt.exrc = true      -- Allow project-specific config files
	opt.secure = true    -- Restrict commands that are allowed in local config files

	opt.splitbelow = true
	opt.splitright = true

	opt.scrolloff = 5
end

return M
