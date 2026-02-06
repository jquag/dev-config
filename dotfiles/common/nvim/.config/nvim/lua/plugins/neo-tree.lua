return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    config = function()
      require('window-picker').setup()
      require('neo-tree').setup({
        default_component_configs = {
          indent = {
            with_expanders = true,
          },
        },
        window = {
          position = "float",
          mapping_options = {
            noremap = true,
            nowait = true,
          },
					mappings = {
						["o"] = "open_with_window_picker",
						["W"] = "close_all_nodes",
						["z"] = "",
						["/"] = "",
						["<bs>"] = "close_node",
					},
        },
        filesystem = {
          follow_current_file = {
						enabled = true,
					},
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              vim.cmd [[ setlocal relativenumber ]]
            end
          },
        },
      })

      -- mappings
      local set = vim.keymap.set
      local opts = { noremap = true, silent = true }
			set('n', '<leader>t', ':Neotree toggle reveal reveal_force_cwd<cr>', opts)
    end
  },
}
