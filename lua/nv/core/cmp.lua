local M = {}
local Log = require "core.log"

M.config = function()
	local status_cmp_ok, cmp = pcall(require, "cmp")
	if not status_cmp_ok then
		Log.error('Unable to configure cmp')
		return
	end

	lvim.builtin.cmp = {
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false
		},
		completion = {
			---@usage The minimum length of a word to complete on.
			keyword_length = 1
		},
		experimental = {
			ghost_text = true,
			native_menu = false
		},
		formatting = {
			kind_icons = {
				Class = " ",
				Color = " ",
				Constant = "ﲀ ",
				Constructor = " ",
				Enum = "練",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = "",
				Folder = " ",
				Function = " ",
				Interface = "ﰮ ",
				Keyword = " ",
				Method = " ",
				Module = " ",
				Operator = "",
				Property = " ",
				Reference = " ",
				Snippet = " ",
				Struct = " ",
				Text = " ",
				TypeParameter = " ",
				Unit = "塞",
				Value = " ",
				Variable = " "
			},
			source_names = {
				nvim_lsp = "(LSP)",
				path = "(Path)",
				calc = "(Calc)",
				vsnip = "(Snippet)",
				buffer = "(Buffer)"
			},
			duplicates = {
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
				luasnip = 1
			},
			duplicates_default = 0,
			format = function(entry, vim_item)
				vim_item.kind = lvim.builtin.cmp.formatting.kind_icons[vim_item.kind]
				vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
				vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name] or
					lvim.builtin.cmp.formatting.duplicates_default
				return vim_item
			end
		},
		snippet = {
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "vsnip" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			{ name = "treesitter" },
			-- { name = "crates" } -- rust (crates.io)
		},
		mapping = {
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() and cmp.confirm(lvim.builtin.cmp.confirm_opts) then
					return
				end
				fallback()
			end)
		}
	}
end

M.setup = function()
	M.config()
	require("cmp").setup(lvim.builtin.cmp)
end

return M
