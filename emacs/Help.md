Loading Lisp Files
https://www.emacswiki.org/emacs/LoadingLispFiles

# Batch Compile Entire Directory
    https://stackoverflow.com/questions/1217180/how-do-i-byte-compile-everything-in-my-emacs-d-directory

( C-u 0 M-x byte-recompile-directory )

will compile all the .el files in the directory and in all subdirectories below.

The C-u 0 part is to make it not ask about every .el file that does not have a .elc counterpart.
