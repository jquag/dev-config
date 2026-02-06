local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
for _, file in ipairs(vim.fn.readdir(current_dir, [[v:val =~ '\.lua$' && v:val != 'init.lua']])) do
	-- Strip the .lua extension and require the module
	local module_name = file:sub(1, -5)
	require("custom." .. module_name)
end
