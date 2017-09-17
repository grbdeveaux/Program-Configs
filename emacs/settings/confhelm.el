;; Configurations for HELM
(require 'helm)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-s") 'helm-occur)

(require 'helm-descbinds)
(helm-descbinds-mode)
(global-set-key (kbd "C-h b") 'helm-descbinds)

(provide 'confhelm)
