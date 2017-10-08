;;Identification
(setq user-full-name "Gabriel R. Deveaux")
(setq user-mail-address "grbdeveaux@gmail.com")

;;Keep auto-save files in temp directory. Use "echo $TMPDIR" to locate directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;;Set theme
(load-theme 'sanityinc-tomorrow-night)
;; (load-theme 'solarized-dark)
;; (load-theme 'zenburn)

;; Set default window size
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 90))

;; Set default line length
(setq-default fill-column 80)

;; Silence redefinition messages
(setq ad-redefinition-action 'accept)

(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("Latexmk" "latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf %s" TeX-run-command nil t
      :help "Run Latexmk on file")
    TeX-command-list)))

(provide 'startup)
