return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require "dap"
			local ui = require "dapui"

			require("dapui").setup()

			local elixir_ls_debugger = vim.fn.exepath "elixir-ls-debugger"
			if elixir_ls_debugger ~= "" then
				dap.adapters.mix_task = {
					type = "executable",
					command = elixir_ls_debugger,
				}

				dap.configurations.elixir = {
					{
						type = "mix_task",
						name = "phoenix server",
						task = "phx.server",
						request = "launch",
						projectDir = "${workspaceFolder}",
						exitAfterTaskReturns = false,
						debugAutoInterpretAllModules = false,
					},
				}
			end

			dap.adapters.node2 = {
				type = 'executable',
				command = 'node',
				args = {'/Users/johnq/.local/share/nvim/mason/bin/node-debug2-adapter'},
			}

			dap.configurations.javascript = {
				{
					name = 'Launch',
					type = 'node2',
					request = 'launch',
					program = '${file}',
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = 'inspector',
					console = 'integratedTerminal',
				},
				{
					-- For this to work you need to make sure the node process is started with the `--inspect` flag.
					name = 'Attach to process',
					type = 'node2',
					request = 'attach',
					processId = require 'dap.utils'.pick_process,
				},
			}

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F13>", dap.restart)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
