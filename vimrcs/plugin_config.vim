"==================
" => Statusline
"==================
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"==================
" => Nerd Tree
"==================
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.git']
let g:NERDTreeWinSize=35
let g:NERDTreeShowBookmarks=1
let g:NERDTreeCustomOpenArgs = {'file': {'reuse': 'all', 'where': 't'}, 'dir': {}}

map <leader>a :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
"if !argc()
"  autocmd vimenter * NERDTree|normal gg7j
"endif

"==================
" => Staritfy
"==================

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_session_dir = '~/.vimruntime/tmp/session'

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/config' },
            \ { 'v': '~/.vimruntime' },
            \ ]

"==================
" => LSP
"==================
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1

let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200

let g:lsp_highlights_enabled = 1
let g:lsp_textprop_enabled = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_text_edit_enabled = 1

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <f2> <plug>(lsp-rename)
    inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
    " refer to doc to add more commands
endfunction
