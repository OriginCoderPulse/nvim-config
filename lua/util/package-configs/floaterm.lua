return {
	repo = "akinsho/toggleterm.nvim",
	clone_conf = {},
	config = function()
		local status, floaterm = pcall(require, "toggleterm")
		if not status then
			vim.notify("Floaterm is not Found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		local Terminal = require("toggleterm.terminal").Terminal

		function _Node()
			local node = Terminal:new({ cmd = "node", hidden = true })
			node:toggle()
		end

		function _Python()
			local python = Terminal:new({ cmd = "python3", hidden = true })
			python:toggle()
		end

		function _Lua()
			local lua = Terminal:new({ cmd = "lua", hidden = true })
			lua:toggle()
		end

		function _Git()
			local width = vim.api.nvim_win_get_width(0)
			local height = vim.api.nvim_win_get_height(0)

			local git = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				direction = "float",
				float_opts = {
					border = "rounded",
					width = width,
					height = height,
					row = 0,
					col = 0,
				},
				on_close = function()
					vim.cmd("checktime")
				end,
			})
			git:toggle()
		end

		function _Sql()
			local sql_cmd = "mysql -u root -p" .. vim.env.MYSQL_PASS
			local sql = Terminal:new({ cmd = sql_cmd, hidden = true })
			sql:toggle()
		end

		floaterm.setup({
			open_mapping = "<leader>ft",
			size = 20,
			hide_numbers = true,
			direction = "float",
			float_opts = {
				border = "rounded",
				winlend = 0,
			},
			autochdir = true,
			shell = "/bin/zsh",
		})
	end,
}
