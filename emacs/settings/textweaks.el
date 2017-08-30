(add-hook 'TeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))

(add-hook 'find-file-hook 'TeX-fold-buffer t)

(provide 'textweaks)
