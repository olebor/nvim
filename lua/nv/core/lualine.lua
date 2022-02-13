local M = {}

M.config = function()
	local status_ok, lualine = pcall(require, "lualine")
	if not status_ok then
		return
	end

	local status_gps_ok, gps = pcall(require, "nvim-gps")
	if not status_gps_ok then
		return
	end

	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local icons = require("nv.core.icons")

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

	local nvim_gps = function()
		local gps_location = gps.get_location()
		if gps_location == "error" then
			return ""
		else
			return gps.get_location()
		end
	end

	lualine.setup({
		options = {
			icons_enabled = true,
			theme = "dracula",
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
				{ nvim_gps, cond = hide_in_width },
			},
			lualine_x = { diff, "encoding" },
			lualine_y = { filetype },
			lualine_z = { location },
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

return M
