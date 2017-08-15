" C and C++

"" C/C++ programming helpers
augroup csrc
    au!
    autocmd FileType *      set nocindent smartindent
    autocmd FileType c,cpp  set cindent
augroup END


" enable Doxygen comments in C(++)
au! Syntax {c,cpp}
au Syntax {c,cpp} runtime syntax/doxygen.vim



let cpp_fold=1
let c_fold=1
