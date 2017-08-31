(setq TeX-fold-mode 1)

(add-hook 'find-file-hook 'TeX-fold-buffer t)

;; With reftex, you can use C-c = to display a useful table of contents for the TeX file for quick navigation.
(add-hook 'find-file-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

(setq reftex-toc-split-windows-horizontally t)

(provide 'textweaks)
