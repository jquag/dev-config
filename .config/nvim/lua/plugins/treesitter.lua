return {
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup {

				ensure_installed = 'all',
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = function(_, bufnr)
						local buf_name = vim.api.nvim_buf_get_name(bufnr)
						local num_of_lines = vim.api.nvim_buf_line_count(bufnr)
						return num_of_lines > 50000
					end
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<cr>',
						node_incremental = '<cr>',
						scope_incremental = '<s-cr>',
						node_decremental = '<bs>',
					},
				},
				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
				},
			}
		end,
	}
}
