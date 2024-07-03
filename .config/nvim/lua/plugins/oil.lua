return {
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('oil').setup {
				columns = { 'icon' },
				keymaps = {
					['<C-h>'] = false,
					['<C-l>'] = false,
					['<C-p>'] = false,
					['<C-s>'] = false,
				},
				view_options = {
					show_hidden = true,
				}
			}

			-- Open parent directory in current window
			vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })
		end,
	},
}
