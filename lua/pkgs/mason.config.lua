return {
	repo = "williamboman/mason.nvim",
	initialization = function()
		vim.lsp.enable({
			"bashls",
			"clangd",
			"cssls",
			"dart",
			"emmet_ls",
			"gopls",
			"html",
			"jdtls",
			"jsonls",
			"lua_ls",
			"pylsp",
			"ts_ls",
		})
	end,
	opts = {
		install_root_dir = os.getenv("HOME") .. "/.nvim-utils/mason",
		ui = {
			border = "rounded",
			width = 0.6,
			height = 0.6,
			icons = {
				package_installed = "",
				package_pending = "󰏔",
				package_uninstalled = "󱧙",
			},
		},
	},
}
