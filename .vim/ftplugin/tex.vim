"Set mapleader to "," instead of the default "\" as per convention
let mapleader=","

setlocal spell spelllang=en_us                           " Use US English spelling
setlocal spell

"vimtex
set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()

" Keymap to toglle vimtex folding settings on

map <leader>lf :call LaTeXFold()<cr>
fun! LaTeXFold()
    :set foldmethod=expr
    :set foldexpr=vimtex#fold#level(v:lnum)
    :set foldtext=vimtex#fold#text()
    :set foldmethod?
endfun

