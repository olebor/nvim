local function configureLualine()
	local lualine = require("lualine")

	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local icons = require("user.icons")

	local diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn" },
		symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
		colored = false,
		update_in_insert = false,
		always_visible = true,
	}

	local diff = {
		"diff",
		colored = false,
		symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
		cond = hide_in_width,
	}

	local filetype = {
		"filetype",
		icons_enabled = true,
		-- icon = nil,
	}

	local branch = {
		"branch",
		icons_enabled = true,
		icon = "",
	}

	local location = {
		"location",
		padding = { right = 1 },
	}

	lualine.setup({
		options = {
			icons_enabled = true,
			theme = "dracula-nvim",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { branch },
			lualine_b = { diagnostics },
			lualine_c = {
				"filename",
			},
			lualine_x = { diff, "encoding" },
			lualine_y = { filetype },
			lualine_z = { "progress", location },
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	config = configureLualine,
}
