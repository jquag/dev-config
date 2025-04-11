local M = {}

function M.config()
  local set = vim.keymap.set
  local opts = { noremap = true, silent = true }

  set('i', '<c-j>', '<esc>', opts)

  -- local wk = require('which-key')

  -- general mappings
  set('n', '<leader><esc>', ':noh<cr>', opts)

  -- jump to normal mode in terminal
  set('t', '<c-\\><c-\\>', '<c-\\><c-n>', opts)

  -- navigation and search
  set('n', 'L', 'Lzz', opts)
  set('n', 'H', 'Hzz', opts)
  set('n', '<c-d>', '<c-d>zz', opts)
  set('n', '<c-u>', '<c-u>zz', opts)
  -- set('n', '<leader>,', ',', opts)
  set('n', '<c-n>', '<c-^>', opts)

  -- window management
  set('n', '<c-h>', '<c-w>h', opts)
  set('n', '<c-j>', '<c-w>j', opts)
  set('n', '<c-k>', '<c-w>k', opts)
  set('n', '<c-l>', '<c-w>l', opts)

  -- quickfix
  set('n', '[q', ':cp<cr>zz', opts)
  set('n', ']q', ':cn<cr>zz', opts)

  -- tab management
  set('n', '[t', ':tabp<cr>', opts)
  set('n', ']t', ':tabn<cr>', opts)

  -- resize splits
  -- (vertical)
  set('n', '_', '5<c-w><', opts)
  set('n', '+', '5<c-w>>', opts)
  -- (horizontal)
  set('n', '<c-w><c-_>', '5<c-w>-', opts)
  set('n', '<c-w><c-=>', '5<c-w>+', opts)

  -- buffers
  -- set('n', '<c-f>', ':bn<cr>', opts)
  -- set('n', '<c-b>', ':bp<cr>', opts)

  -- trouble
  -- set('n', '<leader>xx', ':TroubleToggle<cr>', opts)
  -- set('n', '<leader>xw', ':Trouble workspace_diagnostics<cr>', opts)
  -- set('n', '<leader>xd', ':Trouble document_diagnostics<cr>', opts)

  set('n', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)
  set('v', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)

  set('n', '<X1Mouse>', "<C-o>", opts)

	-- lazy.nvim
  set('n', '<leader>l', '<Cmd>Lazy<CR>', opts)

	----------------
  -- inlay hints
  ----------------
  set('n', '<leader>ih', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, opts)

  --testing
  vim.keymap.set('n', '<space>ts', '<Cmd>lua require("neotest").summary.toggle()<CR>')
  vim.keymap.set('n', '<space>to', '<Cmd>lua require("neotest").output_panel.toggle()<CR>')
  vim.keymap.set('n', '<space>ta', '<Cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>')
  vim.keymap.set('n', '<space>tn', '<Cmd>lua require("neotest").run.run()<CR>')
  vim.keymap.set('n', '<space>tt', '<Cmd>lua require("neotest").run.run_last()<CR>')

  set('n', '<c-f>', '<Cmd>silent !tmux neww tmux-sessionizer<CR>', opts)

	--harpoon
	set('n', '<space>a', '<Cmd>lua require("harpoon.mark").add_file()<CR>', opts)

	-- todo-list
	set('n', '<leader>d', '<Cmd>:lua Todo()<CR>')
end

return M
