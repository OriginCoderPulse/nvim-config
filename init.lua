local function scan_config_files(dir_name)
	local configs = {}
	local config_path = vim.fn.stdpath("config")
	local lua_path = config_path .. "/lua"
	local target_path = lua_path .. "/" .. dir_name

	local files = vim.fn.globpath(target_path, "**/*.config.lua", true, true)

	for _, file in ipairs(files) do
		local relative_path = file:gsub("^" .. lua_path .. "/", ""):gsub("%.lua$", "")
		local module_name = relative_path:gsub("/", ".")
		table.insert(configs, { name = module_name, file_path = file, enabled = true })
	end

	return configs
end

local config_modules = {}
local configs_configs = scan_config_files("configs")
local util_configs = scan_config_files("util")

for _, config in ipairs(configs_configs) do
	table.insert(config_modules, config)
end
for _, config in ipairs(util_configs) do
	table.insert(config_modules, config)
end

local function safe_require(module_name, file_path)
	if file_path then
		local ok, result = pcall(dofile, file_path)
		if not ok then
			vim.notify(
				"Failed to load module: " .. module_name .. " - " .. result,
				vim.log.levels.WARN,
				{ title = "Nvim" }
			)
			return nil
		end
		return result
	else
		local ok, result = pcall(require, module_name)
		if not ok then
			vim.notify(
				"Failed to load module: " .. module_name .. " - " .. result,
				vim.log.levels.WARN,
				{ title = "Nvim" }
			)
			return nil
		end
		return result
	end
end

local function load_config()
	for _, module in ipairs(config_modules) do
		if module.enabled then
			local mod = safe_require(module.name, module.file_path)
			if mod and mod.config then
				if mod.loaded then
					if mod.loaded.event and #mod.loaded.event > 0 then
						vim.api.nvim_create_autocmd(mod.loaded.event, {
							group = vim.api.nvim_create_augroup(module.name, { clear = true }),
							once = true,
							callback = function()
								mod.config()
							end,
						})
					elseif mod.loaded.ft and #mod.loaded.ft > 0 then
						vim.api.nvim_create_autocmd("FileType", {
							group = vim.api.nvim_create_augroup(module.name, { clear = true }),
							pattern = mod.loaded.ft,
							callback = function()
								mod.config()
							end,
						})
					end
				else
					mod.config()
				end
			end
		end
	end
end

load_config()
