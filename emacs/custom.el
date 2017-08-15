(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (smart-mode-line-respectful)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(fci-rule-color "#383838")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (yasnippet-snippets hlinum color-theme-sanityinc-tomorrow theme-looper telephone-line auctex-latexmk auctex-lua auto-async-byte-compile auto-compile auto-complete-etags auto-dim-other-buffers autothemer ack zenburn-theme ac-math
                        (magit ac-slime ace-window async auctex auto-complete auto-complete-auctex autopair clojure-mode coffee-mode color-theme csharp-mode deft emmet-mode ergoemacs-mode erlang ensime evil evil-org evil-surround feature-mode flycheck flylisp flymd flymh flyparens fortune-cookie fsm gist gist go-autocomplete go-eldoc go-mode graphviz-dot-mode haml-mode haskell-mode helm highlight-quoted htmlize hydra idris-mode linum linum-relative lua-mode macrostep magit magithub markdown-mode marmalade nodejs-repl solarized-theme o-blog org org-evil paredit php-mode powerline puppet-mode py-autopep8 py-isort rainbow-mode restclient rvm scala-mode smart-mode-line smex sml-mode smooth-scrolling use-package web-mode windmove writegood-mode yafolding yaml-mode yasnippet zenburn zenburn-theme)
                        (magit ac-slime ace-window async auctex auto-complete auto-complete-auctex autopair clojure-mode coffee-mode color-theme csharp-mode deft emmet-mode ergoemacs-mode erlang ensime evil evil-org evil-surround feature-mode flycheck flylisp flymd flymh flyparens fortune-cookie fsm gist gist go-autocomplete go-eldoc go-mode graphviz-dot-mode haml-mode haskell-mode helm highlight-quoted htmlize hydra idris-mode linum linum-relative lua-mode macrostep magit magithub markdown-mode marmalade nodejs-repl solarized-theme o-blog org org-evil paredit php-mode powerline puppet-mode py-autopep8 py-isort rainbow-mode restclient rvm scala-mode smart-mode-line smex sml-mode smooth-scrolling use-package web-mode windmove writegood-mode yafolding yaml-mode yasnippet zenburn zenburn-theme)
                        ac-slime ace-window async auctex auto-complete auto-complete-auctex autopair clojure-mode coffee-mode color-theme csharp-mode deft emmet-mode ergoemacs-mode erlang ensime evil evil-org evil-surround feature-mode flycheck flylisp flymd flymh flyparens fortune-cookie fsm gist gist go-autocomplete go-eldoc go-mode graphviz-dot-mode haml-mode haskell-mode helm highlight-quoted htmlize hydra idris-mode linum linum-relative lua-mode macrostep magit magithub markdown-mode marmalade nodejs-repl solarized-theme o-blog org org-evil paredit php-mode powerline puppet-mode py-autopep8 py-isort rainbow-mode restclient rvm scala-mode smart-mode-line smex sml-mode smooth-scrolling use-package web-mode windmove writegood-mode yafolding yaml-mode yasnippet)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#839496" 0.2))
 '(solarized-high-contrast-mode-line t)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16")))))
