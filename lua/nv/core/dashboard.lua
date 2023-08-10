local M = {}
local Log = require("core.log")

M.setup = function()
	local status_db_ok, dashboard = pcall(require, "dashboard")
	if not status_db_ok then
		Log:error("Unable to configure dashboard")
		return
	end

	local home = os.getenv("HOME")

	local hyper_config = {
		center = {
			{
				icon = "  ",
				desc = "Find  File                              ",
				action = "Telescope find_files find_command=rg,--hidden,--files",
				keymap = "SPC p",
			},
			{
				icon = "  ",
				desc = "File Browser                            ",
				action = "lua _RANGER_TOGGLE()",
				keymap = "SPC ",
			},
			{
				icon = "  ",
				desc = "Open Personal dotfiles                  ",
				action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
				keymap = "SPC f d",
			},
		},
	}

	-- Log.debug("Dashboard")
	dashboard.setup({
		theme = "doom",
		hide = {
			statusline = true,
			tabline = true,
			winbar = true,
		},
		config = {
			header = {
				"",
				"",
				"",
				" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
				" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
				" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
				" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
				" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
				" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
				"",
				"",
				"",
			},
			center = {
				{
					icon = "  ",
					icon_hl = "Title",
					desc = "Find File           ",
					desc_hl = "String",
					key = "f",
					key_hl = "Number",
					action = "Telescope find_files find_command=rg,--hidden,--files",
				},
				{
					icon = "  ",
					icon_hl = "Title",
					desc = "TODO: Open Personal dotfiles                  ",
					desc_hl = "String",
					key = "d",
					key_hl = "Number",
					action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
				},
			},
		},
	})
end

return M
