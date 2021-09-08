if has('unix') 
  " Clipboard
  set clipboard+=unnamedplus
  " IM control
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
elseif has("mac") || has("macunix")
  " Clipboard
  set clipboard+=unnamed
elseif has('win32') || has ('win64')
endif
