return {
	repo = "hadronized/hop.nvim",
	config = function()
		local status, hop = pcall(require, "hop")
		if not status then
			vim.notify("hop.nvim is not installed", vim.log.levels.ERROR, { title = "Hop.nvim" })
			return
		end
		hop.setup({})
	end,
}
