;; Move Regions of test up and down
(defmacro save-column (&rest body)
  `(let ((column (current-column)))
     (unwind-protect
         (progn ,@body)
       (move-to-column column))))
(put 'save-column 'lisp-indent-function 0)

(defun move-line-up ()
  (interactive)
  (save-column
    (transpose-lines 1)
    (forward-line -2)))

(defun move-line-down ()
  (interactive)
  (save-column
    (forward-line 1)
    (transpose-lines 1)
    (forward-line -1)))

(defun now ()
  "Insert string for the current time formatted like '2:34 PM'."
  (interactive)                 ; permit invocation in minibuffer
  ;(insert (format-time-string "%D %-I:%M %p")))
  (insert (format-time-string "%Y-%m-%d %H:%M")))
  ;; (insert (format-time-string " %d %B %Y")))

(defun today ()
  "Insert string for today's date nicely formatted in American style,
e.g. Sunday, September 17, 2000."
  (interactive)                 ; permit invocation in minibuffer
  ;; (insert (format-time-string "%A, %B %e, %Y")))
  (insert (format-time-string "%d %B %Y")))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; term automatically runs in zsh
(defun tempterm ()
  (interactive)
  (split-window-below (floor (* 0.8 (window-height))))
  (windmove-down)
  (term "/bin/bash")
  (turn-off-evil-mode)
  )

(global-set-key (kbd "C-c t") 'tempterm)

;; C-c C-j and C-c C-k now TOGGLE term-mode
(require 'term)

(defun jnm/term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (gochar)
    (goin)))

(defun gochar ()
  "Goes into term-char-mode"
  (interactive)
  (term-char-mode)
  ;; (evil-insert)
  (end-of-buffer)
  ;; (comint-send-input)
  ;; (kill-line)
  (turn-off-evil-mode)
  (setq cursor-type 'bar)
  )

(defun goin ()
  (interactive)
  (term-line-mode)
  (turn-on-evil-mode)
  ;; (evil-force-normal-state)
  )

;; (define-key term-mode-map (kbd "C-c C-j") 'jnm/term-toggle-mode)
;; (define-key term-mode-map (kbd "C-c C-k") 'jnm/term-toggle-mode)

;; (define-key term-raw-map (kbd "C-c C-j") 'jnm/term-toggle-mode)
;; (define-key term-raw-map (kbd "C-c C-k") 'jnm/term-toggle-mode)

(provide 'functions)
