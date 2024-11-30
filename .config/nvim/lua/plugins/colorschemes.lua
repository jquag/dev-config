return {
  {
    'rebelot/kanagawa.nvim',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme kanagawa')
			vim.cmd('highlight LineNr guifg=#b8b8b8')
			vim.cmd('highlight CursorLine guibg=#3f3d3b')
			vim.cmd('highlight Visual guibg=#666080')
    end
  },
  {
    'catppuccin/nvim',
    name = "catppuccin",
    enabled = false,
  },
  {
    'folke/tokyonight.nvim',
    enabled = false,
    config = function()
      vim.cmd('colorscheme tokyonight-moon')
      vim.cmd('highlight CursorLineNr guifg=orange')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
    end
  },
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_visual = 'reverse'
      vim.cmd('colorscheme gruvbox-material')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end
  },
  {
    'sainnhe/everforest',
    enabled = false,
    config = function()
      vim.g.everforest_background = 'medium'
      vim.cmd('colorscheme everforest')
      vim.cmd('highlight CursorLine guibg=#3f3d3b')
      vim.cmd('highlight LineNr guifg=#5b5b5b')
      vim.cmd('highlight CursorLineNr guifg=orange')
    end
  },
}
