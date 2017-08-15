;;Prevent font scaling in Org Mode
(defun my/org-mode-hook ()
  "Stop the org-level headers from increasing in height relative to the other text."
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

(add-hook 'org-mode-hook 'my/org-mode-hook)

;;Rainbow Delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'hooks)
