;;Repositories

(setq package-archive-priorities
      '(("melpa-stable" . 30)
        ("marmalade" . 20)
        ("gnu" . 10)
        ("melpa" . 0)))

(setq-default package-menu-hide-low-priority t)


(setq package-archives '(
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/"))
             )

;;Drag stuff
;;(drag-stuff-global-mode 1)
;;(drag-stuff-define-keys)

;;EVIL
(require 'evil)
(evil-mode 1)


;;LINUM
(global-linum-mode 1)
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

;; Smooth Scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 5)


;;Whitespace Mode
(setq whitespace-line-column 80)
(setq whitespace-style '(face)) ;;Face, space and hard space

(setq-default whitespace-display-mappings '((trailing 32 [?·])))

(global-whitespace-mode 1)

;; yasnippet code 'optional', before auto-complete
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/")
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<M-tab>") 'yas-expand) ;Shift-Tab to expand yasnippet
(yas-global-mode 1)

;;Company

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode)

;; set default `company-backends'
(add-to-list 'company-backends
      '(company-files          ; files & directory
        company-keywords       ; keywords
        company-capf
        company-abbrev
        company-dabbrev)
      )

;; company delay until suggestions are shown
(setq company-idle-delay 0.0)

;; weight by frequency
(setq company-transformers '(company-sort-by-occurrence))

;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
(defvar company-mode/enable-yas t "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend)    (member 'company-yasnippet backend)))
  backend
(append (if (consp backend) backend (list backend))
        '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<tab>") #'company-select-next)
  (define-key company-active-map (kbd "<S-tab>") #'company-select-previous)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)) ;<M-nthdigit> expands suggestion at the nth digit

;;AUCTEX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'find-file-hook (lambda () (outline-minor-mode 1)))
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))
;;(add-hook 'find-file-hook 'TeX-fold-buffer t) ;Automatically fold foldable items in buffer when it opens

;;hlinum
(require 'hlinum)
(hlinum-activate)
(setq linum-highlight-face "red")    ;I think this is getting overwritten by solarized.
(setq linum-highlight-in-all-buffersp t)

;;Term
(defun term ()
  (interactive)
  (ansi-term "/bin/zsh"))

;; Rainbow Delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(provide 'pacman)
