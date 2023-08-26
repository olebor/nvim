local M = {}
local Log = require("core.log")

M.config = function()
	local status_db_ok, dashboard = pcall(require, "dashboard")
	if not status_db_ok then
		Log:error("Unable to configure dashboard")
		return
	end

	local home = os.getenv("HOME")

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
