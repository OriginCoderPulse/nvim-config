return {
	repo = "MeanderingProgrammer/render-markdown.nvim",
	loaded = {
		ft = { "markdown", "llm" },
	},
	config = function()
		local status, md_render = pcall(require, "render-markdown")
		if not status then
			vim.notify("render-markdown is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		md_render.setup({
			file_types = { "markdown", "llm" },
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
		})
	end,
}
