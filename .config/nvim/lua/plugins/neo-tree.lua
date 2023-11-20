local M = {}

M.config = function()
  require('window-picker').setup {}
  require('neo-tree').setup {
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
      follow_current_file = true,
      filtered_items = {
        -- hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules"
        }
      },
    },
    event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd [[
          setlocal number
          setlocal relativenumber
        ]]
      end,
    }
  },
  }
end

return M
