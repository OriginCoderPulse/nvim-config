return {
	config = function()
		local status, super = pcall(require, "super-installer")
		if not status then
			vim.notify("super-installer is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		super.setup({
			method = "ssh",
			ui = {
				progress = {
					icon = "",
				},
				manager = {
					icon = {
						check = "󱥾",
					},
				},
			},
			keymaps = {
				install = "<leader>i",
				remove = "<leader>r",
				update = "<leader>u",
			},
			install = {
				package_path = os.getenv("HOME") .. "/.nvim-utils/package",
				config_path = os.getenv("HOME") .. "/.config/nvim/lua/util/package-configs",
			},
		})
	end,
}
