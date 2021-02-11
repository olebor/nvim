" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	"autocmd VimEnter * PlugInstall
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
	if exists('g:vscode')
		" Easy motion for VSCode
		" Plug 'asvetliakov/vim-easymotion'
	else
		" Theme
		Plug 'dracula/vim'

		" Auto pairs for '(' '[' '{'
		Plug 'jiangmiao/auto-pairs'
		" Language Client
		Plug 'neoclide/coc.nvim', {'branch': 'release'}

		" TypeScript Highlighting
		Plug 'leafgarland/typescript-vim'
		Plug 'peitalin/vim-jsx-typescript'

		" File Explorer with Icons
		Plug 'scrooloose/nerdtree'
		Plug 'ryanoasis/vim-devicons'

		" File Search
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		Plug 'junegunn/fzf.vim'

		Plug 'vim-airline/vim-airline'

		" Terraform
		Plug 'hashivim/vim-terraform'
	endif
call plug#end()
