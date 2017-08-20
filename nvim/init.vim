behave xterm
syntax on

"Space as a leader is more ergonomic
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

"Make sure filetype specific settings are loaded last
filetype plugin on
