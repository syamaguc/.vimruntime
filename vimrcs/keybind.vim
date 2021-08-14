" -------------
" => Editing
" -------------
inoremap <silent> jj <ESC>
imap <silent> kk <ESC>f)a
noremap j gj
noremap k gk
noremap <leader>w :w<CR>

" -------------
" => Moving
" -------------
" jump motion
noremap <C-i> <C-i>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Complement moving
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Bash like keys for the command line
cnoremap <C-a>		<Home>
cnoremap <C-e>		<End>

" jump to bracket
nmap H [%
nmap L ]%

" -------------
" => Explorer
" -------------
" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :Rg<CR>

" Tab
nmap <leader>1 :tabfirst<cr>
nmap <C-t> :tabnew<cr>
nmap <C-w> :tabclose<cr>
nmap <C-q> :tabonly<cr>
nmap <leader><TAB> :tabnext<cr>

" -------------
" => Other
" -------------

" Fast saving
nmap <leader><ESC> <ESC><S-z><S-z>

" Reloading .vimrc
autocmd! bufwritepost ~/.vimruntime/vimrcs/* source ~/.vimrc

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
