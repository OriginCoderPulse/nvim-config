return {
	config = function()
		local commands = {
			{
				mode = { "InsertLeave", "TextChanged" },
				pattern = "*",
				callback = function()
					vim.fn.execute("silent! write! | Format")
				end,
				enable = true,
			},
			{
				mode = "LspProgress",
				pattern = "*",
				callback = function(event)
					local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
					vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
						id = "lsp_progress",
						title = vim.lsp.get_client_by_id(event.data.client_id).name,
						opts = function(notif)
							notif.icon = event.data.params.value.kind == "end" and ""
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
				enable = true,
			},
		}
		for _, cmd in ipairs(commands) do
			if not cmd.enable then
				goto continue
			else
				vim.api.nvim_create_autocmd(cmd.mode, {
					pattern = cmd.pattern,
					callback = cmd.callback,
				})
			end
			::continue::
		end
	end,
}
