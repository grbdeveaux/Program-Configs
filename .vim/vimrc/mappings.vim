" Remap hh to function as an escape key in insert mode.
inoremap hh <Esc>

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


" Make tab switching easier on macs
if has("mac")
    nmap <D-1> 1gt
    nmap <D-2> 2gt
    nmap <D-3> 3gt
    nmap <D-4> 4gt
    nmap <D-5> 5gt
    nmap <D-6> 6gt
    nmap <D-7> 7gt
    nmap <D-8> 8gt
    nmap <D-9> 9gt
    imap <D-1> <ESC>1gt
    imap <D-2> <ESC>2gt
    imap <D-3> <ESC>3gt
    imap <D-4> <ESC>4gt
    imap <D-5> <ESC>5gt
    imap <D-6> <ESC>6gt
    imap <D-7> <ESC>7gt
    imap <D-8> <ESC>8gt
    imap <D-9> <ESC>9gt
endif

" Better window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Swap v and CTRL-V, because Block mode is more useful that Visual mode

nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v


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
