local cmd = vim.cmd
local Plug = vim.fn['plug#']

-------------
-- plugins --
-------------
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 's1n7ax/nvim-window-picker'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'numToStr/Comment.nvim'
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
Plug 'nvim-telescope/telescope-live-grep-args.nvim'

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
Plug 'rebelot/kanagawa.nvim'

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
-- Plug 'leoluz/nvim-dap-go'


--Testing
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/neotest'
Plug 'jfpedroza/neotest-elixir'
Plug 'nvim-neotest/neotest-jest'
Plug 'marilari88/neotest-vitest'

Plug 'fatih/vim-go'

Plug 'zbirenbaum/copilot.lua'

vim.call('plug#end')

require('Comment').setup()

require('copilot').setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-y>",
    }
  }
})

require("neotest").setup({
  adapters = {
    require("neotest-elixir")({
      dap = { justMyCode = false },
    }),
    require('neotest-jest')({
      jestCommand = "jest --watch ",
    }),
    require('neotest-vitest')({}),
  },
})

vim.g.mapleader = ','

require('core.globals').config()
require('core.options').config()
require('core.mappings').config()
require('core.autocommands').config()
require('plugins.lsp').config()
require('plugins.neo-tree').config()
require('plugins.telescope').config()

require('nvim-web-devicons').get_icons()

-- nvim-test
 -- vim.v['test#strategy'] = 'neovim'
 -- require('nvim-test').setup({})
 -- require('nvim-test.runners.jest'):setup {
 --   command = "jest",                                       -- a command to run the test runner
 --   args = { "--collectCoverage=false" },                                       -- default arguments
 --   env = { CUSTOM_VAR = 'value' },                                             -- custom environment variables

 --   file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",   -- determine whether a file is a testfile
 --   find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },                  -- find testfile for a file

 --   filename_modifier = nil,                                                    -- modify filename before tests run (:h filename-modifiers)
 --   working_directory = nil,                                                    -- set working directory (cwd by default)
 -- }

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
require("ibl").setup {
}

-- vim.cmd('highlight IndentBlanklineContextChar guifg=#88aeb2 gui=nocombine')


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
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local lspconfig = require('lspconfig')

  -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
  local servers = { 'svelte', 'vuels', 'cssls', 'gdscript', 'gopls', 'terraform_lsp', }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  lspconfig['tailwindcss'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "gohtmltmpl" }
  }

  lspconfig['html'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "gohtmltmpl" }
  }

  lspconfig['tsserver'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern('package.json'),
  }

  lspconfig['denols'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
    single_file_support = false,
  }

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

  lspconfig['jsonls'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  lspconfig.lua_ls.setup {
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
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<cr>',
      node_incremental = '<cr>',
      scode_incremental = '<s-cr>',
      node_decremental = '<bs>',
    }
  },
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
  command = '/Users/johnq/.local/share/nvim/mason/bin/elixir-ls-debugger',
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
  {
    type= "mix_task",
    name= "phx.server",
    request= "launch",
    task= "phx.server",
    projectDir= "${workspaceFolder}"
  }
}

dap.adapters.delve = {
  type = 'server',
  -- port = '${port}',
  port = '2345',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:2345'},
  }
}

-- NOTE: to attach debugger to remote process (for TUI) start the headless debugger from the root of the go app...
-- dlv debug --headless --listen :2345 .

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  },
  {
    name = "My remote debug",
    type = "delve",
    request = "attach",
    mode = "remote",
    remotePath = "${workspaceFolder}",
    port = 2345,
    host = "127.0.0.1"
}
}
-- require('dap-go').setup()

vim.cmd("au BufNewFile,BufRead ~/dev/personal/robo-budget/* let b:db='postgres://robobudget:letmein@localhost:5444/robobudget'")

