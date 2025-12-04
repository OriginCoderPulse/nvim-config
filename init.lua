vim.opt.rtp:prepend(os.getenv("HOME") .. "/.nvim-utils/package/synapse.nvim")

require("synapse").setup({
	method = "ssh",
	opts = {
		package_path = os.getenv("HOME") .. "/.nvim-utils/package",
		ui = {
			style = "float",
		},
	},
	keys = {
		download = "<leader>i",
		remove = "<leader>r",
		upgrade = "<leader>u",
	},
})
