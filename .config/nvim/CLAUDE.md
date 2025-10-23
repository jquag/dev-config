# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a sophisticated Neovim configuration using Lua with a modular structure:

- **Entry Point**: `init.lua` bootstraps lazy.nvim and loads core modules
- **Core Configuration**: `lua/core/` contains essential Neovim settings (options, mappings, autocommands, globals)
- **Plugin Management**: `lua/plugins/` with individual plugin configuration files using lazy.nvim
- **Custom Utilities**: `lua/custom/` contains personal helper functions that auto-load via `init.lua`
- **Shared Utils**: `lua/utils.lua` provides common utility functions

## Plugin Management

Uses **lazy.nvim** as the plugin manager. Plugin versions are locked in `lazy-lock.json` for reproducibility.

Key plugin categories:
- **LSP**: nvim-lspconfig with 15+ language servers (TypeScript, Go, Rust, Python, etc.)
- **Completion**: nvim-cmp with LSP, buffer, path, and snippet sources
- **File Navigation**: telescope.nvim with live grep args extension
- **Testing**: neotest with Go, Jest, Playwright, and Vitest adapters
- **Git**: vim-fugitive, vim-gitgutter, snacks.nvim (lazygit integration)
- **Debugging**: nvim-dap with Go debugger support

## Key Configuration Details

### Leader Key and Mappings
- **Leader**: `,` (comma)
- **Testing**: `<space>t*` mappings for neotest operations
- **LSP**: `gd` (definition), `gr` (references), `<space>f` (format), `<space>c` (code actions)
- **Custom**: `<leader>d` opens todo list in floating window

### Custom Functions
- **`Todo()`**: Opens `.todo.md` in floating window (mapped to `<leader>d`)
- **`OpenFileInFloatingWindow()`**: Creates floating windows for file editing
- **Remote clipboard utilities**: yankremote.lua for cross-system clipboard operations

### Language Support
Comprehensive LSP setup for: TypeScript/JavaScript (with inlay hints), Vue, Svelte, Lua, Go, CSS, Python, Tailwind, Elixir, C/C++, Java, Rust, PHP.

## Development Workflow

### Testing
- Use neotest with `<space>t` mappings
- Supports Go, Jest, Playwright, and Vitest test frameworks
- Run tests at file, function, or project level

### Formatting and Linting
- LSP-based formatting with `<space>f`
- ESLint integration via none-ls
- Mason manages LSP servers, formatters, and linters

### File Navigation
- `<leader>o` for file finder
- `<leader>f` for live grep with args
- `<leader>b` for buffer switching
- Neo-tree and Oil for file exploration

## Important Files to Understand

When making changes:
1. **`lua/core/mappings.lua`**: Contains all key mappings - critical for understanding workflow
2. **`lua/plugins/lsp.lua`**: LSP configuration with language-specific settings
3. **`lua/custom/init.lua`**: Auto-loads custom utilities
4. **`lazy-lock.json`**: Plugin version locks - commit changes to this file when updating plugins

## Theme and UI

Currently uses Catppuccin Mocha theme. Alternative themes (Kanagawa, Tokyo Night, Gruvbox Material, Everforest) are available but disabled in `lua/plugins/colorschemes.lua`.