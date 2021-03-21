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
