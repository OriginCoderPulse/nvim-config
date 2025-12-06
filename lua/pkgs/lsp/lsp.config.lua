return {
	repo = "neovim/nvim-lspconfig",
	depend = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		"xzbdmw/colorful-menu.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local status, cmp = pcall(require, "cmp")
		local luasnip = require("luasnip")

		if not status then
			vim.notify("cmp is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
			return
		end

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local LspMapping = {
			["<Tab>"] = cmp.mapping(function(callback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					callback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(callback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					callback()
				end
			end, { "i", "s" }),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}

		local LspWindow = {
			completion = cmp.config.window.bordered({
				scrollbar = false,
			}),
			documentation = cmp.config.window.bordered({
				scrollbar = false,
			}),

			hover = cmp.config.window.bordered({
				scrollbar = false,
			}),
		}

		local LspSource = {
			default = {
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "lua_cmp" },
				{ name = "nvim_lua" },
			},
			cmdline = {
				search = {
					{ name = "buffer" },
				},
				comamnd = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			},
		}

		local LspFormat = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local highlights_info = require("colorful-menu").cmp_highlights(entry)

				if highlights_info ~= nil then
					vim_item.abbr_hl_group = highlights_info.highlights
					vim_item.abbr = highlights_info.text
				end

				local kinds = require("pkgs.lsp.kinds.kinds")
				vim_item.kind = string.format("%s %s", kinds[vim_item.kind] or vim_item.kind, vim_item.kind .. "  ")

				vim_item.menu = ({
					luasnip = "   󰬚",
					nvim_lsp = "   󰬓",
					buffer = "   󰬉",
					path = "   󰬗",
					lua_cmp = "   󰬊",
					cmdline = "   ",
					nvim_lua = "  ",
				})[entry.source.name]

				return vim_item
			end,
		}

		local function setup_cmp()
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = LspWindow,
				mapping = cmp.mapping.preset.insert(LspMapping),
				sources = cmp.config.sources(LspSource.default),
				formatting = LspFormat,
				experimental = {
					ghost_text = true,
				},
			})
		end

		local function setup_cmdline()
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources(LspSource.cmdline.search),
				formatting = LspFormat,
				experimental = {
					ghost_text = true,
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources(LspSource.cmdline.comamnd),
				formatting = LspFormat,
				experimental = {
					ghost_text = true,
				},
			})
		end

		local function setup_autopairs()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end

		setup_cmp()
		setup_cmdline()
		setup_autopairs()
	end,
}
