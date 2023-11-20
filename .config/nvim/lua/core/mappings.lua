local M = {}

function M.config()
  local set = vim.api.nvim_set_keymap
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

  -- neo-tree
  set('n', '<leader>t', ':Neotree toggle reveal reveal_force_cwd<cr>', opts)

  -- trouble
  -- set('n', '<leader>xx', ':TroubleToggle<cr>', opts)
  -- set('n', '<leader>xw', ':Trouble workspace_diagnostics<cr>', opts)
  -- set('n', '<leader>xd', ':Trouble document_diagnostics<cr>', opts)

  set('n', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)
  set('v', '<leader>jf', ":'<,'>!python3 -m json.tool<cr>", opts)

  -- Debugger
  set('n', '<space>db', ":lua require'dap'.toggle_breakpoint()<CR>", opts)
  -- set('n', '<space>dd', ":lua require'dap'.terminate()<CR>:lua require'dap'.continue()<CR>:lua require'dap'.repl.open()<CR><c-w>j", opts)
  set('n', '<space>dd', ":lua require'dap'.continue()<CR>", opts)
  set('n', '<space>dr', ":lua require'dap'.repl.open()<CR>", opts)
  set('n', '<space>dq', ":lua require'dap'.repl.close()<CR>:lua require'dap'.terminate()<CR>", opts)
  set('n', '<space>dn', ":lua require'dap'.step_over()<CR>", opts)
  set('n', '<space>di', ":lua require'dap'.step_into()<CR>", opts)
  set('n', '<space>do', ":lua require'dap'.step_out()<CR>", opts)

  set('n', '<X1Mouse>', "<C-o>", opts)

  -- floaterm
  vim.g.floaterm_width = 0.95
  vim.g.floaterm_height = 0.95
  set('n', '<leader>g', ':FloatermNew lazygit<CR>', opts)

  set('n', '<leader>q', ':FloatermNew tui-do<CR>', opts)

  --testing
  vim.keymap.set('n', '<space>ts', '<Cmd>lua require("neotest").summary.toggle()<CR>')
  vim.keymap.set('n', '<space>to', '<Cmd>lua require("neotest").output_panel.toggle()<CR>')
  vim.keymap.set('n', '<space>ta', '<Cmd>lua require("neotest").run.run(vim.fn.getcwd())<CR>')
  vim.keymap.set('n', '<space>tn', '<Cmd>lua require("neotest").run.run()<CR>')
  vim.keymap.set('n', '<space>tt', '<Cmd>lua require("neotest").run.run_last()<CR>')
end

return M
