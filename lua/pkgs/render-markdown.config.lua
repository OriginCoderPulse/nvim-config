return {
	repo = "MeanderingProgrammer/render-markdown.nvim",
	config = {
		file_types = { "markdown", "codecompanion" },
		bullet = {
			highlight = "RenderMarkdownH2",
			icons = { "●", "○", "◆", "◇" },
		},
		heading = {
			position = "inline",
			icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
			backgrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
			},
			foregrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
			},
		},
		quote = {},
		dash = { icon = "" },
		code = {
			above = "",
			below = "",
			highlight = "",
			highlight_inline = "",
		},
		pipe_table = {
			preset = "round",
			row = "@markup.row",
		},
		win_options = { concealcursor = { rendered = "nvc" } },
		completions = {
			lsp = { enabled = true },
		},
	},
}
