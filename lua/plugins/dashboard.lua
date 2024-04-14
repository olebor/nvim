-- Dashboard

local function configureDashboard()
	local dashboard = require("dashboard")
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

-- Return object for Lazy
return {
	"nvimdev/dashboard-nvim",
	-- event = "BufWinEnter",
	event = "VimEnter",
	config = configureDashboard,
}
