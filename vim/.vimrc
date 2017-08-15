" Source Vundle
source $HOME/.vim/vimrc/plug.vim

behave xterm
syntax on

"Set mapleader to space instead of the default "\" as per convention to be able
"to use both hands.
let mapleader="\<Space>"

" Source /vimrc files
source $HOME/.vim/vimrc/dragvisuals.vim
source $HOME/.vim/vimrc/filetypes.vim
source $HOME/.vim/vimrc/folding.vim
source $HOME/.vim/vimrc/listtrans.vim
source $HOME/.vim/vimrc/looks.vim
source $HOME/.vim/vimrc/mappings.vim
source $HOME/.vim/vimrc/misc.vim
source $HOME/.vim/vimrc/plugin_configs.vim
source $HOME/.vim/vimrc/settings.vim
source $HOME/.vim/vimrc/spelling.vim

" Source a local gvimrc if it exists
if filereadable(expand("$HOME/.gvimrc.local"))
  source $HOME/.gvimrc.local
endif


" Source a local vimrc if it exists
if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif

"Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
colorscheme solarized

