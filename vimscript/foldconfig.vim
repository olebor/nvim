
" Unfold on open any file
augroup all_files
  autocmd!
  autocmd BufRead * :set foldlevel=20
augroup END


" Folding Rules for JS/TS
augroup filetype_js_ts
  autocmd!
  autocmd FileType javascript,typescript :set foldmethod=expr
  autocmd FileType javascript,typescript :set foldexpr=nvim_treesitter#foldexpr()
  autocmd FileType javascript,typescript :set foldnestmax=1
augroup END


augroup filetype_json
  autocmd!
  autocmd FileType json :set foldmethod=indent
augroup END
