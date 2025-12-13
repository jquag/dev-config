# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

Neovim configuration using Lua with a modular structure:

- **Entry Point**: `init.lua` bootstraps lazy.nvim, sets leader key (`,`), loads core modules and custom utilities
- **Core Configuration**: `lua/core/` - options, mappings, autocommands, globals (loaded in that order)
- **Plugin Specs**: `lua/plugins/` - individual lazy.nvim plugin configuration files
- **Custom Utilities**: `lua/custom/` - auto-loaded personal helper functions
- **Shared Utils**: `lua/utils.lua` - common utility functions (JSON parsing, path shortening, etc.)

## Plugin Management

Uses **lazy.nvim**. Plugin versions locked in `lazy-lock.json`.

Key categories:
- **LSP**: nvim-lspconfig with Mason for server management
- **Completion**: nvim-cmp (LuaSnip > LSP > buffer > path priority)
- **File Navigation**: telescope.nvim with live grep args, neo-tree (floating), oil.nvim
- **Testing**: neotest with Go, Jest, Playwright, Vitest adapters
- **Git**: vim-fugitive, vim-gitgutter, snacks.nvim (lazygit via `<leader>g`)
- **Debugging**: nvim-dap with Go and JavaScript/TypeScript support

## Key Mappings Reference

### Leader (`,`) Mappings
| Key | Action |
|-----|--------|
| `<leader>o` | Find files (opens dirs in Oil) |
| `<leader>f` | Live grep with args |
| `<leader>b` | Buffer picker |
| `<leader>t` | Toggle neo-tree |
| `<leader>d` | Todo list (floating `.todo.md`) |
| `<leader>g` | Lazygit |
| `<leader>z` | Zen mode |
| `<leader>ih` | Toggle inlay hints |
| `<leader>c` | Copy Claude reference (`@path`) |
| `<leader>jf` | Format JSON (visual) |

### Space Mappings
| Key | Action |
|-----|--------|
| `<space>f` | Format (LSP) |
| `<space>c` | Code actions |
| `<space>rn` | Rename |
| `<space>e` | Show diagnostics |
| `<space>ts` | Test summary |
| `<space>tn` | Run nearest test |
| `<space>ta` | Run all tests |
| `<space>bb` | Toggle breakpoint |
| `<space>dc` | Debug continue |
| `<space>a` | Add to Harpoon |
| `<space>mm` | Harpoon picker |

### LSP Navigation
`gd` (definition), `gr` (references), `gt` (type definition), `gi` (implementation), `K` (hover)

## Custom Utilities

Located in `lua/custom/`, auto-loaded by `custom/init.lua`:

- **todo.lua**: `Todo()` - floating window for `.todo.md`
- **windowutil.lua**: `OpenFileInFloatingWindow()` - reusable floating window creator
- **claude_reference.lua**: Copy file references with optional line ranges
- **numberutils.lua**: `:Sum` and `:Avg` commands for selected numbers
- **yankremote.lua**: Cross-system clipboard operations

## Important Files

1. **`lua/core/mappings.lua`**: All key mappings
2. **`lua/plugins/lsp.lua`**: LSP config including TypeScript inlay hints and none-ls setup
3. **`lua/plugins/init.lua`**: Base plugins and nvim-cmp completion config
4. **`lua/custom/init.lua`**: Auto-loader for custom modules
5. **`lazy-lock.json`**: Plugin version locks (commit when updating plugins)

## Configuration Conventions

- Plugin specs return tables directly (no separate config files)
- Global functions for custom commands (e.g., `Todo`, `CopyClaudeReference`)
- Buffer-local keymaps via `nvim_buf_set_keymap`
- `CONFIG_PATH` global variable available for path references
- Tabs: 2 spaces, no expansion (`tabstop=2, expandtab=false`)

## Theme

Catppuccin Mocha (active). Alternatives available but disabled in `lua/plugins/colorschemes.lua`.