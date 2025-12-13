return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					header = [[
⠀⠀⠀⠀⠀⠀⢀⠀⣀⡀⠀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⣀⠀⡀⠀⢀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠀⠀⠀⡀⠀⣀⢀⡀⡀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠒⠞⠂⠁⠈⠈⢰⠀⡀⠙⣶⣶⡝⣿⣄⠄⣠⣶⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⣴⣦⣴⣤⣤⣀⠀⠀⠀⠸⣿⣿⣿⣿⣷⣆⡰⠁⠘⠟⣜⣰⠗⠁⠀⠀⠀⠀⠀⢀⡀⠀⠀⠔⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣄⡱⣜⠛⢈⣊⣿⣾⣾⣿⣼⣿⣿⣿⣿⣿⣿⣿⣿⡃⠀⠀⣀⡩⠍⢹⣿⠋⡉⢍⡀⠀⠀⢿⣿⣿⣿⣿⣟⣵⣦⠀⡸⣿⠗⠀⣶⠀⢀⣤⡄⣠⠊⡀⠚⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠁⣼⣿⣿⣿⣿⠹⣎⢘⢟⣽⡿⣟⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢀⣳⣾⣾⣿⣿⣤⣧⣧⣿⠀⠀⣾⣿⠟⣫⣷⣦⣹⣭⣠⣿⣿⣿⣀⠀⠀⢈⣿⣥⣁⠐⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣤⡘⠿⣿⠿⠿⡄⣸⣧⣽⡛⢹⠿⠟⠹⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⡈⣿⣿⣿⣿⣟⣩⣿⣿⣿⠀⣰⣿⣿⣶⣾⡻⣫⣿⣿⣏⢇⠲⠸⠿⢇⢆⣿⣿⣿⡷⣀⠀⠐⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⣾⣶⡝⣿⣿⣿⠇⢀⣥⣀⠀⠈⠻⠿⣿⣿⣿⣿⣿⣿⣀⡀⢿⣿⣟⣉⠉⠙⣿⣿⡇⣸⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⡃⣾⣿⡆⠦⢻⣿⡿⢉⠤⠜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠂⣽⣯⢠⢠⣿⣿⣿⣷⣤⡀⠀⠠⠀⠸⣿⣿⣿⣿⠿⠪⣟⢿⣷⣶⡶⠟⠉⣾⣽⡛⠛⠻⠿⣿⣿⣷⠉⠉⠀⣐⡉⠋⠇⠀⢐⣤⣅⢆⠀⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠶⠤⠍⠉⠈⢡⣙⠻⠟⡻⠿⠃⠈⠀⢀⣾⡟⠋⠁⠀⠀⠀⣿⣷⡦⠀⠀⠀⠀⢸⣿⠃⠳⢀⡀⠀⠉⠻⠶⠲⣜⢿⠿⡀⠀⠀⠀⠛⡋⢚⠀⠀⡀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⠉⠉⢭⡩⢉⡩⢍⡍⣍⠍⠉⠉⡇⠁⠈⠀⢁⢀⡔⠉⠀⠀⠀⠀⠀⠀⠀⠻⠿⠉⣡⣼⣆⠰⠋⢁⣔⣡⣿⣷⠀⠀⠀⠀⠈⢈⢳⡀⠀⠁⠀⡏⡭⣍⣭⢩⡭⣩⠍⡭⡍⣍⡍⡇⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢸⠀⠀⠈NEOVIM⡁⠀⠀⡇⠂⠀⠚⢂⡞⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⢀⣼⣿⣿⢿⣿⡟⠀⠀⠀⠀⠀⢨⣷⡝⣄⠀⠀⡇⢓⢋⡓⡘⢁⢛⣂⡓⢋⠋⠃⡇⠀⠀⠀⠀⠀
⠀⢀⣄⡀⠀⠘⠀⠀⣀⣁⣘⠣⢟⣅⢛⡂⠀⠀⡇⡀⢀⡄⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠁⠀⣼⣏⡴⠁⠀⠀⠀⠀⢩⢃⡞⣿⠀⠀⡇⠸⠠⠇⠅⠘⠘⠁⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣀⣐⣒⣒⣒⣖⠀⠀⠀⡰⠆⡇⠀⠀⠀⠀⠋⠂⢀⢸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠂⢀⣾⣿⢟⠅⠀⠀⠀⠀⠀⠀⠎⢸⡞⡇⠀⡇⠀⠀⠀⢐⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢘⣿⣿⣯⣭⣭⣭⣥⣤⠒⠒⠒⠒⠒⠒⠒⠒⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠟⢁⣴⡿⡻⣛⣥⠄⠀⠀⠀⠀⠀⠀⠀⢈⣳⡝⣆⠓⠒⠂⢀⣌⠁⣶⣶⣀⣤⣤⣄⣀⣀⡀⠀⠀⠀
⠀⠈⠉⠉⠉⠉⠉⣭⠉⠁⠀⠠⣮⠉⠭⠀⠰⠀⠀⠀⡯⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣄⠀⠐⠊⠁⣀⡴⠛⢡⣿⡿⢛⣵⡶⣤⣤⡀⠀⠀⠀⢀⣤⣌⣲⡜⣄⠀⠀⠀⠀⣄⣛⣛⠿⠿⠿⣿⣿⠃⠀⢸⡅⠀
⠀⢰⣶⣶⣶⣶⡶⣶⣶⣶⡶⠾⠿⣿⣿⣿⡷⢀⣀⣘⡇⠀⠀⠀⠀⠀⠀⠻⠗⠘⠉⣧⠙⢣⡀⠀⠈⠀⠀⠠⠛⠉⣀⣸⠋⢰⢿⡟⣿⣶⣄⢠⣤⣉⠻⣿⡟⣿⣀⣀⡀⢀⣿⣿⣿⣿⣿⣷⣶⣶⣤⣤⣾⡆⠀
⠀⠘⠛⠛⠛⣻⣚⣛⣛⣛⣀⣀⣀⣉⣩⣉⡍⠀⠉⠉⠱⢀⡤⠤⠤⢠⠀⠀⠀⠂⠀⠸⡄⠀⢻⠂⠤⠤⠤⠄⠀⠊⠈⠉⠀⠈⡿⢠⡿⠀⠀⣿⣽⣿⣶⡟⠼⠋⠉⢡⠀⠉⠉⠉⢛⣛⡻⡿⣿⣿⣿⣿⣿⡇⠀
⠀⠘⠛⠛⠛⠛⢛⣛⣛⣉⣉⣉⣉⣩⣭⣭⡱⠀⠀⠀⢠⡞⠐⠀⠎⠐⢀⠃⠄⠐⠂⠰⠆⠀⣛⠀⠀⠀⠀⠀⠀⠀⣀⠁⠀⠘⠀⠾⠁⠀⣘⣁⠊⠻⡍⠁⠀⠀⠀⠐⠿⣿⣶⣶⣤⣉⠩⣍⣃⣛⡻⠟⠀⡇⠀
⠀⠘⣻⣿⣿⡿⡀⠀⠈⠭⠭⠭⠍⠛⠛⠛⢣⠀⠀⠀⠛⠒⠒⢒⣒⠒⣚⡒⣒⡒⠒⠒⠒⠒⠛⠒⣒⡒⠒⠒⠒⠒⠛⠒⠒⠒⠒⠒⠒⠒⠛⠛⠒⠒⠛⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⣿⣿⣶⣭⣿⣿⣶⣾⡇⠀
					]],
					keys = {
						{ icon = "├", key = "t", desc = "File Tree", action = ":Neotree toggle reveal reveal_force_cwd"},
						{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys",  gap = 1, padding = 1 },
					{
						icon = " ",
						title = "Git Status",
						section = "terminal",
						enabled = function()
							return Snacks.git.get_root() ~= nil
						end,
						cmd = "git status --short --branch --renames",
						height = 5,
						padding = 1,
						ttl = 5 * 60,
						indent = 3,
					},
					{ section = "startup" },
				},
			},
			indent = {
				enabled = true,
				animate = {
					duration = {
						step = 10,
						total = 100,
					}
				}
			},
			input = { enabled = false },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			quickfile = { enabled = true },
			-- scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = false },
			styles = {
				notification = {
					-- wo = { wrap = true } -- Wrap notifications
				}
			}
		},
		keys = {
			{ "<leader>z", function() Snacks.zen() end,      desc = "Toggle Zen Mode" },
			{ "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
			{ "<leader>g", function() Snacks.lazygit() end,  desc = "Lazygit" },
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					-- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					-- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					-- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					-- Snacks.toggle.diagnostics():map("<leader>ud")
					-- Snacks.toggle.line_number():map("<leader>ul")
					-- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
					-- "<leader>uc")
					-- Snacks.toggle.treesitter():map("<leader>uT")
					-- Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
					-- Snacks.toggle.inlay_hints():map("<leader>uh")
					-- Snacks.toggle.indent():map("<leader>ug")
					-- Snacks.toggle.dim():map("<leader>uD")
				end,
			})
		end,
	}
}
