return {
	config = function()
		local status, super = pcall(require, "synapse")
		if not status then
			vim.notify("synapse is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		super.setup({
			method = "ssh",
			opts = {
				package_path = os.getenv("HOME") .. "/.nvim-utils/package",
				config_path = os.getenv("HOME") .. "/.config/nvim/lua/util/package-configs",
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
	end,
}
