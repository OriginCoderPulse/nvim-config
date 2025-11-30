return {
	repo = "folke/snacks.nvim",
	config = {
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
	},
}
