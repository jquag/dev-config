local function send_to_agent(tool, text)
	vim.fn.system({ 'agent-jump', tool, '-d', '.', '-k', text })
	if vim.v.shell_error ~= 0 then
		vim.fn.setreg('+', text)
		vim.notify('No ' .. tool .. ' pane found; copied to clipboard: ' .. text, vim.log.levels.WARN)
	end
end

function SendAiReference(tool, prefix)
	local file_path = vim.fn.expand('%:.')
	if file_path == '' then
		print('No file open')
		return
	end

	local reference = (prefix or '') .. '@' .. file_path
	send_to_agent(tool, reference)
end

function SendAiRefWithLineRange(tool, prefix)
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
		reference = (prefix or '') .. '@' .. file_path .. '#L' .. start_line .. ' '
	else
		reference = (prefix or '') .. '@' .. file_path .. '#L' .. start_line .. '-' .. end_line .. ' '
	end

	send_to_agent(tool, reference)
end
