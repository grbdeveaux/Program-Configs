;;Head Hydra
(defhydra hydra-main (:color red :hint nil)
  "
  ^Main^
  ---------------------------------------------
  _w_: Window     _o_: Outline    _a_: Applications
  _m_: Move Text
  "
  ("a" hydra-applications/body :exit t)
  ("o" hydra-outline/body :exit t)
  ("w" hydra-window/body :exit t)
  ("m" hydra-move-text/body :exit t)
  ("SPC" nil "Exit Hydra"))

;;(evil-define-key 'normal emacs-global-mode-map (kbd "SPC") 'hydra-main/body)
(define-key evil-normal-state-map (kbd "SPC") 'hydra-main/body)
(global-set-key (kbd "C-SPC") 'hydra-main/body) ; by example

;; ***** Applications *****

(defhydra hydra-applications (:color red :hint nil)
  "
  ^Applications
  ^^^^^^---------------------------------------------
  _r_: Ranger     _d_: Dired    _t_: Tetris

"
  ("r" ranger   :exit t :color blue)
  ("d" dired    :exit t :color blue)
  ("t" tetris   :exit t :color blue)
  ("SPC" nil "Exit Hydra"))

;; Deluze Window Moving
(require 'windmove)

(defhydra hydra-window (:hint nil)
   "
Movement^^      ^Split^           ^Switch^          ^Resize^
-------------------------------------------------------------------
_h_ ←           _v_ Vertical      _b_ Buffer        _q_ X←
_j_ ↓           _x_ Horizontal    _f_ Find files    _w_ X↓
_k_ ↑           _z_ Undo          _a_ Ace 1         _e_ X↑
_l_ →           _Z_ Reset         _s_ Swap          _r_ X→
_F_ Follow      _D_ Del Others    _S_ Save          _m_ Maximize
_SPC_ cancel    _o_ Only this     _d_ Delete
"
   ("h" windmove-left )
   ("j" windmove-down )
   ("k" windmove-up )
   ("l" windmove-right )
;;   ("q" hydra-move-splitter-left)
;;   ("w" hydra-move-splitter-down)
;;   ("e" hydra-move-splitter-up)
;;   ("r" hydra-move-splitter-right)
   ("q" move-border-left) ;move-border is MUCH faster than hydra-move-splitter
   ("w" move-border-down)
   ("e" move-border-up)
   ("r" move-border-right)
   ("b" helm-mini)
   ("f" helm-find-files)
   ("F" follow-mode)
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
       )
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
       )
   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
       )
   ("s" (lambda ()
          (interactive)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body)))
   ("S" save-buffer)
   ("d" delete-window)
   ("D" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
       )
   ("o" delete-other-windows)
   ("m" ace-maximize-window)
   ("z" (progn
          (winner-undo)
          (setq this-command 'winner-undo))
   )
   ("Z" winner-redo)
   ("SPC" nil)
   )

(defun hydra-move-splitter-left (arg)
  "Move window splitter left."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (shrink-window-horizontally arg)
    (enlarge-window-horizontally arg)))

(defun hydra-move-splitter-right (arg)
  "Move window splitter right."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'right))
      (enlarge-window-horizontally arg)
    (shrink-window-horizontally arg)))

(defun hydra-move-splitter-up (arg)
  "Move window splitter up."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (enlarge-window arg)
    (shrink-window arg)))

(defun hydra-move-splitter-down (arg)
  "Move window splitter down."
  (interactive "p")
  (if (let ((windmove-wrap-around))
	(windmove-find-other-window 'up))
      (shrink-window arg)
    (enlarge-window arg)))

;; intuitive window resizing
(defun xor (b1 b2)
  (or (and b1 b2)
      (and (not b1) (not b2))))

(defun move-border-left-or-right (arg dir)
  "General function covering move-border-left and move-border-right. If DIR is
     t, then move left, otherwise move right."
  (interactive)
  (if (null arg) (setq arg 1))
  (let ((left-edge (nth 0 (window-edges))))
    (if (xor (= left-edge 0) dir)
        (shrink-window arg t)
        (enlarge-window arg t))))

(defun move-border-up-or-down (arg dir)
  "General function covering move-border-up and move-border-down. If DIR is
     t, then move up, otherwise move down."
  (interactive)
  (if (null arg) (setq arg 1))
  (let ((top-edge (nth 1 (window-edges))))
    (if (xor (= top-edge 0) dir)
        (shrink-window arg nil)
        (enlarge-window arg nil))))

(defun move-border-left (arg)
  (interactive "P")
  (move-border-left-or-right arg t))

(defun move-border-right (arg)
  (interactive "P")
  (move-border-left-or-right arg nil))

(defun move-border-up (arg)
  (interactive "P")
  (move-border-up-or-down arg t))

(defun move-border-down (arg)
  (interactive "P")
  (move-border-up-or-down arg nil))


;; ***** Outline *****

(defhydra hydra-outline (:color pink :hint nil)
  "
  ^Hide^             ^Show^           ^Move
  ^^^^^^------------------------------------------------------
  _q_: sublevels     _a_: all         _u_: up
  _t_: body          _e_: entry       _n_: next visible
  _o_: other         _i_: children    _p_: previous visible
  _c_: entry         _k_: branches    _f_: forward same level
  _l_: leaves        _s_: subtree     _b_: backward same level
  _d_: subtree

  "
  ;; Hide
  ("q" hide-sublevels)    ; Hide everything but the top-level headings
  ("t" hide-body)         ; Hide everything but headings (all body lines)
  ("o" hide-other)        ; Hide other branches
  ("c" hide-entry)        ; Hide this entry's body
  ("l" hide-leaves)       ; Hide body lines in this entry and sub-entries
  ("d" hide-subtree)      ; Hide everything in this entry and sub-entries
  ;; Show
  ("a" show-all)          ; Show (expand) everything
  ("e" show-entry)        ; Show this heading's body
  ("i" show-children)     ; Show this heading's immediate child sub-headings
  ("k" show-branches)     ; Show all sub-headings under this heading
  ("s" show-subtree)      ; Show (expand) everything in this heading & below
  ;; Move
  ("u" outline-up-heading)                ; Up
  ("n" outline-next-visible-heading)      ; Next
  ("p" outline-previous-visible-heading)  ; Previous
  ("f" outline-forward-same-level)        ; Forward - same level
  ("b" outline-backward-same-level)       ; Backward - same level
  ("SPC" nil "Exit Hydra"))

(defhydra hydra-move-text ()
  "Move text"
  ("u" move-text-up "up")
  ("d" move-text-down "down")
  ("SPC" nil "Exit Hydra"))

(provide 'hydras)
