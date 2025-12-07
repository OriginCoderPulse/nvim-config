return {
	repo = "lewis6991/gitsigns.nvim",
	opts = {
		signs_staged_enable = false,
		signcolumn = false,
		numhl = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 0,
			ignore_whitespace = true,
			virt_text_priority = 100,
			use_focus = false,
		},
		current_line_blame_formatter = "<abbrev_sha> <author> <author_time:%R> - Commit: <summary>",
		attach_to_untracked = true,
	},
}
