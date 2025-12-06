return {
	repo = "windwp/nvim-autopairs",
	config = function()
		local status, atpairs = pcall(require, "nvim-autopairs")
		if not status then
			vim.notify("auto-pairs is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		
		atpairs.setup({})
	end,
}
