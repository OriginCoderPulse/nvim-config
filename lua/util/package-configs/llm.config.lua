return {
	repo = "Kurama622/llm.nvim",
	config = function()
		local status, llm = pcall(require, "llm")
		if not status then
			vim.notify("llm is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		llm.setup({
			prompt = "Answer With Chinese!",
			max_tokens = 512,
			api_type = "ollama",
			prefix = {
				user = { text = "󰫮 Allen ", hl = "MiniIconsGreen" },
				assistant = { text = "󰫰 Chat ", hl = "MiniIconsPurple" },
			},
			url = "http://localhost:11434/api/chat",
			model = "qwen3-vl:4b",
			keys = {
				["Input:Submit"] = { mode = "n", key = "<C-CR>" },
			},
			chat_ui_opts = {
				relative = "editor",
				position = "50%",
				size = {
					width = "80%",
					height = "80%",
				},
				input = {
					float = {
						border = {
							text = {
								top = " Enter Your Question ",
								top_align = "center",
							},
						},
						win_options = {
							winblend = 0,
							winhighlight = "Normal:LlmRedLight,FloatBorder:MiniIconsOrange,FloatTitle:MiniIconsRed",
						},
						size = { height = "10%", width = "75%" },
						order = 2,
					},
				},
				output = {
					float = {
						border = {
							text = {
								top = " Chat Answer ",
								top_align = "center",
							},
						},
						size = { height = "90%", width = "75%" },
						order = 1,
						win_options = {
							winblend = 0,
							winhighlight = "Normal:Normal,FloatBorder:MiniIconsOrange,FloatTitle:MiniIconsRed",
						},
					},
				},
				history = {
					float = {
						size = { height = "80%", width = "25%" },
						win_options = {
							winblend = 0,
							winhighlight = "Normal:MiniIconsOrange,FloatBorder:MiniIconsOrange,FloatTitle:MiniIconsRed",
						},
						order = 3,
					},
				},
				models = {
					float = {
						size = { height = "20%", width = "20%" },
						border = {
							text = {
								top = " Models ",
								top_align = "center",
							},
						},
						win_options = {
							winblend = 0,
							winhighlight = "Normal:MiniIconsOrange,FloatBorder:MiniIconsOrange,FloatTitle:MiniIconsRed",
						},
						order = 4,
					},
				},
			},
			popwin_opts = {
				relative = "editor",
				enter = true,
				focusable = true,
				zindex = 50,
				position = "50%",
				size = { height = "80%", width = "80%" },
				border = { style = "rounded", text = { top = " Explain ", top_align = "center" } },
				win_options = {
					winblend = 0,
					winhighlight = "Normal:Normal,FloatBorder:MiniIconsOrange",
				},
			},
		})
	end,
}
