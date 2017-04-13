set autoindent                                      " always set autoindenting on
set autoread                                        " re-read externally edited files
set autowrite                                       " Automatically save before commands like :next
set background=dark                                 " Always pick the dark background
set backspace=start,indent,eol                      " Allow backspace
set cinoptions=:0,g0,(0,Ws,l1                       " Some indentation parameters
set completeopt=menu,menuone,longest                " Options for insert mode autocompletion
set display=lastline                                " Allow last line to be partially shown
set expandtab                                       " Tab key will insert spaces instead of tabs
set guioptions-=L                                   " Remove left scrollbar
set guioptions-=T                                   " Remove toolbar
set guioptions-=r                                   " Remove right scrollbar
set history=999                                     " Keep a lot of history
set hlsearch                                        " Highlight search
set incsearch                                       " Search as you type
set laststatus=2                                    " Always show the status line
set linebreak                                       " Lines over textwidth will wrap
set list                                            " Show trailing whitespace and tabs
set listchars=trail:·,precedes:«,extends:»,tab:»\ 
set mouse=                                          " Completely disable mouse support in vim
set number                                          " (nu) Always show current line's absolute number
set numberwidth=5                                   " Have 5 number columns
set printoptions=number:y                           " Printing
set relativenumber                                  " (rnu/nornu) Default to relative numbering
set shiftwidth=4                                    " The size of an indent
set showbreak=>                                     " Wrapped lines will be indicated with '>'
set showcmd                                         " Display incomplete commands
set smarttab                                        " Add and delete up to 'shiftwidth' number of spaces
set softtabstop=4                                   " Tab enters spaces and tabs to simulate tab stops
set statusline+=%#warningmsg#                       " Inserted for Syntastic
set statusline+=%*                                  " Inserted for Syntastic
set statusline+=%{SyntasticStatuslineFlag()}        " Inserted for Syntastic
set t_ti= t_te=                                     " don't clear the xterm on exit
set textwidth=80 fo=t                               " Default to 80-column lines
set timeout timeoutlen=500                          " Set keymapping detection time limit (in milliseconds)
set whichwrap+=<,>,[,],h,l                          " Allow arrow keys and h and l to switch lines
set wrap                                            " Lines longer than the width of the window will soft-wrap
set so=3                                            " Set scrolling offset
set t_Co=256
set guifont=Inconsolata-g\ for\ Powerline:h12

" highlight trailing whitespace and spaces before a tab in red
" have this highlighting not appear whilst you are typing in insert mode
" have the highlighting of whitespace apply when you open new buffers

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$ \| \+\ze\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
