autocmd VimEnter * set formatoptions=croqljn1 " Describes how automatic formatting is done
" :help fo-table
"   t   Auto-wrap text using textwidth
"   c   Auto-wrap comments using textwidth, inserting the current comment leader automatically.
"   r   Automatically insert the current comment leader after hitting <Enter> in Insert mode.
"   o   Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
"   q   Allow formatting of comments with 'gq'.
"       Note that formatting will not change blank lines or lines containing only the comment leader.
"       A new paragraph starts after such a line, or when the comment leader changes.
"   w   Trailing white space indicates a paragraph continues in the next line.
"       A line that ends in a non-white character ends a paragraph.
"   a   Automatic formatting of paragraphs.  Every time text is inserted or deleted the paragraph will be reformatted.
"       See |auto-format|.
"       When the 'c' flag is present this only happens for recognized comments.
"   n   When formatting text, recognize numbered lists.
"       This actually uses the 'formatlistpat' option, thus any kind of list can be used.
"       The indent of the text after the number is used for the next line.
"       The default is to find a number, optionally followed by '.', ':', ')', ']' or '}'.
"       Note that 'autoindent' must be set too.  Doesn't work well together with '2'.
"       Example:
"               1. the first item wraps
"               2. the second item
"   2   When formatting text, use the indent of the second line of a paragraph for the rest of the paragraph, instead of the indent of the first line.
"       This supports paragraphs in which the first line has a different indent than the rest.
"       Note that 'autoindent' must be set too.
"       Example:
"               first line of a paragraph
"           second line of the same paragraph
"           third line.
"       This also works inside comments, ignoring the comment leader.
"   v   Vi-compatible auto-wrapping in insert mode:
"       Only break a line at a blank that you have entered during the current insert command.
"       (Note: this is not 100% Vi compatible.  Vi has some 'unexpected features' or bugs in this area.
"       It uses the screen column instead of the line column.)
"   b   Like 'v', but only auto-wrap if you enter a blank at or before the wrap margin.
"       If the line was longer than 'textwidth' when you started the insert,
"       or you do not enter a blank in the insert before reaching 'textwidth', Vim does not perform auto-wrapping.
"   l   Long lines are not broken in insert mode:
"       When a line was longer than 'textwidth' when the insert command started, Vim does not automatically format it.
"   m   Also break at a multi-byte character above 255.
"       This is useful for Asian text where every character is a word on its own.
"   M   When joining lines, don't insert a space before or after a multi-byte character.
"       Overrules the 'B' flag.
"   B   When joining lines, don't insert a space between two multi-byte characters.
"       Overruled by the 'M' flag.
"   1   Don't break a line after a one-letter word.  It's broken before it instead (if possible).
"   j   Where it makes sense, remove a comment leader when joining lines.
"       For example, joining:
"           int i;      // the index ~
"                       // in the list ~
"       Becomes:
"           int i;      // the index in the list ~

" cdph = Change to Directory of Current file
command CDPH cd %:p:h

" Unicode
set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8



" Show the current cursor location
highlight CursorLine cterm=bold

function! SetCTermInsertColours()
  if &readonly
    highlight CursorLine ctermbg=DarkRed
  else
    highlight CursorLine cterm=bold,underline
  endif
endfunction

au InsertEnter * call SetCTermInsertColours()
au InsertLeave * highlight CursorLine cterm=bold ctermbg=black



" Enable syntax highlighting for LLVM files.
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END




" auto-completion
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-space>'
let g:clang_complete_copen = 1    " show Clang errors in quickfix




" Avoid freezing on offending code
let g:clang_user_options='|| exit 0'
let g:clang_close_preview=1



" LLVM colouring
au! BufNewFile,BufRead *.ll set syntax=llvm
autocmd BufRead *.yy let g:yacc_uses_cpp=1 | set syntax=yacc
let g:airline_powerline_fonts = 1


" Toggle between relativenumber and norelativenumber when leaving and entering
" insert mode
function ToggleNumbersOn()
    set rnu!
endfunction
function ToggleRelativeOn()
    set rnu
endfunction
autocmd FocusLost * call ToggleNumbersOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleNumbersOn() "Set to absolute numbering in insert mode.
autocmd InsertLeave * call ToggleRelativeOn() "Set to relative numbering in normal mode

" Automatically delete any trailing whitespace when exiting insert mode.
" autocmd InsertLeave * %s/\s\+$//e

map <leader>dw :call DeleteTrailingWhitespace()<cr>

function DeleteTrailingWhitespace()
    :%s/\s\+$//e
endfunction

