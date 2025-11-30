local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	ls.add_snippets("lua", {
		ls.snippet(
			"pr",
			fmt(
				[[
      local status, {} = pcall(require, "{}")
      local M = {{}}

      if not status then
        M.Config = function()
          vim.notify("{} is not found ...", vim.log.levels.ERROR, {{ title = "Nvim" }})
        end
        return M 
      end

      function M.Config()
        {}.setup({{}})
      end

      return M
    ]],
				{
					ls.insert_node(1),
					ls.insert_node(2),
					rep(2),
					rep(1),
				}
			)
		),
	}),
}
