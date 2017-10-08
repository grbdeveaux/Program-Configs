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

(setq TeX-view-program-list
        '(("Okular" "okular --unique %o#src:%n`pwd`/./%b")
          ("Skim" "displayline -b -g %n %o %b")
          ("Zathura"
           ("zathura %o"
            (mode-io-correlate
             " --synctex-forward %n:0:%b -x \"emacsclient +%{line} %{input}\"")))))

(setq TeX-view-program-selection '((output-dvi "Skim")))
(setq TeX-view-program-selection '((output-pdf "Skim")))

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

;; Backwards Search with Skim. Use C-S-Left Mouse Button. LaTeXmk with C-c C-c
(server-start)

(require 'tex-site)

(add-to-list 'TeX-output-view-style
             '("^pdf$" "."
               "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b"))

;; Make emacs aware of multi-file projects
(setq-default TeX-master nil)

(provide 'textweaks)
