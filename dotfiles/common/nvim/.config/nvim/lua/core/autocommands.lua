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
end

return M
