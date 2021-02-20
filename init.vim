"     ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


if !exists('g:vscode')
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	source $HOME/.config/nvim/plug-config/polyglot.vim
endif

" Common Settings
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/general/settings.vim

if exists('g:vscode')
	" VS Code extension
	"source $HOME/.config/nvim/vscode/settings.vim
	"source $HOME/.config/nvim/plug-config/easymotion.vim
	"source $HOME/.config/nvim/plug-config/highlightyank.vim
else
	" Theme Stuff
	" source $HOME/.config/nvim/themes/dracula.vim
	" source $HOME/.config/nvim/themes/gruvbox.vim
	" source $HOME/.config/nvim/themes/monokai_pro.vim
	source $HOME/.config/nvim/themes/molokai.vim

	" General Stuff
	source $HOME/.config/nvim/keys/which-key.vim
	source $HOME/.config/nvim/plug-config/start-screen.vim
	source $HOME/.config/nvim/plug-config/barbar.vim

	" Language Tools
	source $HOME/.config/nvim/plug-config/coc/coc.vim
	source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
	source $HOME/.config/nvim/plug-config/terraform.vim
	source $HOME/.config/nvim/plug-config/nerdcommenter.vim
	source $HOME/.config/nvim/plug-config/rainbow.vim

	" File Management
	source $HOME/.config/nvim/plug-config/fzf.vim
	source $HOME/.config/nvim/plug-config/gitgutter.vim
	source $HOME/.config/nvim/plug-config/vim-rooter.vim

	" Misc
	source $HOME/.config/nvim/plug-config/terminal.vim
	" TODO: Sjekk hva som er bra med denne
	source $HOME/.config/nvim/plug-config/floaterm.vim
endif
