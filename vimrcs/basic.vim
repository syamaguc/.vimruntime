" Leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','


syntax on
filetype plugin on
filetype indent on

" Line
set so=7
set number
" if set cursorline, tmux transparent doesn't work
set cursorline
set ruler

" Clipboard
set clipboard+=unnamed

" Command mode complement
set nocompatible
set wildmenu
set wildmode=longest:full,full

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Cursol shape
let &t_EI .= "\<Esc>[0 q"
let &t_SI .= "\<Esc>[6 q"
autocmd Vimleave * silent !echo -ne "\e[8 q"

" Use Unix as the standard file type
set encoding=utf8
set ffs=unix,dos,mac

" Tab setting
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Specify the behavior when switching between buffers
try
  srt switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Load macro
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
source $VIMRUNTIME/macros/matchit.vim
