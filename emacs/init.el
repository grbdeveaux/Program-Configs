;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path "/usr/texbin") ;; Set path to tex

;;first string in quotes is the directory (excluding file) given by the CLI command "which latex" https://tex.stackexchange.com/questions/24510/pdflatex-fails-within-emacs-app-but-works-in-terminal

(getenv "PATH")
(setenv "PATH"
        (concat
         "/Library/TeX/texbin" ":"
         "/usr/texbin" ":"
         "/usr/local/bin" ":"
         (getenv "PATH")))

(setq preview-gs-command "/usr/local/bin/gs")

(provide 'init)
