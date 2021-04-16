let maplocalleader=","

" TaLeX
Plug 'lervag/vimtex'
" Plug 'vim-latex/vim-latex'

let g:vimtex_compiler_latexrun_engines = {
    \ '_'                : 'xelatex',
    \ 'pdflatex'         : 'pdflatex',
    \ 'lualatex'         : 'lualatex',
    \ 'xelatex'          : 'xelatex',
    \}

let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
	\	'-shell-escape',
    \ ],
    \}

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

let g:vimtex_compiler_latexrun = {
    \ 'build_dir' : '',
    \ 'options' : [
	\   '-verbose-cmds',
    \   '--latex-args="-synctex=1 -shell-escape"',
    \ ],
    \}
    " \   '--latex-args="-synctex=1 -shell-escape"',
