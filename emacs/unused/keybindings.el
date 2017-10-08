;; Resize windows more easily
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(global-set-key (kbd "C-M-<backspace>") 'backward-kill-word)
(global-set-key (kbd "M-<backspace>") 'backward-delete-word)

;; M-\ deletes horizontal whitespace around cursor. Can delete trailing whitespace
;; M-SPC makes sure two words are separated by just one space

(provide 'keybindings)
