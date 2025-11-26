local config_modules = {
	{ name = "configs.custom", enabled = true },
	{ name = "configs.keymaps", enabled = true },
	{ name = "configs.commands", enabled = true },
	{ name = "util.pkg-manager", enabled = true },
	{ name = "util.package-configs.tree-sitter", enabled = true },
	{ name = "util.package-configs.transparent", enabled = true },
	{ name = "util.package-configs.telescope", enabled = true },
	{ name = "util.package-configs.noice", enabled = true },
	{ name = "util.package-configs.formatter", enabled = true },
	{ name = "util.package-configs.floaterm", enabled = true },
	{ name = "util.package-configs.autopairs", enabled = true },
	{ name = "util.package-configs.commenter", enabled = true },
	{ name = "util.package-configs.lualine", enabled = true },
	{ name = "util.lsp-configs.mason.mason", enabled = true },
	{ name = "util.package-configs.lsp", enabled = true },
	{ name = "util.lsp-configs.snips.snips", enabled = true },
	{ name = "util.package-configs.render-markdown", enabled = true },
	{ name = "util.package-configs.snacks", enabled = true },
	{ name = "util.package-configs.hop", enabled = true },
	{ name = "util.package-configs.gsigns", enabled = true },
	{ name = "util.package-configs.mini-icon", enabled = true },
	{ name = "util.package-configs.mini-file", enabled = true },
	{ name = "util.package-configs.llm", enabled = true },
}

local function safe_require(module_name)
	local ok, result = pcall(require, module_name)
	if not ok then
		vim.notify("Failed to load module: " .. module_name .. " - " .. result, vim.log.levels.WARN, { title = "Nvim" })
		return nil
	end
	return result
end

local function load_config()
	for _, module in ipairs(config_modules) do
		if module.enabled then
			local mod = safe_require(module.name)
			if mod and mod.Config then
				mod.Config()
			end
		end
	end
end

load_config()
