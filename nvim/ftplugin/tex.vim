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

syn match texSectioningCommand '\\section\>' skipwhite     nextgroup=texSectioningTitle contains=@texSectioningGroup
syn region texSectioningTitle        start='{'  end='}' contained
syn cluster texSectioningGroup contains=texSectioningCommand
syn cluster texChapterGroup contains=@texSectioningGroup


" lukesmithxyz Keybindings have been replaced by snippets (neosnippets) and the following latex packages:
    " gb4e for glosses
    " tipa for IPA Symbols
    " OTablx for OT tableaux
    " tikz and tikz-qtree for syntastic trees
    " avm for Attribute-Value Matrices
