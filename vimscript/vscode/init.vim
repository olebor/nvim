" Simulate same TAB behavior in VSCode
nmap <Tab> :Tabnext<CR>
nmap <S-Tab> :Tabprev<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
