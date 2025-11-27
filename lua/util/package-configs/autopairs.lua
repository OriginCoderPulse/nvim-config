return {
	repo = "windwp/nvim-autopairs",
	clone_conf = {},
	config = function()
		local status, atpairs = pcall(require, "nvim-autopairs")
		if not status then
			vim.notify("auto-pairs is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		atpairs.setup({})
	end,
}
