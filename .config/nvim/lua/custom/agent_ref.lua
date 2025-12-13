function SendAiReference(tool)
	local file_path = vim.fn.expand('%:.')
	if file_path == '' then
		print('No file open')
		return
	end

	local reference = '@' .. file_path
	vim.fn.system({ 'tmux-jump', tool, '-k', reference })
end

function SendAiRefWithLineRange(tool)
	local file_path = vim.fn.expand('%:.')
	if file_path == '' then
		print('No file open')
		return
	end

	local start_pos = vim.fn.getpos("v")
	local end_pos = vim.fn.getpos(".")
	local start_line = math.min(start_pos[2], end_pos[2])
	local end_line = math.max(start_pos[2], end_pos[2])

	local reference
	if start_line == end_line then
		reference = '@' .. file_path .. '#L' .. start_line .. ' '
	else
		reference = '@' .. file_path .. '#L' .. start_line .. '-' .. end_line .. ' '
	end

	vim.fn.system({ 'tmux-jump', tool,  '-d', '.', '-k', reference })
end

