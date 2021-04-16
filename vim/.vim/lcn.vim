Plug 'autozimu/LanguageClient-neovim', { 
	\ 'branch': 'next' ,
	\ 'do': 'bash install.sh',
	\}

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_settingsPath = expand('~/.vim/languageclient.json')
let g:LanguageClient_selectionUI = 'quickfix'
let g:LanguageClient_diagnosticsList = v:null
let g:LanguageClient_hoverPreview = 'Never'
let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands.c = ['cquery']
let g:LanguageClient_serverCommands.cpp = ['cquery']

" noremap <leader>rd :call LanguageClient#textDocument_definition()<cr>
" noremap <leader>rr :call LanguageClient#textDocument_references()<cr>
" noremap <leader>rv :call LanguageClient#textDocument_hover()<cr>
