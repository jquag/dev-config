set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set timeoutlen=1000
set ttimeoutlen=10
set tabstop=2
set shiftwidth=2
set expandtab
set rnu
set nu
set ignorecase
set mouse=nvi
set clipboard=unnamed
set signcolumn=yes
set cursorline
set shell=/bin/bash

" au TextYankPost * silent! lua vim.highlight.on_yank()

if (has("termguicolors"))
    set termguicolors
endif
" set notermguicolors

" ensure vim plug is installed
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS
" --------------------------------------------------
call plug#begin(stdpath('data') . '/plugged')
"
" General
Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish' " coerice word coversions crs, crc, etc
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dadbod'
Plug 'easymotion/vim-easymotion'
Plug 'nvim-lualine/lualine.nvim' " status line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'RRethy/vim-illuminate' " highlight same words under cursor
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'tpope/vim-dispatch'
"Plug 'vim-test/vim-test'
Plug 'klen/nvim-test'
Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'anuvyklack/pretty-fold.nvim'

" Autoclosing tags and delims
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'folke/tokyonight.nvim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'

" Languages
" Plug 'elixir-editors/vim-elixir'
Plug 'leafOfTree/vim-svelte-plugin'

" Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Debugger
Plug 'mfussenegger/nvim-dap'

Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'folke/trouble.nvim'

call plug#end()

set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

filetype plugin indent on

let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_visual = 'reverse'
highlight CursorLine guibg=#3f3d3b
colorscheme gruvbox-material

" PLUGIN SETTINGS

let g:loaded_matchparen = 1
let g:markdown_folding = 1

let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
let NERDTreeQuitOnOpen = 1

let g:vim_svelte_plugin_use_typescript = 1

let test#strategy = "neovim"
" let g:test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|coffee|ts|tsx)$'
" let g:test#javascript#jest#file_pattern = '\v.*\.test\.(js|jsx|coffee|ts|tsx)$'
"
lua <<EOF
  require('nvim-test').setup()
  require('nvim-test.runners.jest'):setup {
    command = "jest",                                       -- a command to run the test runner
    args = { "--collectCoverage=false" },                                       -- default arguments
    env = { CUSTOM_VAR = 'value' },                                             -- custom environment variables

    file_pattern = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|coffee|ts|tsx)$",   -- determine whether a file is a testfile
    find_files = { "{name}.test.{ext}", "{name}.spec.{ext}" },                  -- find testfile for a file

    filename_modifier = nil,                                                    -- modify filename before tests run (:h filename-modifiers)
    working_directory = nil,                                                    -- set working directory (cwd by default)
  }
EOF
lua require('nvim-autopairs').setup{}

" nvim-tree

lua << END
require'nvim-tree'.setup {
  view = {
    adaptive_size = true,
    centralize_selection = true,
    width = 40,
    height = 40,
    number = true,
    relativenumber = true,
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    add_trailing = true,
    icons = {
      glyphs = {
        git = {
          untracked = "*",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = true,
    custom = {},
    exclude = {},
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = false,
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
}
END

" Pretty Fold
lua << END
require('pretty-fold').setup{
    sections = {
      left = {
         'content',
      },
      right = {'number_of_folded_lines', ': ', 'percentage', ' ',}
   },
    fill_char = ' '
}
END

" Lualine setup

lua << END
require('lualine').setup({
    sections = {
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        }
    },
})
END

lua << END
require("indent_blankline").setup({
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
})
END

" Treesitter Config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = { enable = true },

  textobjects = { enable = true },

  indent = { enable = true },
}
EOF

lua <<EOF
require 'colorizer'.setup {
  'css';
  'scss';
  'javascript';
  html = {
    mode = 'foreground';
  }
}
EOF

set completeopt=menu,menuone,noselect

lua <<EOF
require("trouble").setup {}
EOF

" TELESCOPE SETUP
lua <<EOF
local M = {}
local CONFIG_PATH = vim.fn.stdpath('config')

M.config = function()
    local trouble = require('trouble.providers.telescope')
    require('telescope').setup({
        defaults = {
            layout_strategy = 'horizontal',
            path_display={'truncate'},
            layout_config = {
                prompt_position = 'top',
                height = 0.7,
            },
            sorting_strategy = 'ascending',
            mappings = {
                n = {
                    ["o"] = "select_default",
                    ["q"] = "close",
                    ["t"] = trouble.open_with_trouble,
                },
            }
        },
        pickers = {
            buffers = {
                mappings = {
                    n = {
                        ["dd"] = "delete_buffer",
                    }
                },
                sort_mru = true,
            },
            lsp_definitions = {
                initial_mode = "normal",
            }
        }
    })

end

M.changed_on_branch = function()
    local previewers = require('telescope.previewers')
    local pickers = require('telescope.pickers')
    local sorters = require('telescope.sorters')
    local finders = require('telescope.finders')
    local script = CONFIG_PATH .. '/scripts/git-branch-modified.fish'

    pickers.new({
        results_title = 'Modified on current branch',
        finder = finders.new_oneshot_job({ script, 'list' }, {}),
        sorter = sorters.get_fuzzy_file(),
        previewer = previewers.new_termopen_previewer({
            get_command = function(entry)
                return { script, 'diff', entry.value }
            end
        }),
        initial_mode = "normal",
    }, {}):find()
end

function vim.getVisualSelection()
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg('v')
        vim.fn.setreg('v', {})

        text = string.gsub(text, "\n", "")
        if #text > 0 then
                return text
        else
                return ''
        end
end

-- mappings
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
set('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references({initial_mode="normal", ignore_filename=true})<cr>', opts)
set('n', '<leader>o', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
set('v', '<leader>o', function ()
    local text = vim.getVisualSelection()
    require('telescope.builtin').find_files({default_text = text})
end, opts)
set('n', '<leader>f', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
set('v', '<leader>f', function ()
    local text = vim.getVisualSelection()
    require('telescope.builtin').live_grep({default_text = text})
end, opts)
set('n', '<leader>g', '<cmd>lua require("plugins.telescope").changed_on_branch()<cr>', opts)
set('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
set('n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
set('n', '<leader>s', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
set('n', '<leader>k', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opts)

M.config()
EOF

" null-ls
lua <<EOF
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.eslint_d
    }
})
EOF


" LSP
lua <<EOF
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
  local servers = { 'tsserver', 'svelte', 'vuels', 'cssls' }
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

EOF

" Debugger
lua <<EOF
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

EOF

" MAPPINGS
" --------------------------------------------------
let mapleader=","

" nnoremap <leader>t :NERDTreeFind<cr>
nnoremap <leader>t :NvimTreeToggle<cr>

" Make split wider/narrower
nnoremap + <c-w>5>
nnoremap _ <c-w>5<
nnoremap <leader>w+ <c-w>10+
nnoremap <leader>w- <c-w>10-
" nnoremap <leader>w+ <c-w>20+
" nnoremap <leader>w- <c-w>20-

nnoremap <leader><esc> <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>

" nnoremap <leader>o :FZF<enter>
" nnoremap <leader>f :RG<enter>

" nnoremap <leader>o :Telescope find_files<cr>
" nnoremap <leader>f :Telescope live_grep<cr>
" nnoremap <leader>b :Telescope buffers<cr>
" nnoremap <leader>s :Telescope lsp_document_symbols<cr>
" nnoremap <leader>s :lua require("telescope.builtin").treesitter()<cr>


" Move between panes
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <leader>wi <c-w>W
noremap <leader>wp <c-w>p

" tabs
nnoremap <silent> <c-f> :tabnext<cr>
nnoremap <silent> <c-b> :tabprev<cr>
nnoremap <silent> ]t :tabnext<cr>
nnoremap <silent> [t :tabprev<cr>

" buffers
nnoremap <silent> <leader>q :bd<cr>
nnoremap <silent> <leader>Q :%bd<cr>

" Git
" nnoremap <silent> <leader>gg :Git<cr><c-w>T
" nnoremap <silent> <leader>ga :Git add -A<cr>
" nnoremap <silent> <leader>gc :Git commit<cr>
" nnoremap <silent> <leader>gp :Git push<cr>
" nnoremap <silent> <leader>gb :Git blame<cr>
" nnoremap <silent> <leader>gs :Git status<cr>


" Moving with scroll
nnoremap L Lzz
nnoremap H Hzz
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

" Testing
nnoremap <silent> <leader>rr :TestNearest<cr>
nnoremap <silent> <leader>rl :TestLast<cr>


" Fuzzy Finder
"
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" This function makes ripgrepping behave like how finding in jetbrains works
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Terminal
tnoremap <C-\><C-\> <C-\><C-n>

" Debugger
map <leader>db :lua require'dap'.toggle_breakpoint()<CR>
map <leader>dd :lua require'dap'.terminate()<CR>:lua require'dap'.continue()<CR>:lua require'dap'.repl.open()<CR><c-w>j
map <leader>dc :lua require'dap'.continue()<CR>
map <leader>dr :lua require'dap'.repl.open()<CR>
map <leader>dq :lua require'dap'.repl.close()<CR>:lua require'dap'.terminate()<CR>
map <leader>dn :lua require'dap'.step_over()<CR>
map <leader>di :lua require'dap'.step_into()<CR>
map <leader>do :lua require'dap'.step_out()<CR>


command! GA Git add --all
command! GC Git commit
command! GP Git push


" Snippets
"   Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

au BufNewFile,BufRead *.sql nnoremap <c-e> vip:DB<enter>
au BufNewFile,BufRead *.sql vnoremap <c-e> :DB<enter>
au BufNewFile,BufRead *.sql inoremap <c-e> <esc>vip:DB<enter>

" Project specific

au BufNewFile,BufRead ~/dev/waypointr-app/* let b:db='postgres://waypointr_user:db_password@localhost:5432/waypointr_dev'
au BufNewFile,BufRead ~/dev/personal/robo-budget/* let b:db='postgres://robobudget:letmein@localhost:5444/robobudget'
