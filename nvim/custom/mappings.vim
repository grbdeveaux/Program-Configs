" As much as possible, remap most frequent actions to leader commands.
" And DO NOT make stupid, useless mappings like remapping ; to : or v to V or q:
" to :q. Just learn to type better and stick to conventions.

" Easier browsing of long lines
noremap <Down> gj
noremap <Up> gk
noremap 0 g0
noremap ^ g^
noremap $ g$
nnoremap C cg$
nnoremap D dg$
nnoremap I g^i
nnoremap A g$a

" Faster scrolling
noremap <C-Y> 5<C-Y>
noremap <C-E> 5<C-E>

" Make it easier to place (p) in insert mode
inoremap ppp <Esc>pa

autocmd ColorScheme * highlight WhiteOnRed guibg=darkred ctermbg=white

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.1)<cr>
nnoremap <silent> N   N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#\%('.@/.'\)'
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

"For dragvisuals.vim
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving
let g:DVB_TrimWS = 1

"For listtrans.vim
nmap  ;l   :call ListTrans_toggle_format()<CR>
vmap  ;l   :call ListTrans_toggle_format('visual')<CR>

" Automatically jump to end of text you copied or pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" LaTeXBox Latexmk compile to pdf
nmap <silent> <leader>mk :Latexmk<CR>

"Condition because the * register doesn't work in linux
if has('unix')
    " Copy to clipboard
    vnoremap  <leader>y  "+y
    nnoremap  <leader>Y  "+yg_
    nnoremap  <leader>y  "+y
    nnoremap  <leader>yy "+yy

    " Paste from clipboard
    nnoremap <leader>p "+p
    nnoremap <leader>P "+P
    vnoremap <leader>p "+p
    vnoremap <leader>P "+P
else
    " Copy to clipboard
    vnoremap  <leader>y  "*y
    nnoremap  <leader>Y  "*yg_
    nnoremap  <leader>y  "*y
    nnoremap  <leader>yy "*yy

    " Paste from clipboard
    nnoremap <leader>p "*p
    nnoremap <leader>P "*P
    vnoremap <leader>p "*p
    vnoremap <leader>P "*P
endif

"Switching tab pages
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
