local M = {}

M.setup = function()
	vim.g.dashboard_disable_at_vimenter = false
	vim.g.dashboard_default_executive = "telescope"
	vim.g.dashboard_custom_section = {
		a = {
			description = {"  Find File          "},
			command = "Telescope find_files"
		},
		b = {
			description = {"  Recent Projects    "},
			command = "Telescope projects"
		},
		c = {
			description = {"  Recently Used Files"},
			command = "Telescope oldfiles"
		},
		d = {
			description = {"  Find Word          "},
			command = "Telescope live_grep"
		},
		-- e = {
			-- description = {"  Configuration      "},
			-- command = ":e " .. 'config-path-here'
		-- }
	}

	-- lvim.builtin.which_key.mappings[";"] = {"<cmd>Dashboard<CR>", "Dashboard"}
	-- vim.g.dashboard_session_directory = lvim.builtin.dashboard.session_directory
	-- require("core.autocmds").define_augroups {
		-- _dashboard = {
			-- seems to be nobuflisted that makes my stuff disappear will do more testing
			-- {
				-- "FileType", "dashboard",
					-- "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= "
			-- }, {
				-- "FileType", "dashboard",
					-- "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=" .. vim.opt.showtabline._value
			-- }, {"FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>"}
		-- }
	-- }

end

return M
