return {
	repo = "nvim-mini/mini.files",
	config = function()
		local status, mini_file = pcall(require, "mini.files")
		if not status then
			vim.notify("mini.files is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
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
	end,
}
