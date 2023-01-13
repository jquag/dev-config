M = {}

M.config = function()
  require'nvim-tree'.setup {
    view = {
      adaptive_size = true,
      centralize_selection = true,
      -- width = 40,
      -- height = 40,
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
end

return M
