return {
	repo = "williamboman/mason.nvim",
	depend = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local status, mason = pcall(require, "mason")
		if not status then
			vim.notify("mason is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		mason.setup({
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
		})
	end,
}
