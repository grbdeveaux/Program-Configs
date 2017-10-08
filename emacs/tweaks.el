;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ; One line at a time
(setq mouse-wheel-progressive-speed nil) ; Don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ; Scroll window under mouse
(setq scroll-step 1) ; Keyboard scroll one line at a time
(setq scroll-margin 5) ; Start scrolling 5 lines from window edge
(setq scroll-conservatively 10000)

;;Indentation Basics
(setq-default indent-tabs-mode nil) ; All indentation will be made from spaces only
(setq-default tab-width 4) ; Or any other preferred value
(setq indent-line-function 'insert-tab)

;; Delete Trailing Whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Always show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Only visually wrap lines between words
;; (global-visual-line-mode t)
(setq-default word-wrap t)

;; Quickly move between windows using S-"arrow key")
(windmove-default-keybindings)
;; intuitive window resizing
(defun xor (b1 b2)
  (or (and b1 b2)
      (and (not b1) (not b2))))

(defun move-border-left-or-right (arg dir)
  "General function covering move-border-left and move-border-right. If DIR is
     t, then move left, otherwise move right."
  (interactive)
  (if (null arg) (setq arg 3))
  (let ((left-edge (nth 0 (window-edges))))
    (if (xor (= left-edge 0) dir)
        (shrink-window arg t)
        (enlarge-window arg t))))

(defun move-border-up-or-down (arg dir)
  "General function covering move-border-up and move-border-down. If DIR is
     t, then move up, otherwise move down."
  (interactive)
  (if (null arg) (setq arg 3))
  (let ((top-edge (nth 1 (window-edges))))
    (if (xor (= top-edge 0) dir)
        (shrink-window arg nil)
        (enlarge-window arg nil))))

(defun move-border-left (arg)
  (interactive "P")
  (move-border-left-or-right arg t))

(defun move-border-right (arg)
  (interactive "P")
  (move-border-left-or-right arg nil))

(defun move-border-up (arg)
  (interactive "P")
  (move-border-up-or-down arg t))

(defun move-border-down (arg)
  (interactive "P")
  (move-border-up-or-down arg nil))

;; keybindings for window resizing
(global-set-key (kbd "C-S-<left>") 'move-border-left)
(global-set-key (kbd "C-S-<right>") 'move-border-right)
(global-set-key (kbd "C-S-<up>") 'move-border-up)
(global-set-key (kbd "C-S-<down>") 'move-border-down)

;; Cursor settings
(setq blink-cursor-mode nil)

(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)))

(add-hook 'term-mode-hook (lambda()
                            (setq yas-dont-activate t)))

(provide 'tweaks)
