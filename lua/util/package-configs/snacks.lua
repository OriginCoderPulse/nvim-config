return {
	repo = "folke/snacks.nvim",
	clone_conf = {},
	config = function()
		local status, snacks = pcall(require, "snacks")
		if not status then
			vim.notify("snacks is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		snacks.setup({
			indent = {
				enabled = true,
				animate = {
					enabled = true,
				},
			},
			notifier = {
				enabled = true,
				auto_close = {
					enabled = true,
				},
				history = {
					minimal = true,
				},
				icons = {
					error = "󰬌 ",
					warn = "󰬞 ",
					info = "󰬐 ",
					debug = "󰬋 ",
					trace = "󰬛 ",
				},
				styles = {
					ft = "markdown",
				},
			},
			scope = {
				enabled = true,
			},
		})
	end,
}
