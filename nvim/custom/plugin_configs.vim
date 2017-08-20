" NERD_Tree
let g:NERDTreeWinPos = 'right'      " Open NERDTree on the right
map <Leader>nrd :NERDTreeFind<CR>
let NERDTreeShowHidden=1            " Show hidden files in NERDTree by default, toggle with 'I'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close Vim if NERDTree is the only window open


" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" vim-latex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'dvi,pdf'


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Inserted for Syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Ultisnips

"" Trigger configuration. Do not use <tab> if you use
"" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<M-tab>"
"let g:UltiSnipsListSnippets="<c-CR>"
"let g:UltiSnipsJumpForwardTrigger=""
"let g:UltiSnipsJumpBackwardTrigger=""
"let g:UltiSnipsEditSplit="vertical"

"" Neosnippet keymappings
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <leader><tab> <Plug>(neosnippet_expand_or_jump)
smap <leader><tab> <Plug>(neosnippet_expand_or_jump)
xmap <leader><tab> <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/dotfiles/nvim/plugged/vin-snippets/snippets'
