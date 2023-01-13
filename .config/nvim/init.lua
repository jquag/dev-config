local cmd = vim.cmd
local opts = { noremap = true, silent = true }
local Plug = vim.fn['plug#']

-------------
-- plugins --
-------------
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'RRethy/vim-illuminate'
Plug 'michaeljsmith/vim-indent-object'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'klen/nvim-test'
-- Plug 'vim-test/vim-test'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'anuvyklack/pretty-fold.nvim'
Plug 'folke/trouble.nvim'
Plug 'williamboman/mason.nvim'
Plug 'voldikss/vim-floaterm'

--Autoclosing tags and delims
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

--Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

--Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

--Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'

--Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

--Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

--Debugger
Plug 'mfussenegger/nvim-dap'

vim.call('plug#end')

vim.g.mapleader = ','

require('core.globals').config()
require('core.options').config()
require('core.mappings').config()
require('core.autocommands').config()
require('plugins.lsp').config()
require('plugins.nvim-tree').config()
require('plugins.telescope').config()

require('nvim-web-devicons').get_icons()


-- nvim-test
 vim.v['test#strategy'] = 'neovim'
 require('nvim-test').setup({})
 require('nvim-test.runners.jest'):setup {
   command = "jest",                                       -- a command to run the test runner
   args = { "--collectCoverage=false" },                                       -- default arguments
   env = { CUSTOM_VAR = 'value' },                                             -- custom environment variables

   file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",   -- determine whether a file is a testfile
   find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },                  -- find testfile for a file

   filename_modifier = nil,                                                    -- modify filename before tests run (:h filename-modifiers)
   working_directory = nil,                                                    -- set working directory (cwd by default)
 }

-- vim.g['test#strategy'] = 'neovim'
-- vim.g['test#neovim#start_normal'] = 1
-- vim.g['test#basic#start_normal'] = 1

----------------------
-- pretty-fold.nvim --
----------------------
require('pretty-fold').setup {
  sections = {
    left = {
      'content', '    ', 'number_of_folded_lines', ': ', 'percentage', ' ',
    },
    right = {}
  },
  fill_char = ' '
}


---------------------------------
-- nvim-autopairs / ts-autotag --
---------------------------------
require('nvim-autopairs').setup {}


----------------------------
-- indent blankline setup --
----------------------------
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = false,
}
vim.cmd('highlight IndentBlanklineContextChar guifg=#88aeb2 gui=nocombine')


------------------
-- trouble.nvim --
------------------
require('trouble').setup {
  mode = 'document_diagnostics',
}

-- enable jumping between <tags></tags> with %
cmd([[runtime macros/matchit.vim]])


-------------------
-- lualine setup --
-------------------
-- local theme = 'auto'
local theme = require('lualine.themes.gruvbox')
theme.normal.a.bg = '#bbd8e8'
require('lualine').setup({
  options = {
    theme = theme,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    }
  }
})

-----------------
-- code fences --
-----------------
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}


----------------
-- lsp config --
----------------

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions({})<cr>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references({})<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-p>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end


local cmp = require'cmp'

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
          { name = 'buffer' },
      },
  })

  cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'vsnip' },
      }, {
        { name = 'cmdline' }
     })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local lspconfig = require('lspconfig')

  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  local servers = { 'tsserver', 'svelte', 'vuels', 'cssls', 'gdscript' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  lspconfig['elixirls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "/Users/johnq/bin/elixir-ls/language_server.sh" },
  }

  lspconfig['jdtls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "jdtls" },
  }

  lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }
    }, {
      { name = 'buffer' },
    })
  })

-------------------------------------
-- mason.nvim (lsp server manager) --
-------------------------------------
require('mason').setup {}


---------------------
-- nvim-treesitter --
---------------------
require('nvim-treesitter.configs').setup {
  autotag = {
    enable = true,
  },
  ensure_installed = 'all',
  ignore_install = {
    "phpdoc", "tree-sitter-phpdoc", "blueprint", "jsonc", "fusion"
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = {
    enable = true,
  },
}

-- colorizer
require 'colorizer'.setup {
  'css';
  'scss';
  'javascript';
  html = {
    mode = 'foreground';
  }
}


-- Debugger
local dap = require('dap')

dap.adapters.mix_task = {
  type = 'executable',
  command = '/Users/johnq/bin/elixir-ls/debugger.sh',
  args = {}
}

dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = "test",
    taskArgs = {"--trace", "${relativeFile}"},
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "${relativeFile}"
    }
  },
}

--dap.configurations.elixir = {
--    {
--      type= "mix_task",
--      name= "phx.server",
--      request= "launch",
--      task= "phx.server",
--      projectDir= "${workspaceFolder}"
--    }
--}


vim.cmd("au BufNewFile,BufRead ~/dev/personal/robo-budget/* let b:db='postgres://robobudget:letmein@localhost:5444/robobudget'")

