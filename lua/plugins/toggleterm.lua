local function configureToggleterm()
	local toggleterm = require("toggleterm")

	toggleterm.setup({
		size = 20,
		open_mapping = [[<C-t>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		-- persist_mode defaults to true and overrides start_in_insert, which
		-- makes the terminal come back in normal mode after leaving it via the
		-- <C-\><C-n> window-nav mappings below.
		persist_mode = false,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})

	function _G.set_terminal_keymaps()
		local opts = { noremap = true }
		-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
		-- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)

		-- Clicking inside a terminal buffer makes nvim drop terminal focus
		-- (:help terminal-mouse) unless the running program handles the mouse
		-- itself. That includes the click that refocuses the nvim window from
		-- another app, which kicks us out of insert mode. Swallow left clicks
		-- so the terminal stays in insert mode -- but only for plain shell
		-- terminals: TUIs like lazygit and ranger set `cmd` and want the mouse.
		local ok, terms = pcall(require, "toggleterm.terminal")
		if ok then
			local _, term = terms.identify()
			if term and term.cmd == nil then
				local clicks = { "<LeftMouse>", "<2-LeftMouse>", "<3-LeftMouse>", "<LeftDrag>", "<LeftRelease>" }
				for _, click in ipairs(clicks) do
					vim.api.nvim_buf_set_keymap(0, "t", click, "<Nop>", opts)
				end
			end
		end
	end

	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

	function _LAZYGIT_TOGGLE()
		lazygit:toggle()
	end

	local ranger = Terminal:new({ cmd = "ranger", hidden = true })

	function _RANGER_TOGGLE()
		ranger:toggle()
	end
end

return {
	"akinsho/toggleterm.nvim",
	config = configureToggleterm,
}
