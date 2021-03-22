-------------------------------------------------------------------------------
--
-- Keymappings for non-VSCode
--
-------------------------------------------------------------------------------

-- Leader Remap
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- Disable arrow keys in normal mode
vim.api.nvim_set_keymap('n','<up>', '<NOP>', { silent = true })
vim.api.nvim_set_keymap('n','<down>', '<NOP>', { silent = true })
vim.api.nvim_set_keymap('n','<left>', '<NOP>', { silent = true })
vim.api.nvim_set_keymap('n','<right>', '<NOP>', { silent = true })

-- Remap ESC
vim.api.nvim_set_keymap('i','jj', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','jk', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','kj', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i','<C-c>', '<ESC>', { noremap = true, silent = true })

-- Better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Swich tabs
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true})


-- Move Selected Lines in Visual Mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true, silent = true})

-- TODO Below
-- " Better nav for omnicomplete
-- inoremap <expr> <c-j> ("\<C-n>")
-- inoremap <expr> <c-k> ("\<C-p>")oo
--



-- inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
-- xnoremap K :move '<-2<CR>gv-gv
-- xnoremap J :move '>+1<CR>gv-gv
-- nnoremap <silent> <c-up>    :resize -2<cr>
-- nnoremap <silent> <c-down>  :resize +2<cr>
-- nnoremap <silent> <c-left>  :vertical resize -2<cr>
-- nnoremap <silent> <c-right> :vertical resize +2<cr>
-- 
-- let g:elite_mode=0                      " Disable arrows"
-- " Disable arrow movement, resize splits instead.
-- if get(g:, 'elite_mode')
	-- nnoremap <C-Up>    :resize -2<CR>
	-- nnoremap <C-Down>  :resize +2<CR>
	-- nnoremap <C-Left>  :vertical resize -2<CR>
	-- nnoremap <C-Right> :vertical resize +2<CR>
-- endif
