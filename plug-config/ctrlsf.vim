" https://github.com/dyng/ctrlsf.vim
" Requires ripgrep -> pacman -S ripgrep

let g:ctrlsf_winsize = '35%'
let g:ctrlsf_search_mode = 'async'

" let g:ctrlsf_backend = 'rg'
" let g:ctrlsf_default_view_mode = 'compact'
" let g:ctrlsf_regex_pattern = 1

let g:ctrlsf_auto_close = {
    \ "normal" : 0,
    \ "compact": 0
    \}

let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \ }
