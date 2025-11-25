local config_modules = {
	-- 基础配置
	{ name = "configs.custom", enabled = true },
	{ name = "configs.keymaps", enabled = true, lazy = true },
	{ name = "configs.commands", enabled = true },

	-- 插件配置
	{ name = "util.pkg-manager", enabled = true, lazy = true },
	{ name = "util.package-configs.tree-sitter", enabled = true, lazy = true },
	{ name = "util.package-configs.transparent", enabled = true, lazy = true },
	{ name = "util.package-configs.telescope", enabled = true },
	{ name = "util.package-configs.noice", enabled = true, lazy = true },
	{ name = "util.package-configs.formatter", enabled = true, lazy = true },
	{ name = "util.package-configs.floaterm", enabled = true, lazy = true },
	{ name = "util.package-configs.autopairs", enabled = true, lazy = true },
	{ name = "util.package-configs.commenter", enabled = true, lazy = true },
	{ name = "util.package-configs.lualine", enabled = true },
	{ name = "util.lsp-configs.mason.mason", enabled = true, lazy = true },
	{ name = "util.package-configs.lsp", enabled = true, lazy = true },
	{ name = "util.lsp-configs.snips.snips", enabled = true, lazy = true },
	{ name = "util.package-configs.render-markdown", enabled = true, lazy = true },
	{ name = "util.package-configs.snacks", enabled = true },
	{ name = "util.package-configs.hop", enabled = true, lazy = true },
	{ name = "util.package-configs.gsigns", enabled = true, lazy = true },
	{ name = "util.package-configs.mini-icon", enabled = true },
	{ name = "util.package-configs.mini-file", enabled = true },
	{ name = "util.package-configs.llm", enabled = true },
}

-- 安全加载模块的函数
local function safe_require(module_name)
	local ok, result = pcall(require, module_name)
	if not ok then
		vim.notify("Failed to load module: " .. module_name .. " - " .. result, vim.log.levels.WARN, { title = "Nvim" })
		return nil
	end
	return result
end

-- 加载配置模块
local function load_config()
	for _, module in ipairs(config_modules) do
		if module.enabled then
			local config_fn = function()
				local mod = safe_require(module.name)
				if mod and mod.Config then
					mod.Config()
				end
			end

			if module.lazy then
				vim.defer_fn(config_fn, 500)
			else
				config_fn()
			end
		end
	end
end

-- 执行配置加载
load_config()
