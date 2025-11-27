return {
	repo = "L3MON4D3/LuaSnip",
	clone_conf = {},
	config = function()
		local status, _ = pcall(require, "luasnip")
		if not status then
			vim.notify("luasnip is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		require("util.package-configs.lsp.snips.javascript_snip")
		require("util.package-configs.lsp.snips.javascriptreact_snip")
		require("util.package-configs.lsp.snips.typescript_snip")
		require("util.package-configs.lsp.snips.typescriptreact_snip")
		require("util.package-configs.lsp.snips.react_snip")
		require("util.package-configs.lsp.snips.lua_snip")
		require("util.package-configs.lsp.snips.java_snip")
		require("util.package-configs.lsp.snips.python_snip")
		require("util.package-configs.lsp.snips.html_snip")
	end,
}
