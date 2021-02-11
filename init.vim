"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


if !exists('g:vscode')
	source $HOME/.config/nvim/plug-config/polyglot.vim
	source $HOME/.config/nvim/plug-config/ale.vim
endif
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/general/settings.vim

if exists('g:vscode')
	" VS Code extension
	"source $HOME/.config/nvim/vscode/settings.vim
	"source $HOME/.config/nvim/plug-config/easymotion.vim
	"source $HOME/.config/nvim/plug-config/highlightyank.vim
else
	" Maybe not when in vscode?
"	source $HOME/.config/nvim/plug-config/ale.vim
	source $HOME/.config/nvim/themes/dracula.vim
	source $HOME/.config/nvim/plug-config/coc/coc.vim
	source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
	source $HOME/.config/nvim/plug-config/terraform.vim
	source $HOME/.config/nvim/plug-config/start-screen.vim

	source $HOME/.config/nvim/plug-config/fzf.vim
	source $HOME/.config/nvim/plug-config/nerdtree.vim
	source $HOME/.config/nvim/plug-config/terminal.vim
	source $HOME/.config/nvim/plug-config/gitgutter.vim
	source $HOME/.config/nvim/plug-config/vim-rooter.vim
endif
