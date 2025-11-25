local status, mini_file = pcall(require, "mini.files")
local M = {}

if not status then
	M.Config = function()
		vim.notify("mini.files is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	mini_file.setup({
		mappings = {
			go_in_plus = "<CR>",
			close = "<leader>e",
			synchronize = "=",
		},
		windows = {
			preview = true,
			width_preview = 100,
		},
	})
end

return M
