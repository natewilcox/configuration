syntax on

"Add line numbers
set number
set relativenumber

"Smart/Auto indent
set ai
set si

"Disable backup/swapfiles. It interferes with filewatchers
set nobackup
set nowritebackup
set noswapfile

"Use 4 spaces for tabs
set expandtab
set tabstop=4
set shiftwidth=4

"Used to show filename on bottom
set laststatus=2

"Used to show terminal on bottom
set splitbelow

" Check if the TypeScript language server is executable
if executable('typescript-language-server')
    " Auto command to set up the LSP server for TypeScript files
    augroup lsp
        autocmd!
        autocmd FileType javascript,typescript,typescriptreact,typescriptjsx call lsp#register_server({
            \ 'name': 'tsserver',
            \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
            \ 'allowlist': ['javascript', 'typescript', 'typescriptreact', 'typescriptjsx'],
            \ })
    augroup END
endif

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
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
