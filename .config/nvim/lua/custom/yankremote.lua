function YankTargetLine(_)
  -- Save current cursor position
	local orig_pos = _G._yank_orig_pos or vim.api.nvim_win_get_cursor(0)

  local start_pos = vim.fn.getpos("'[")[2]
  local end_pos = vim.fn.getpos("']")[2]

	local line
	if orig_pos[1] == end_pos then
		line = vim.api.nvim_buf_get_lines(0, start_pos - 1, start_pos, false)[1]
	else
		line = vim.api.nvim_buf_get_lines(0, end_pos - 1, end_pos, false)[1]
  end

  vim.fn.setreg('*', line..'\n')

  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, orig_pos)
end

vim.keymap.set('n', 'yr', function()
	_G._yank_orig_pos = vim.api.nvim_win_get_cursor(0)
  vim.go.operatorfunc = 'v:lua.YankTargetLine'
  return 'g@'
end, { expr = true, noremap = true })
