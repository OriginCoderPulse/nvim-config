return {
	repo = "nvim-telescope/telescope.nvim",
	depend = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"mrloop/telescope-git-branch.nvim",
		"OriginCoderPulse/telescope-treesitter-info",
		"OriginCoderPulse/telescope-node-packages.nvim",
	},
	config = {
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
					codecompanion = {},
					git_branch = {
						opts = {
							layout_config = {
								width = 0.8,
								height = 0.9,
								prompt_position = "bottom",
							},
						},
					},
				},
				sorting_strategy = "ascending",
			},
	},
}
