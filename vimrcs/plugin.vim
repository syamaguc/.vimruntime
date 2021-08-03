call plug#begin('~/.vimruntime/plugged')

" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Explorer 
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'christoomey/vim-tmux-navigator'

" Status line
Plug 'itchyny/lightline.vim'

" Dracula
Plug 'dracula/vim'

" Git
Plug 'tpope/vim-fugitive'

" Misc
Plug 'lilydjwg/colorizer'

" Other
Plug 'pbondoer/vim-42header'


call plug#end()
