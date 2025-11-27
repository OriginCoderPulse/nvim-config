return {
	repo = "nvim-telescope/telescope.nvim",
	clone_conf = {},
	depend = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"AllenSpaces/telescope-treesitter-info",
		"AllenSpaces/telescope-node-packages.nvim",
	},
	config = function()
		local status, telescope = pcall(require, "telescope")
		if not status then
			vim.notify("telescope is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		telescope.setup({
			defaults = {
				preview = false,
				layout_config = {
					width = 0.5,
					height = 0.6,
					prompt_position = "top",
				},
				history = {
					path = os.getenv("HOME") .. "/.nvim-utils/telescope/telescope-history",
				},
				path_display = {
					"tail",
				},
				file_ignore_patterns = {
					".git",
					".hg",
					".DS_Store",
					"__pycache__",
					"%.log",
				},
				extensions = {
					live_grep_args = {},
					treesitter_info = {},
					node_packages = {},
				},
				sorting_strategy = "ascending",
			},
		})
	end,
}
