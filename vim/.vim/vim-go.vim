" vim-go
Plug 'fatih/vim-go'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" install goimports
"let g:go_fmt_command = "goimports"
" disable fmt at save
"let g:go_fmt_autosave = 0

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" vim-go-extra
" Plug 'vim-jp/vim-go-extra'
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
