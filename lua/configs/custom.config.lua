return {
	config = function()
		local typeMap = {
			global = vim.g,
			option = vim.opt,
			command = vim.cmd,
			diagnostic = vim.diagnostic,
		}

		local custom = {
			{ type = "global", attribute = "mapleader", value = " " },
			{ type = "global", attribute = "loaded_netrw", value = 1 },
			{ type = "global", attribute = "loaded_netrwPlugin", value = 1 },
			{ type = "global", attribute = "termguicolors", value = true },
			{ type = "global", attribute = "markdown_fenced_languages", value = { "ts=typescript", "js=javascript" } },
			{ type = "option", attribute = "mouse", value = "" },
			{ type = "option", attribute = "relativenumber", value = true },
			{ type = "option", attribute = "number", value = true },
			{ type = "option", attribute = "numberwidth", value = 4 },
			{ type = "option", attribute = "tabstop", value = 2 },
			{ type = "option", attribute = "shiftwidth", value = 2 },
			{ type = "option", attribute = "expandtab", value = true },
			{ type = "option", attribute = "autoindent", value = true },
			{ type = "option", attribute = "smartindent", value = true },
			{ type = "option", attribute = "clipboard", value = "unnamedplus" },
			{ type = "option", attribute = "cursorline", value = true },
			{ type = "option", attribute = "splitbelow", value = false },
			{ type = "option", attribute = "splitright", value = true },
			{ type = "option", attribute = "backup", value = false },
			{ type = "option", attribute = "writebackup", value = false },
			{ type = "option", attribute = "updatetime", value = 50 },
			{ type = "option", attribute = "signcolumn", value = "yes" },
			{ type = "option", attribute = "confirm", value = false },
			{ type = "option", attribute = "pumheight", value = 10 },
			{ type = "option", attribute = "pumwidth", value = 10 },
			{ type = "option", attribute = "autoread", value = true },
			{ type = "option", attribute = "showmode", value = false },
			{ type = "option", attribute = "winblend", value = 0 },
			{
				type = "option",
				attribute = "runtimepath",
				value = os.getenv("HOME") .. "/.nvim-utils/treesitter",
				method = "append",
			},
			{
				type = "option",
				attribute = "fillchars",
				value = { eob = " " },
				method = "append",
			},
			{
				type = "option",
				attribute = "wildignore",
				value = {
					"node_modules/",
					"*.yaml",
					"*.log",
					"*.lock",
					"package.json",
				},
				method = "append",
			},
			{ type = "command", attribute = "colorscheme", value = "dawnbreaker", isFunc = true },
			{
				type = "diagnostic",
				attribute = "config",
				value = {
					virtual_text = true,
					severity_sort = true,
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = " ",
							[vim.diagnostic.severity.WARN] = " ",
							[vim.diagnostic.severity.INFO] = " ",
							[vim.diagnostic.severity.HINT] = " ",
						},
					},
				},
				isFunc = true,
			},
		}

		for _, item in ipairs(custom) do
			local target = typeMap[item.type]

			if item.method then
				target[item.attribute][item.method](target[item.attribute], item.value)
			else
				if item.isFunc then
					target[item.attribute](item.value)
				else
					target[item.attribute] = item.value
				end
			end
		end
	end,
}
