return {
	'nvim-lua/plenary.nvim',
	'mfussenegger/nvim-jdtls',
	{
		'vim-test/vim-test',
		config = function()
			vim.g['test#strategy'] = 'neovim'
			vim.g['test#neovim#start_normal'] = 1
			vim.g['test#basic#start_normal'] = 1
		end,
	},
	{
		'L3MON4D3/LuaSnip',
		config = function()
			require("luasnip.loaders.from_snipmate").lazy_load()
			require('luasnip.loaders.from_vscode').lazy_load()
		end
	},
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
	{
		'hrsh7th/nvim-cmp',
		config = function()
			-- opt.completeopt = menu, menuone, noselect

			local luasnip = require('luasnip')
			local cmp = require('cmp')

			luasnip.setup({
				region_check_events = "CursorMovedI",
			})

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered({
						border = "rounded", -- options: "single", "double", "shadow", "rounded"
					}),
					documentation = cmp.config.window.bordered({
						border = "rounded",
					}),
				},
				preselect = cmp.PreselectMode.None,
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end
				},
				mapping = {
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<Up>'] = cmp.mapping.select_prev_item(),
					['<Down>'] = cmp.mapping.select_next_item(),
					['<C-d>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<C-y>'] = cmp.config.disable,
					['<C-e>'] = cmp.mapping.close(),
					['<CR>'] = cmp.mapping.confirm {
						-- behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
				},
				sources = cmp.config.sources({
					{ name = 'luasnip' },
					{ name = 'nvim_lsp' },
				}, {
					{ name = 'buffer' },
				}),
			})

			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				},
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})
		end
	},
	'RRethy/vim-illuminate',
	{
		'fatih/vim-go',
		enabled = false,
		config = function()
			-- vim.cmd([[:GoUpdateBinaries]])
			-- vim.g.go_def_mode = 'gopls'
			-- vim.g.go_info_mode = 'gopls'
			-- vim.g.go_gopls_enabled = 0
		end,
	},
	'tpope/vim-surround',
	'tpope/vim-repeat',
	'tpope/vim-fugitive',
	'tpope/vim-dotenv',
	'easymotion/vim-easymotion',
	'tpope/vim-dadbod',
	{
		'airblade/vim-gitgutter',
		config = function()
			vim.g.gitgutter_grep = 'rg'
		end
	},
	'michaeljsmith/vim-indent-object',
	{
		'windwp/nvim-autopairs',
		config = true,
	},
	{
		'folke/trouble.nvim',
		opts = { mode = 'document_diagnostics' },
	},
	{
		'zbirenbaum/copilot.lua',
		lazy = true,
		enabled = false,
		event = 'InsertEnter',
		config = function()
			require('copilot').setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<c-y>",
					}
				}
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require('colorizer').setup({
				'css',
				'scss',
				'javascript',
				html = {
					mode = 'foreground',
				}
			})
		end
	},
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"rest-nvim/rest.nvim",
		config = function()
			require('rest-nvim').setup({
				request = {
					-- Skip SSL verification
					skip_ssl_verification = true,
				}
			})
		end,
	},
	{
		'kristijanhusak/vim-dadbod-ui',
		dependencies = {
			{ 'tpope/vim-dadbod',                     lazy = true },
			{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
		},
		cmd = {
			'DBUI',
			'DBUIToggle',
			'DBUIAddConnection',
			'DBUIFindBuffer',
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	'nvim-treesitter/nvim-treesitter-textobjects',
	{
		"folke/noice.nvim",
		enabled = false,
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true,    -- use a classic bottom cmdline for search
					command_palette = true,  -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false,      -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false,  -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<Tab>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-y>",
				},
			})
		end,
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{ "<leader>a",  nil,                              desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
		},
	}
}
