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

"Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"neosnippet
imap <leader><TAB> <Plug>(neosnippet_expand_or_jump)

" Use deoplete.
let g:deoplete#enable_at_startup = 1

colorscheme solarized
