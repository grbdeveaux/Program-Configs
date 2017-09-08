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


" Bindings (All of these should be replaced with snippets
inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
inoremap ;em \emph{}<++><Esc>T{i
inoremap ;bf \textbf{}<++><Esc>T{i
inoremap ;it \textit{}<++><Esc>T{i
inoremap ;ct \textcite{}<++><Esc>T{i
inoremap ;cp \parencite{}<++><Esc>T{i
"inoremap ;em \emph{}<Space><++><Esc>T{i
"inoremap ;bf \textbf{}<Space><++><Esc>T{i
"inoremap ;it \textit{}<Space><++><Esc>T{i
"inoremap ;ct \textcite{}<Space><++><Esc>T{i
"inoremap ;cp \parencite{}<Space><++><Esc>T{i
inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap ;li <Enter>\item<Space>
inoremap ;ref \ref{}<Space><++><Esc>T{i
inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
inoremap ;can \cand{}<Tab><++><Esc>T{i
inoremap ;con \const{}<Tab><++><Esc>T{i
inoremap ;v \vio{}<Tab><++><Esc>T{i
inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
inoremap ;sc \textsc{}<Space><++><Esc>T{i
inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
inoremap ;st <Esc>F{i*<Esc>f}i
inoremap ;beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
"inoremap ;up \usepackage{}<Esc>i
inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
inoremap ;tt \texttt{}<Space><++><Esc>T{i
inoremap ;bt {\blindtext}
inoremap ;nu $\varnothing$
inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
inoremap ;rn (\ref{})<++><Esc>F}i
"""END

inoremap ;ent \gloss{}{<++>}{<++>}<Enter><++><Esc>k0f}i

"""Logical Symbols
inoremap ;m $$<Space><++><Esc>2T$i
inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
inoremap ;neg {\neg}
inoremap ;V {\vee}
inoremap ;or {\vee}
inoremap ;L {\wedge}
inoremap ;and {\wedge}
inoremap ;ra {\rightarrow}
inoremap ;la {\leftarrow}
inoremap ;lra {\leftrightarrow}
inoremap ;fa {\forall}
inoremap ;ex {\exists}
inoremap ;dia	{\Diamond}
inoremap ;box	{\Box}
inoremap ;gt	{\textgreater}
inoremap ;lt	{\textless}
"""END

inoremap ;nom {\textsc{nom}}
inoremap ;acc {\textsc{acc}}
inoremap ;dat {\textsc{dat}}
inoremap ;gen {\textsc{gen}}
inoremap ;abl {\textsc{abl}}
inoremap ;voc {\textsc{voc}}
inoremap ;loc {\textsc{loc}}
inoremap ;inst {\textsc{inst}}
"autocmd FileType tex inoremap ;

"""IPA
inoremap ;tipa \textipa{}<Space><++><Esc>T{i
inoremap ;ae {\ae}
inoremap ;A {\textscripta}
inoremap ;dh {\dh}
inoremap ;yogh {\textyogh}
inoremap ;j {\textdyoghlig}
inoremap ;uh {\textschwa}
inoremap ;eps {\textepsilon}
inoremap ;gam {\textgamma}
inoremap ;I {\textsci}
inoremap ;sh {\textesh}
inoremap ;th {\texttheta}
inoremap ;Th {\textthorn}
inoremap ;TH {\textthorn}
inoremap ;ups {\textupsilon}
inoremap ;ph {\textphi}
inoremap ;om {\textomega}
inoremap ;sig {\textsigma}
inoremap ;oe {\oe}
inoremap ;ng {\ng}
inoremap ;au {\textopeno}
inoremap ;O {\textopeno}
inoremap ;glot {\textglotstop}
inoremap ;ch {\textteshlig}

"Indo-European
inoremap ;dh d\textsuperscript{h}
inoremap ;bh b\textsuperscript{h}
inoremap ;gh g\textsuperscript{h}
inoremap ;gwh g\textsuperscript{hw}
inoremap ;kw k\textsuperscript{w}
inoremap ;gw g\textsuperscript{w}
inoremap ;h1 {h\textsubscript{1}}
inoremap ;h2 {h\textsubscript{2}}
inoremap ;h3 {h\textsubscript{3}}
inoremap ;h4 {h\textsubscript{4}}
"""END

