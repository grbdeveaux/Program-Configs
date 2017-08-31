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

;; With reftex, you can use C-c = to display a useful table of contents for the TeX file for quick navigation.
(add-hook 'find-file-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq reftex-toc-split-windows-horizontally t)

(provide 'textweaks)
