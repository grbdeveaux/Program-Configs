(setq TeX-fold-mode 1)

;;AUCTEX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(add-hook 'find-file-hook (lambda ()
                            (outline-minor-mode 1)
                            (TeX-fold-mode 1)
                            (TeX-fold-buffer)
                            ))

(setq TeX-source-correlate-method
      '((dvi . synctex)
        (pdf . synctex)))

;; latexmk
(require 'auctex-latexmk)
(auctex-latexmk-setup)

;; With reftex, you can use C-c = to display a useful table of contents for the TeX file for quick navigation.
(add-hook 'find-file-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq reftex-toc-split-windows-horizontally t)

(setq latex-run-command "pdflatex")

(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-start-server t)
(setq TeX-source-correlate-method 'synctex)

(setq TeX-view-program-selection '((output-dvi "Skim")))

(setq TeX-view-program-list
      '(("Skim" "displayline -b -g %n %o %b")))

(setq TeX-PDF-mode t)
(setq TeX-interactive-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(auctex-latexmk-setup)
(setq reftex-plug-into-AUCTeX t)
(setq-default TeX-command-default "Latexmk")
(setq TeX-command-default "Latexmk");
(setq TeX-build-directory "build/")
;;(setq-default TeX-master (format "%s/main" TeX-build-directory))

;; Backwards Search with Skim. Use C-S-Left Mouse Button.
(server-start)
;; Auto-raise Emacs on activation
(defun raise-emacs-on-aqua()
    (shell-command "osascript -e 'tell application \"Emacs\" to activate' &"))
(add-hook 'server-switch-hook 'raise-emacs-on-aqua)

(provide 'textweaks)
