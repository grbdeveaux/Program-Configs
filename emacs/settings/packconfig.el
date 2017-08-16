;;EVIL
(evil-mode 1)

;;LINUM
(global-linum-mode 1)
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

;;HYDRA
(global-set-key
 (kbd "C-M-o")
 (defhydra hydra-window ()
   "window"
   ("h" windmove-left)
   ("j" windmove-down)
   ("k" windmove-up)
   ("l" windmove-right)
   ("0" delete-window "clo")
   ("^" enlarge-window "tal")
   ("}" enlarge-window-horizontally "wid")
   ("{" shrink-window-horizontally "nar")
   ("-" shrink-window-if-larger-than-buffer "shr")
   ("+" balance-windows "bal")
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
        "ace")
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
        "vert")
   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
        "horz")
   ("s" (lambda ()
          (interactive)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
        "swap")
   ("d" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
        "del")
   ("o" delete-other-windows "1" :color blue)
   ("i" ace-maximize-window "a1" :color blue)
   ("SPC" nil "cancel")))

;; Smooth Scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 5)



;;Whitespace Mode
(setq whitespace-line-column 80)
(setq whitespace-style '(face trailing)) ;;Face, space and hard space

(setq-default show-trailing-whitespace t) ;;Trailing whitespace
(setq-default whitespace-display-mappings '((trailing 32 [?·])))

(global-whitespace-mode 1)

;; yasnippet code 'optional', before auto-complete
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
(yas-global-mode 1)

;; auto-complete setup, sequence is important
(require 'auto-complete)
(add-to-list 'ac-modes 'latex-mode) ; beware of using 'LaTeX-mode instead
(require 'ac-math) ; package should be installed first
(defun my-ac-latex-mode () ; add ac-sources for latex
  (setq ac-sources
        (append '(ac-source-math-unicode
                  ac-source-math-latex
                  ac-source-latex-commands)
                ac-sources)))
(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)
(setq ac-math-unicode-in-math-p t)
(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
(add-to-list 'ac-modes 'org-mode) ; auto-complete for org-mode (optional)
(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
(ac-config-default)
(setq ac-auto-start t)            ; if t starts ac at startup automatically
(setq ac-auto-show-menu t)
(setq ac-delay 0)
(setq ac-auto-show-menu 0)
(setq ac-quick-help-delay 0.5)
(global-auto-complete-mode t)

;;YASnippet Compatibility
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<S-tab>") 'yas-expand) ;Shift-Tab to expand yasnippet

;;AUCTEX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;;hlinum
(require 'hlinum)
(hlinum-activate)
(setq linum-highlight-face "red")    ;I think this is getting overwritten by solarized.
(setq linum-highlight-in-all-buffersp t)

;;Shell
(defun shell ()
  (interactive)
  (ansi-term "/bin/zsh"))

(provide 'packconfig)
