function OpenFileInFloatingWindow(filepath, widthPercent, heightPercent, qToSaveAndClose)
	qToSaveAndClose = qToSaveAndClose or true

	local buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer

	local width = math.floor(vim.o.columns * widthPercent)
	local height = math.floor(vim.o.lines * heightPercent)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local opts = {
		style = "minimal",
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		border = "rounded"
	}
	local win = vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_command("edit " .. filepath)
	vim.api.nvim_win_set_option(win, 'number', true)
	vim.api.nvim_win_set_option(win, 'relativenumber', true)

	if qToSaveAndClose then
	vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':wq<CR>', { noremap = true, silent = true })
	end
end

function FileExists(filepath)
	local uv = vim.loop
	local stat = uv.fs_stat(filepath)
	return stat ~= nil
end
