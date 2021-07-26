" Copy to clipboard
vmap cp "+ygv

" paste
nmap paste "+p}k

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Return to last edit when opening files!
au BufreadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Turn persistent undo on
try
	set undodir=~/.vimruntime/undodir
	set undofile
catch
endtry

" Quickfix

if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif

augroup GrepCmd
    autocmd!
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

" To go to the next search result do:
map <leader>n :cn<cr>

" To go to the previous search results do:
map <leader>p :cp<cr>

" Quickfix list
map <leader>q :botright cope<cr>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" When you press g you grep after the selected text
vnoremap <leader>g :call VisualSelection('gv', '')<CR>



function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("vim " . l:pattern . " * " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" IM Control for Linux
if has("mac") || has("macunix")

else
    function! ImActivate(active)
      if a:active
        call system('fcitx-remote -o')
      else
        call system('fcitx-remote -c')
      endif
    endfunction
    
    function! ImStatus()
      return system('fcitx-remote')[0] is# '2'
    endfunction
    
    set iminsert=1
    set imsearch=1
    set imactivatefunc=ImActivate
    set imstatusfunc=ImStatus
endif

