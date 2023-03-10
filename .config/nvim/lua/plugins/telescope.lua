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
      find_files = {
        hidden = true,
        mappings = {
          n = {
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          },
          i = {
            ["<C-c>"] = "close",
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
          }
        },
      },
      buffers = {
        mappings = {
          n = {
            ["dd"] = "delete_buffer",
          }
        },
        sort_mru = true,
        initial_mode = "insert",
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
-- set('n', '<leader>g', '<cmd>lua require("plugins.telescope").changed_on_branch()<cr>', opts)
set('n', '<leader>b', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
set('n', '<leader>h', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
set('n', '<leader>s', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
set('n', '<leader>k', '<cmd>lua require("telescope.builtin").quickfix()<cr>', opts)


return M
