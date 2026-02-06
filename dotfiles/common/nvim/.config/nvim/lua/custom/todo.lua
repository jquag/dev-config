function Todo()
	local is_new_file = not FileExists(".todo.md")
	OpenFileInFloatingWindow(".todo.md", .8, .8)
	if is_new_file then
		print('new file!')
		vim.api.nvim_buf_set_lines(0, 0, -1, false, {
			"# TODO",
			"",
		})
	end
end
