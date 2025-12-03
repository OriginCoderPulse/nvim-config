return {
	repo = "williamboman/mason.nvim",
	depend = {
		{
			"williamboman/mason-lspconfig.nvim",
			opt = {
				automatic_enable = {
					"bash_ls",
					"clangd",
					"cssls",
					"dcmls",
					"emmet_ls",
					"gopls",
					"html",
					"jdtls",
					"jsonls",
					"lua_ls",
					"pylsp",
					"ts_ls",
				},
			},
		},
	},
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
