return {
	repo = "folke/noice.nvim",
	depend = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				position = {
					row = 1,
					col = "50%",
				},
				format = {
					cmdline = { icon = " " },
					search_down = { icon = "󰁈 " },
					search_up = { icon = " " },
					filter = { icon = "󰤶 " },
					help = { icon = "󱏘 " },
					input = { icon = "󰽉 " },
					lua = { icon = " " },
				},
			},
			lsp = {
				progress = {
					enabled = false,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
	},
}
