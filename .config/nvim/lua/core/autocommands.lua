local M = {}

M.config = function()
  -- vim.cmd('au BufRead * autocmd BufWinEnter * ++once normal! zx zR')
  vim.cmd("au BufEnter * if &buftype == 'help' && winwidth(0) == &columns | wincmd L | endif")

  vim.cmd("au BufNewFile,BufRead *.sql nnoremap <c-e> vip:DB<enter>")
  vim.cmd("au BufNewFile,BufRead *.sql vnoremap <c-e> :DB<enter>")
  vim.cmd("au BufNewFile,BufRead *.sql inoremap <c-e> <esc>vip:DB<enter>")
end

return M
