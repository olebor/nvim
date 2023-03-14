local M = {}
local Log = require "core.log"


M.setup = function()

	local status_db_ok, db = pcall(require, "dashboard")
	if not status_db_ok then
		Log.error('Unable to configure dashboard')
		return
	end

	local home = os.getenv('HOME')

	db.custom_header = {
		'', '',
		' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
		' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
		' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
		' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
		' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
		' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
	}

	db.custom_center = {
		{
			icon = '  ',
			desc = 'Find  File                              ',
			action = 'Telescope find_files find_command=rg,--hidden,--files',
			shortcut = 'SPC p'
		},
		{
			icon = '  ',
			desc = 'File Browser                            ',
			action = 'lua _RANGER_TOGGLE()',
			shortcut = 'SPC '
		},
		{
			icon = '  ',
			desc = 'Find  word                              ',
			action = 'Telescope live_grep',
			shortcut = 'SPC f w'
		},
		{
			icon = '  ',
			desc = 'Open Personal dotfiles                  ',
			action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
			shortcut = 'SPC f d'
		},
	}

	vim.g.dashboard_custom_section = {
		a = {
			description = { "  Find File          " },
			command = "Telescope find_files"
		},
		b = {
			description = { "  Recent Projects    " },
			command = "Telescope projects"
		},
		c = {
			description = { "  Recently Used Files" },
			command = "Telescope oldfiles"
		},
		d = {
			description = { "  Find Word          " },
			command = "Telescope live_grep"
		}
		-- e = {
		-- description = {"  Configuration      "},
		-- command = ":e " .. 'config-path-here'
		-- }
	}



end

return M
