-- vim.cmd('set rtp+=~/.config/nvcode')
if not vim.g.vscode then
	vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
	vim.cmd('source $HOME/.config/nvim/plug-config/polyglot.vim')
end

vim.cmd('source $HOME/.config/nvim/vim-plug/plugins.vim')
vim.cmd('source $HOME/.config/nvim/keys/mappings.vim')
vim.cmd('source $HOME/.config/nvim/general/settings.vim')

if vim.g.vscode then
	-- VS Code extension
	--"source $HOME/.config/nvim/vscode/settings.vim
	--"source $HOME/.config/nvim/plug-config/easymotion.vim
	--"source $HOME/.config/nvim/plug-config/highlightyank.vim
else
	-- Theme Stuff
	--" source $HOME/.config/nvim/themes/dracula.vim
	--" source $HOME/.config/nvim/themes/gruvbox.vim
	--" source $HOME/.config/nvim/themes/monokai_pro.vim
	vim.cmd('source $HOME/.config/nvim/themes/molokai.vim')

	-- " General Stuff
	vim.cmd('source $HOME/.config/nvim/keys/which-key.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/start-screen.vim')
	require('nv-bufferline')

	-- " Language Tools
	vim.cmd('source $HOME/.config/nvim/plug-config/coc/coc.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/terraform.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/nerdcommenter.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/rainbow.vim')

	-- " File Management
	vim.cmd('source $HOME/.config/nvim/plug-config/fzf.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/gitgutter.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/vim-rooter.vim')
	require('nv-nvimtree')
	require('nv-telescope')
	require('nv-treesitter')

	--  " Misc
	vim.cmd('source $HOME/.config/nvim/plug-config/terminal.vim')
	vim.cmd('source $HOME/.config/nvim/plug-config/blamer.vim')

	-- " TODO: Sjekk hva som er bra med denne
	vim.cmd('source $HOME/.config/nvim/plug-config/floaterm.vim')
end
