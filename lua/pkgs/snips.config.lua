return {
	repo = "L3MON4D3/LuaSnip",
	config = function()
		local status, _ = pcall(require, "luasnip")
		if not status then
			vim.notify("luasnip is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end
		require("pkgs.lsp.snips.javascript_snip")
		require("pkgs.lsp.snips.javascriptreact_snip")
		require("pkgs.lsp.snips.typescript_snip")
		require("pkgs.lsp.snips.typescriptreact_snip")
		require("pkgs.lsp.snips.react_snip")
		require("pkgs.lsp.snips.lua_snip")
		require("pkgs.lsp.snips.java_snip")
		require("pkgs.lsp.snips.python_snip")
		require("pkgs.lsp.snips.html_snip")
	end,
}
