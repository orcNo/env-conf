" enable vim-go
source ~/.vim/vim-go.vim

" vim-lsp
Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" tab complate support 
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Highlight references to the symbol under the cursor
let g:lsp_highlight_references_enabled = 1

" enable signals and echo under cursor when in normal mode
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

" debug
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('/tmp/vim-asyncomplete.log')

" specify alternative root markers

let g:lsp_settings_root_markers = [
\   '.git',
\   '.git/',
\   '.svn',
\   '.hg',
\   '.bzr'
\ ]

" clangd server
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
    augroup end
endif
" latex server
if executable('texlab')
    augroup lsp_texlab
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'texlab',
                    \ 'cmd': {server_info->['texlab']},
                    \ 'whitelist': ['tex'],
                    \ })
    augroup end
endif

augroup LspGo
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'go-lang',
      \ 'cmd': {server_info->['gopls']}, 
	  \ 'whitelist': ['go']
      \ })
augroup END

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    " nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
