M = {}

local bset = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

M.config = function()
  require('null-ls').setup {
    sources = {
      require('null-ls').builtins.diagnostics.eslint.with({
        condition = function(utils)
          return utils.root_has_file('package.json')
        end
      }),
      require('null-ls').builtins.formatting.pg_format
      -- require('null-ls').builtins.formatting.prettierd,
    },
    on_attach = function(client, bufnr)
      bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    end
  }
end

return M
