" Mark characters over the 80th column as error
:/\%>80v./+





" Changes background colour over textwidth
let &colorcolumn=join(range(81,999),",")




" Autoload spelling for the specific filetypes
autocmd BufRead *.md setlocal spell
autocmd BufRead *.tex setlocal spell


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




fun! PutEnvironment()
	:call feedkeys("YpkI\\begin{\<Esc>A}\<Esc>jI\\end{\<Esc>A}\<Esc>ko")
"	:normal YpkI\begin{
"	:normal A}
"	:normal jI\end{
"	:normal A}
"	:normal ko
"	:startinsert
"	:call feedkeys("\<Tab>")
"	:startinsert
endfun

