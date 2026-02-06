vim.api.nvim_create_user_command(
  'Sum',
	function()
		print(Sum())
	end,
  {
		nargs = '?',
		range = true,
	}
)

vim.api.nvim_create_user_command(
  'Avg',
	function()
		print(Avg())
	end,
  {
		nargs = '?',
		range = true,
	}
)

function Avg()
	local sum = Sum()
	local nums = GetVisualSelectionNums()
	return sum / #nums
end

function Sum()
	local lines = GetVisualSelectionNums()
	local sum = 0
	for _, n in ipairs(lines) do
		sum = sum + n
	end
	return sum
end

function GetVisualSelectionNums()
	-- Get the start and end positions of the visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	-- Get the line and column numbers
	local start_line = start_pos[2]
	local start_col = start_pos[3]
	local end_line = end_pos[2]
	local end_col = end_pos[3]

	-- Get the lines within the selection
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	if #lines == 0 then
		return {}
	end

	-- Adjust the first and last lines based on column numbers
	if #lines == 1 then
		lines[1] = string.sub(lines[1], start_col, end_col)
	else
		lines[1] = string.sub(lines[1], start_col)
		lines[#lines] = string.sub(lines[#lines], 1, end_col)
	end


	local nums = {}
	for _, v in ipairs(lines) do
		if tonumber(v) ~= nil then
			nums[#nums + 1] = tonumber(v)
		end
	end

	return nums
end

-- function Open_or_reuse_buffer_in_split(name)
--
--   local function get_base_name(full_path)
--     return vim.fn.fnamemodify(full_path, ':t')
--   end
--
--   -- Function to check if a buffer with the given name exists
--   local function buffer_exists(n)
--     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
-- 			local buf_name = vim.api.nvim_buf_get_name(buf)
--       if get_base_name(buf_name) == n then
-- 				print('buffer exists')
--         return buf
--       end
--     end
--     return nil
--   end
--
--   -- Function to check if the buffer is visible and return the window ID
--   local function get_visible_window_for_buffer(buf)
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--       if vim.api.nvim_win_get_buf(win) == buf then
--         return win
--       end
--     end
--     return nil
--   end
--
--   local buf = buffer_exists(name)
-- 	if buf == nil then
-- 		-- Create a new buffer if it doesn't exist
-- 		buf = vim.api.nvim_create_buf(false, false)  -- Create a new buffer
-- 		vim.api.nvim_buf_set_name(buf, name)  -- Set the buffer name
-- 	end
--
-- 	local win = get_visible_window_for_buffer(buf)
-- 	if win then
-- 		-- Move focus to the window where the buffer is visible
-- 		vim.api.nvim_set_current_win(win)
-- 	else
-- 		vim.cmd('new')  -- Open a new horizontal split
-- 		-- Set the buffer in the new split
-- 		vim.api.nvim_set_current_buf(buf)
-- 	end
-- end
