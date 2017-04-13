"Set mapleader to "," instead of the default "\" as per convention
let mapleader=","

"let javaScript_fold=1         " JavaScript
"let perl_fold=1               " Perl
"let php_folding=1             " PHP
"let r_syntax_folding=1        " R
"let ruby_fold=1               " Ruby
"let sh_fold_enabled=1         " sh
"let vimsyn_folding='aq'       " Vim script
"let xml_syntax_folding=1      " XML


set foldenable                          " Enable folding by default
set foldmethod=syntax                   " Fold by syntax by default
set foldignore=                         " Fold no matter the character starting the line
set foldcolumn=3                        " Allows for # columns of folding level indicators
set foldnestmax=9                       " Sets the maximum amount of fold levels to #.
set foldlevelstart=0                    " Fold everything by default


" <leader>fo toggles between foldmethod indent, manual, and syntax.
" Toggle fold methods with ,fo
let g:FoldMethod = 0
map <leader>fo :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe 'set foldmethod=indent'
        let g:FoldMethod = 1
        :set foldmethod?
    else
        exe 'set foldmethod=syntax'
        let g:FoldMethod = 0
        :set foldmethod?

    endif
endfun


