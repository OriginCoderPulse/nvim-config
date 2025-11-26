local M = {}

function M.Config()
	vim.g.mapleader = " "
	local keymap = vim.keymap
	local opt = { noremap = true, silent = true }

	-- Group related keymaps together for better organization
	local mapConfig = {
		-- Basic navigation
		{ mode = "n", key = "w", leader = true, map = "<C-W><C-W>", enabled = true, desc = "Switch windows" },
		{ mode = "n", key = "b", leader = true, map = "<C-o>", enabled = true, desc = "Go back" },

		-- File operations
		{ mode = "n", key = "q", leader = true, map = ":q<CR>", enabled = true, desc = "Quit" },
		{ mode = "n", key = "<S-q>", leader = true, map = ":q!<CR>", enabled = true, desc = "Force quit" },
		{
			mode = "n",
			key = "e",
			leader = true,
			map = ":lua MiniFiles.open()<CR>",
			enabled = true,
			desc = "Toggle file explorer",
		},

		-- Telescope finders
		{
			mode = "n",
			key = "ff",
			leader = true,
			map = ":Telescope find_files<CR>",
			enabled = true,
			desc = "Find files",
		},
		{
			mode = "n",
			key = "fo",
			leader = true,
			map = ":Telescope oldfiles<CR>",
			enabled = true,
			desc = "Find old files",
		},
		{
			mode = "n",
			key = "fl",
			leader = true,
			map = ":Telescope live_grep_args<CR>",
			enabled = true,
			desc = "Live grep",
		},
		{
			mode = "n",
			key = "fh",
			leader = true,
			map = ":Telescope treesitter_info<CR>",
			enabled = true,
			desc = "Treesitter info",
		},
		{
			mode = "n",
			key = "fn",
			leader = true,
			map = ":Telescope node_packages<CR>",
			enabled = true,
			desc = "Node packages",
		},
		{
			mode = "n",
			key = "fm",
			leader = true,
			map = ":Telescope notify<CR>",
			enabled = true,
			desc = "Notifications",
		},
		{
			mode = "n",
			key = "fc",
			leader = true,
			map = ":Telescope current_buffer_fuzzy_find<CR>",
			enabled = true,
			desc = "Current buffer fuzzy find",
		},

		-- LSP navigation (jump to definitions, references, etc.)
		{
			mode = "n",
			key = "gd",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_definitions()
			end,
			enabled = true,
			desc = "Go to definition",
		},
		{
			mode = "n",
			key = "gD",
			leader = false,
			map = function()
				vim.lsp.buf.declaration()
			end,
			enabled = true,
			desc = "Go to declaration",
		},
		{
			mode = "n",
			key = "gi",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_implementations()
			end,
			enabled = true,
			desc = "Go to implementation",
		},
		{
			mode = "n",
			key = "gr",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_references()
			end,
			enabled = true,
			desc = "Find references",
		},
		{
			mode = "n",
			key = "gt",
			leader = false,
			map = function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			enabled = true,
			desc = "Go to type definition",
		},

		-- LSP actions (hover, rename, etc.)
		{
			mode = "n",
			key = "K",
			leader = false,
			map = function()
				vim.lsp.buf.hover()
			end,
			enabled = true,
			desc = "Show hover",
		},
		{
			mode = "n",
			key = "gh",
			leader = true,
			map = function()
				vim.lsp.buf.hover({
					title = "Describe",
					title_pos = "center",
				})
			end,
			enabled = true,
			desc = "Show hover (centered)",
		},
		{
			mode = "n",
			key = "rn",
			leader = true,
			map = function()
				vim.lsp.buf.rename()
			end,
			enabled = true,
			desc = "Rename symbol",
		},
		{
			mode = "n",
			key = "th",
			leader = true,
			map = function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end,
			enabled = true,
			desc = "Toggle inlay hint",
		},

		-- LSP diagnostics
		{
			mode = "n",
			key = "ld",
			leader = true,
			map = function()
				vim.diagnostic.open_float({
					source = true,
					border = "rounded",
				})
			end,
			enabled = true,
			desc = "Show diagnostic",
		},
		{
			mode = "n",
			key = "ln",
			leader = true,
			map = function()
				vim.diagnostic.get_next()
			end,
			enabled = true,
			desc = "Next diagnostic",
		},
		{
			mode = "n",
			key = "lp",
			leader = true,
			map = function()
				vim.diagnostic.get_next()
			end,
			enabled = true,
			desc = "Previous diagnostic",
		},
		{
			mode = "n",
			key = "lq",
			leader = true,
			map = function()
				vim.diagnostic.setqflist()
			end,
			enabled = true,
			desc = "Diagnostic quickfix",
		},

		-- Language specific commands
		{ mode = "n", key = "lg", leader = true, map = ":lua _Git()<CR>", enabled = true, desc = "Git commands" },
		{ mode = "n", key = "lu", leader = true, map = ":lua _Lua()<CR>", enabled = true, desc = "Lua commands" },
		{ mode = "n", key = "nd", leader = true, map = ":lua _Node()<CR>", enabled = true, desc = "Node commands" },
		{ mode = "n", key = "py", leader = true, map = ":lua _Python()<CR>", enabled = true, desc = "Python commands" },
		{ mode = "n", key = "sq", leader = true, map = ":lua _Sql()<CR>", enabled = true, desc = "SQL commands" },

		-- UI toggles
		{
			mode = "n",
			key = "nh",
			leader = true,
			map = ":set nohlsearch<CR>",
			enabled = true,
			desc = "Clear search highlight",
		},
		{ mode = "n", key = "ms", leader = true, map = ":Mason<CR>", enabled = true, desc = "Open Mason" },

		-- LLM session
		{ mode = "n", key = "cc", leader = true, map = ":LLMSessionToggle<CR>", enabled = true, desc = "Toggle chat" },
		{
			mode = "v",
			key = "ca",
			leader = true,
			map = ":'<,'>LLMSelectedTextHandle '请解释说明一下这段'<CR>",
			enabled = true,
			desc = "Explain selected text",
		},

		-- Hop navigation
		{ mode = "n", key = "hw", leader = true, map = ":HopWord<CR>", enabled = true, desc = "Hop to word" },
		{ mode = "n", key = "hl", leader = true, map = ":HopLine<CR>", enabled = true, desc = "Hop to line" },

		-- Escape mappings
		{ mode = "i", key = "jk", leader = false, map = "<ESC>", enabled = true, desc = "Escape insert mode" },
		{ mode = "v", key = "v", leader = false, map = "<ESC>", enabled = true, desc = "Escape visual mode" },
	}

	for _, map in ipairs(mapConfig) do
		if map.enabled then
			local options = vim.deepcopy(opt)
			if map.desc then
				options.desc = map.desc
			end
			keymap.set(map.mode, map.leader and "<leader>" .. map.key or map.key, map.map, options)
		end
	end
end

return M
