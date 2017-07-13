" Set colorscheme
let g:rehash256=1
set background=dark
let g:solarized_contrast = 'high'
colorscheme solarized

" Replace line skip with text selection while holding the shift keys and
" navigating with arrows
let macvim_hig_shift_movement = 1

" Color the 81st column of wide lines
"match ErrorMsg '\%81v'
"call matchadd('ErrorMsg', '\%81v')
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)
