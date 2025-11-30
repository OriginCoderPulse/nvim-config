return {
	repo = "olimorris/codecompanion.nvim",
	depend = {
		"nvim-lua/plenary.nvim",
		"franco-ruggeri/codecompanion-lualine.nvim",
	},
	tag = "v17.33.0",
	config = {
		opts = {
			language = "zh",
			send_code = true,
		},
		adapters = {
			http = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "http://localhost:11434",
							api_key = nil,
							chat_url = "/api/chat",
						},
						headers = {
							["Content-Type"] = "application/json",
						},
						parameters = {
							sync = true,
						},
					})
				end,
			},
		},
		strategies = {
			chat = {
				adapter = "ollama",
				roles = {
					user = " Wu Kuohao 󱚝 [Allen] 󰅨",
					llm = " Qwen-vl:4b Service",
				},
			},
			inline = {
				adapter = "ollama",
			},
		},
		display = {
			action_palette = {
				provider = "telescope",
			},
			chat = {
				intro_message = "Welcome to the QWEN model",
				icons = {
					pinned_buffer = " ",
					watched_buffer = "󰡭 ",
				},
				start_in_insert_mode = false,
				window = {
					layout = "float",
					position = nil,
					border = "rounded",
					title = " 󰜈 AI Question ",
					height = 0.7,
					width = 0.7,
					relative = "editor",
					full_height = true,

					opts = {
						breakindent = true,
						cursorcolumn = false,
						cursorline = false,
						foldcolumn = "0",
						linebreak = true,
						list = false,
						number = false,
						relativenumber = false,
						numberwidth = 1,
						signcolumn = "no",
						spell = false,
						wrap = true,
					},
				},
			},
		},
	},
}
