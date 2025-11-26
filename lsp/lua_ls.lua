return {
	filetypes = {
		"lua",
	},
	on_init = function(client)
		local path = nil
		if client.workspace_folders and client.workspace_folders[1] then
			path = client.workspace_folders[1].name
		else
			path = vim.fn.getcwd()
		end

		for _, filename in ipairs({ "/.luarc.json", "/.luarc.jsonc" }) do
			if vim.uv.fs_stat(path .. filename) then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					vim.api.nvim_get_runtime_file("", true),
				},
			},
			diagnostics = {
				globals = { "vim" },
			},
		})
	end,
	settings = {
		Lua = {
			telemetry = {
				enable = false,
			},
		},
	},
}
