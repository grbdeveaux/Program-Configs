behave xterm
syntax on

"Set mapleader to space instead of the default "\" as per convention to be able
"to use both hands.
"let mapleader="\<Space>"

" Source /vimrc files
source $HOME/.config/nvim/custom/dragvisuals.vim
source $HOME/.config/nvim/custom/folding.vim
source $HOME/.config/nvim/custom/listtrans.vim
source $HOME/.config/nvim/custom/looks.vim
source $HOME/.config/nvim/custom/mappings.vim
source $HOME/.config/nvim/custom/misc.vim
source $HOME/.config/nvim/custom/plugin_configs.vim
source $HOME/.config/nvim/custom/settings.vim
source $HOME/.config/nvim/custom/spelling.vim

call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'christoomey/vim-tmux-navigator'
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'neomake/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme solarized

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

""neosnippet
""imap <leader><TAB>  <Plug>(neosnippet_expand_or_jump)
"smap <leader><TAB>  <Plug>(neosnippet_expand_or_jump)
"xmap <leader><TAB>  <Plug>(neosnippet_expand_target)
"inoremap <silent><expr> <leader><TAB> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
"aut<Plug>(neosnippet_expand_or_jump) aut<Plug>(neosnippet_expand_or_jump)
"
"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <leader><tab> <Plug>(neosnippet_expand_or_jump)
smap <leader><tab> <Plug>(neosnippet_expand_or_jump)
xmap <leader><tab> <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/dotfiles/nvim/plugged/vin-snippets/snippets'
