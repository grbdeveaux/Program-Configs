set spell spelllang=en_us                " Use US English spelling

"let b:deoplete_disable_auto_complete = 1
"let b:neocomplete_disable_auto_complete = 1

"" Neosnippet keymappings
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <leader><tab> <Plug>(neosnippet_expand_or_jump)
smap <leader><tab> <Plug>(neosnippet_expand_or_jump)
xmap <leader><tab> <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/dotfiles/nvim/plugged/vin-snippets/snippets'

