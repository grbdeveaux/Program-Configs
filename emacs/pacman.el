;; Repositories

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

;;Rainbow Delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; yasnippet code 'optional', before auto-complete
(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<M-tab>") 'yas-expand) ;; Alt-Tab to expand yasnippet
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
  (define-key company-active-map (kbd "<return>") nil)
  (define-key company-active-map (kbd "RET") nil)
  ;; (define-key company-active-map (kbd "TAB") nil)
  (define-key company-active-map [tab] 'company-select-next)
  ;; (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map [S-tab] 'company-select-previous)
  ;; (define-key company-active-map (kbd "C-TAB") 'company-complete-selection)
  (define-key company-active-map [C-tab] 'company-complete-common)
  (define-key company-active-map [C-return] 'company-complete-selection)
  (define-key company-active-map (kbd "<up>") nil)
  (define-key company-active-map (kbd "<down>") nil)
  (define-key company-active-map (kbd "C-e") 'company-abort)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq company-show-numbers t)) ;<M-nthdigit> expands suggestion at the nth digit

;;Term
(defun term ()
  (interactive)
  (ansi-term "/bin/zsh"))

(provide 'pacman)
