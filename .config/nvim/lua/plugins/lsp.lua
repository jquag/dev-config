local is_npm_package_installed = require('utils').is_npm_package_installed

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'nvimtools/none-ls.nvim'
		},
		config = function()
			local nvim_lsp = require('lspconfig')
			local bset = vim.api.nvim_buf_set_keymap
			local opts = { noremap = true, silent = true }

			vim.diagnostic.config({ virtual_text = true })

			local on_attach = function(client, bufnr)
				bset(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
				bset(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
				bset(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
				bset(bufnr, 'n', '<c-p>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
				bset(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
				bset(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
				bset(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
				bset(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
				bset(bufnr, 'n', '<space>c', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
				bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				bset(bufnr, 'n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
				bset(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
				bset(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
				bset(bufnr, 'n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
				bset(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				require('illuminate').on_attach(client)
			end

			-- update capabilities with completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			-- choose default formatters for certain lsps
			local with_null_ls_formatter = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				on_attach(client, bufnr)
			end

			local servers = { 'volar', 'ts_ls', 'svelte', 'lua_ls', 'gopls', 'cssls', 'gdscript', 'pyright', 'tailwindcss', 'elixirls', 'clangd', 'jdtls', 'rust_analyzer', 'intelephense' }
			for _, lsp in pairs(servers) do
				local config = {
					on_attach = on_attach,
					flags = {
						debounce_text_changes = 150,
					},
					capabilities = capabilities,
				}

				if lsp == 'elixirls' then
					config.cmd = {"/Users/johnq/.local/share/nvim/mason/bin/elixir-ls"}
				end

				if lsp == 'volar' then
					if is_npm_package_installed 'vue' then
						config.on_attach = with_null_ls_formatter
						-- config.filetypes = { 'typescript', 'javascript', 'vue', 'json' }
					end
				end

				if lsp == 'svelte' then
					config.root_dir = nvim_lsp.util.root_pattern('svelte.config.js')
					-- config.on_attach = with_null_ls_formatter
				end

				if lsp == 'ts_ls' then
					config.settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",   -- 'none' | 'literals' | 'all'
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayVariableTypeHints = true,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHintsWhenTypeMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",   -- 'none' | 'literals' | 'all'
								includeInlayParameterNameHintsWhenArgumentMatchesName = true,
								includeInlayVariableTypeHints = true,

								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHintsWhenTypeMatchesName = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					}

					config.root_dir = function(startpath)
						return nvim_lsp.util.root_pattern('package.json')(startpath)
					end

					config.single_file_support = false
					-- config.on_attach = with_null_ls_formatter
				end

				if lsp == 'lua_ls' then
					config.settings = {
						Lua = {
							runtime = {
								version = 'LuaJIT',
							},
							diagnostics = {
								globals = { 'vim' },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
						},
					}
				end


				if lsp == 'denols' then
					config.root_dir = nvim_lsp.util.root_pattern('deno.json', 'deno.jsonc')
					config.single_file_support = false
					config.on_attach = with_null_ls_formatter
				end

				nvim_lsp[lsp].setup(config)
				::continue::
			end
		end
	},
	{
		'nvimtools/none-ls.nvim',
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local bset = vim.api.nvim_buf_set_keymap
			local opts = { noremap = true, silent = true }
			local null_ls = require('null-ls')

			null_ls.setup {
				sources = {
					-- null_ls.builtins.formatting.prettier,
					-- null_ls.builtins.formatting.sql_formatter,
					require("none-ls.diagnostics.eslint"),
				},
				on_attach = function(client, bufnr)
					bset(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
					bset(bufnr, 'v', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
				end
			}
		end
	},
}
