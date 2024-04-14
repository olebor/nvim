return {
	-- Autopairs
	"windwp/nvim-autopairs",
	config = function()
		local autopairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		})

		local cmp_status_ok, cmp = pcall(require, "cmp")
		if cmp_status_ok then
			-- If you want insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local map_char = {
				all = "(",
				tex = "{",
			}

			cmp.event:on(
				"confirm_done",
				cmp_autopairs.on_confirm_done({
					map_char = map_char,
				})
			)
		end

		require("nvim-treesitter.configs").setup({
			autopairs = {
				enable = true,
			},
		})

		local ts_conds = require("nvim-autopairs.ts-conds")

		-- TODO: can these rules be safely added from "config.lua" ?
		-- press % => %% is only inside comment or string
		autopairs.add_rules({
			Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
			Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
		})
	end,
}
