;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ; One line at a time
(setq mouse-wheel-progressive-speed nil) ; Don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; Scroll window under mouse
(setq scroll-step 1) ; Keyboard scroll one line at a time
(setq scroll-margin 5) ; Start scrolling 5 lines from window edge

;;Indentation Basics
(setq-default indent-tabs-mode nil) ; All indentation will be made from spaces only
(setq-default tab-width 4) ; Or any other preferred value
(setq indent-line-function 'insert-tab)

;;Line Wrapping
;;(setq-default word-wrap t) ;; Wrap at word boundaries


;; Delete Trailing Whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Always show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

(provide 'tweaks)
