return {
	repo = "xiyaowong/transparent.nvim",
	clone_conf = {},
	config = function()
		local status, transparent = pcall(require, "transparent")
		if not status then
			vim.notify("Transparent is not undefined", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		transparent.setup({
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			extra_groups = {
				"NormalFloat",
				"NvimTreeNormal",
			},
			exclude_groups = {},
		})
	end,
}
