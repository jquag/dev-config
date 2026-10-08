local M = {}

M.config = function()
	vim.api.nvim_create_autocmd('FileType', {
		pattern = '*',
		callback = function(args)
			-- starts the syntax highlighting
			pcall(vim.treesitter.start)
		end,
	})

	-- use lsp fold expression if the lsp client supports text folding for the buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client and client:supports_method("textDocument/foldingRange") then
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.lsp.foldexpr()"
			end
		end
	})

	vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
		callback = function()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			for _, client in ipairs(clients) do
				if client:supports_method('textDocument/documentHighlight') then
					vim.lsp.buf.document_highlight()
					return
				end
			end
		end,
	})

	vim.api.nvim_create_autocmd('CursorMoved', {
		callback = function()
			vim.lsp.buf.clear_references()
		end,
	})

	-- vim.cmd('au BufRead * autocmd BufWinEnter * ++once normal! zx zR')
	vim.cmd("au BufEnter * if &buftype == 'help' && winwidth(0) == &columns | wincmd L | endif")

	vim.cmd("au BufNewFile,BufRead *.sql nnoremap <c-e> vip:DB<enter>")
	vim.cmd("au BufNewFile,BufRead *.sql vnoremap <c-e> :DB<enter>")
	vim.cmd("au BufNewFile,BufRead *.sql inoremap <c-e> <esc>vip:DB<enter>")

	vim.api.nvim_create_autocmd('FileType', {
		pattern = 'markdown',
		callback = function(args)
			local function toggle_checkbox()
				local line = vim.api.nvim_get_current_line()
				local toggled, count = line:gsub('^(%s*%- )%[ %]', '%1[x]', 1)
				if count == 0 then
					toggled, count = line:gsub('^(%s*%- )%[[xX]%]', '%1[ ]', 1)
				end
				if count > 0 then
					vim.api.nvim_set_current_line(toggled)
				end
			end
			vim.keymap.set('n', '<space>x', toggle_checkbox, { buffer = args.buf, silent = true, desc = 'Toggle markdown checkbox' })
			vim.keymap.set('i', '<c-x>', toggle_checkbox, { buffer = args.buf, silent = true, desc = 'Toggle markdown checkbox' })

			vim.keymap.set('i', '<cr>', function()
				if vim.api.nvim_get_current_line():match('^%s*%- %[[ xX]%]') then
					return vim.keycode('<cr>- [ ] ')
				end
				local ok, autopairs = pcall(require, 'nvim-autopairs')
				return ok and autopairs.autopairs_cr() or vim.keycode('<cr>')
			end, { buffer = args.buf, expr = true, replace_keycodes = false, desc = 'Continue markdown checkbox list' })
		end,
	})
end

return M
