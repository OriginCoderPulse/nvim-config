return {
	repo = "lewis6991/gitsigns.nvim",
	clone_conf = {},
	config = function()
		local status, git_signs = pcall(require, "gitsigns")
		if not status then
			vim.notify("gitsigns is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		git_signs.setup({
			signs_staged_enable = false,
			signcolumn = false,
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
		})
	end,
}
