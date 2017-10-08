;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-capture-templates
      '(;; other entries
        ("s" "Scratchpad" plain
         (file+datetree+prompt "~/personal/sratchpad.org")
         "%K - %a\n%i\n%?\n")
        ;; other entries
        ))

;; Visually wrap lines in orgmode
(setq org-startup-truncated nil)

;; (add-hook 'org-mode-hook
;;           ( lambda ()
;;             (global-set-key (kbd "<return>") 'org-return-indent)
;;             ))

(provide 'orgman)
