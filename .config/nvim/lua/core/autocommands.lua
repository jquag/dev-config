local M = {}

M.config = function()
  vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function(args)
      -- starts the syntax highlighting
      pcall(vim.treesitter.start)

      -- Recompute folds after parser has time to process
      vim.defer_fn(function()
        if not vim.api.nvim_buf_is_valid(args.buf) then return end

        -- make sure it's a valid buffer type (not terminals, quickfix, help, etc.)
        if vim.bo[args.buf].buftype ~= '' then return end

        if vim.wo.foldmethod == 'expr' then
          pcall(vim.cmd, 'normal! zx')
        end
      end, 100)
    end,
  })

  -- vim.cmd('au BufRead * autocmd BufWinEnter * ++once normal! zx zR')
  vim.cmd("au BufEnter * if &buftype == 'help' && winwidth(0) == &columns | wincmd L | endif")

  vim.cmd("au BufNewFile,BufRead *.sql nnoremap <c-e> vip:DB<enter>")
  vim.cmd("au BufNewFile,BufRead *.sql vnoremap <c-e> :DB<enter>")
  vim.cmd("au BufNewFile,BufRead *.sql inoremap <c-e> <esc>vip:DB<enter>")
end

return M
