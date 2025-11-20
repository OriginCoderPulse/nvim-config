local status, git_signs = pcall(require, "gitsigns")
local M = {}

if not status then
	vim.notify("gitsigns is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

M.Config = function()
	git_signs.setup({
		signs = {
			add = { text = "" },
			change = { text = "" },
			delete = { text = "󱂥" },
			topdelete = { text = "󰠙" },
			changedelete = { text = "󰛌" },
			untracked = { text = "󰵺" },
		},
		signs_staged = {
			add = { text = "" },
			change = { text = "" },
			delete = { text = "󱂥" },
			topdelete = { text = "󰠙" },
			changedelete = { text = "󰛌" },
			untracked = { text = "󰵺" },
		},
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
end

return M
