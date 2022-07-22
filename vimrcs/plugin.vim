call plug#begin('~/.vimruntime/plugged')

" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'jbmorgado/vim-pine-script'
Plug 'cacharle/c_formatter_42.vim'
Plug 'editorconfig/editorconfig-vim'

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

" Edit
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Misc
Plug 'lilydjwg/colorizer'
Plug 'liuchengxu/vim-which-key'
Plug 'vimwiki/vimwiki'
Plug 'vim-denops/denops.vim'
Plug 'kat0h/bufpreview.vim'


" snipets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Other
Plug 'pbondoer/vim-42header'

call plug#end()
