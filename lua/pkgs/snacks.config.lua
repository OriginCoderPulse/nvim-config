return {
	repo = "folke/snacks.nvim",
	opts = {
		indent = {
			enabled = true,
			animate = {
				enabled = true,
			},
		},
		picker = {
			enabled = true,
			formatters = {
				file = {
					filename_only = true,
				},
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
