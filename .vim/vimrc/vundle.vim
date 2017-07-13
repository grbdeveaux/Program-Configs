set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Main plugins
Plugin 'kien/ctrlp.vim'

Plugin 'raimondi/delimitmate'

Plugin 'tomasr/molokai'

Plugin 'scrooloose/nerdtree'

Plugin 'kien/rainbow_parentheses.vim'

Plugin 'scrooloose/syntastic'

Plugin 'bling/vim-airline'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'lervag/vimtex'

Plugin 'scrooloose/nerdcommenter'

Plugin 'valloric/youcompleteme'

Plugin 'altercation/vim-colors-solarized'

Plugin 'SirVer/ultisnips'   " Track the engine.

Plugin 'honza/vim-snippets'

Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'

" Plugin 'vim-latex/vim-latex' removed in favour of vimtex and ultisnips




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
