return {
  "epwalsh/obsidian.nvim",
	enabled = false,
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal",
      },
      {
        name = "work",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/My Sketch",
      },
      {
        name = "journal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Journal",
      },
      {
        name = "family",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Family",
      },
    },

    -- see below for full list of options 👇
  },
}
