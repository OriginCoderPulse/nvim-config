--- Custom autocommands configuration
--- This file defines various autocommands for Neovim
return {
	config = function()
		local commands = {
			-- Open file picker on VimEnter if no file is opened
			{
				event = "VimEnter",
				pattern = "*",
				callback = function()
					if vim.api.nvim_buf_get_name(0) == "" then
						local ok, _ = pcall(vim.fn.execute, "lua Snacks.picker.files()")
						if not ok then
							vim.notify(
								"Snacks Picker is not available.",
								vim.log.levels.WARN,
								{ title = "NvimCommands" }
							)
						end
					end
				end,
				enabled = true,
			},
			-- Auto format on insert leave and text change
			{
				event = { "InsertLeave", "TextChanged" },
				pattern = "*",
				callback = function()
					vim.fn.execute("silent! write! | Format")
				end,
				enabled = true,
			},
			-- LSP progress notification
			{
				event = "LspProgress",
				pattern = "*",
				callback = function(event)
					local spinner = {
						"⌐■",
						"■⌐",
						"⌐■",
						"■⌐",
						"⌐■",
						"■⌐",
						"⌐■",
						"■⌐",
						"⌐■",
						"■⌐",
					}
					vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
						id = "lsp_progress",
						title = vim.lsp.get_client_by_id(event.data.client_id).name,
						opts = function(notif)
							notif.icon = event.data.params.value.kind == "end" and ""
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
				enabled = true,
			},
		}

		-- Create autocommands
		for _, cmd in ipairs(commands) do
			if cmd.enabled then
				vim.api.nvim_create_autocmd(cmd.event, {
					pattern = cmd.pattern,
					callback = cmd.callback,
				})
			end
		end
	end,
}
