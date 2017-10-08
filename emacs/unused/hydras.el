;; ***** HEAD HYDRA *****
(defhydra hydra-main (:hint nil)
  "
  ^Main^
  -------------------------------------------------------
  _w_: Window     _O_: Outline     _a_: Applications
  _m_: Move Text  _h_: Helm        _o_: Org Mode
  _u_: Unicode    _y_: YASnippet   _i_: Input Method
  _l_: LaTeX      _g_: Guide
  "
  ("a" hydra-applications/body :exit t)
  ("O" hydra-outline/body :exit t)
  ("w" hydra-window/body :exit t)
  ("o" hydra-org-mode/body :exit t)
  ("m" hydra-move-text/body :exit t)
  ("h" hydra-helm/body :exit t)
  ("u" hydra-unicode/body :exit t)
  ("y" hydra-yasnippet/body :exit t)
  ("i" hydra-input-method/body :exit t)
  ("l" hydra-latex/body :exit t)
  ("g" hydra-guide/body :exit t)
  ("r" josh/org-refile-hydra/body :exit t)
  ("SPC" nil "Exit Hydra"))

;;(evil-define-key 'normal emacs-global-mode-map (kbd "SPC") 'hydra-main/body)
(define-key evil-normal-state-map (kbd "SPC") 'hydra-main/body)
(global-set-key (kbd "S-C-SPC") 'hydra-main/body) ; by example

;; ***** toggle-input-method replacement *****
(defhydra hydra-input-method (:exit t :hint nil)
  "
_l_: latin-9-prefix    _t_: TeX
_i_: IPA               _x_: X-SAMPA
"
  ("i" (set-input-method "ipa"))
  ("x" (set-input-method "ipa-x-sampa"))
  ("t" (set-input-method "TeX"))
  ("l" (set-input-method "latin-9-prefix"))
  ("SPC" nil "Exit Hydra"))

;; ***** Show various guides *****
(defhydra hydra-guide (:exit t :hint nil)
  "
_b_: Keybindings
"
  ("b" helm-descbinds)
  ("SPC" nil "Exit Hydra"))

;; ***** LaTeX *****
(defhydra hydra-latex (:hint nil)
  "
^Document^       ^Appearance^      ^Navigation
^------------------------------------------
_m_: LaTeXmk  _f_: Fold Buffer     _e_: Env. End
^^            _u_: Unfold Buffer   _a_: Env. Start
"
  ("m" TeX-command-master) ;C-c C-c
  ("f" TeX-fold-buffer) ;C-c C-o C-b
  ("u" TeX-fold-clearout-buffer) ;C-c C-o b
  ("e" LaTeX-find-matching-end) ;C-M-e
  ("a" LaTeX-find-matching-begin) ;C-M-a
  ("SPC" nil "Exit Hydra"))

;; ***** YASnippet *****
(defhydra hydra-yasnippet (:hint nil)
  "
^Modes^      ^Load/Visit:^    ^Actions:
^------------------------------------------

_g_: Global  _d_: Directory    _i_: Insert
_m_: Minor   _f_: File         _t_: Tryout
_e_: Extra   _l_: List         _n_: New
^^           _a_: All
"
  ("d" yas-load-directory)
  ("e" yas-activate-extra-mode)
  ("i" yas-insert-snippet)
  ("f" yas-visit-snippet-file :color blue)
  ("n" yas-new-snippet)
  ("t" yas-tryout-snippet)
  ("l" yas-describe-tables)
  ("g" yas/global-mode)
  ("m" yas/minor-mode)
  ("a" yas-reload-all)
  ("SPC" nil "Exit Hydra"))

;; ***** Org Mode Hydras *****

(defhydra hydra-org-mode (:hint nil)
  "
  ^Main^
  ---------------------------------
  _c_: Org CLock   _a_: Org Agenda
  "
  ("c" hydra-org-clock/body :exit t)
  ("a" hydra-org-agenda/body :exit t)
  ("SPC" nil "Exit Hydra"))

;; ***** Applications *****

(defhydra hydra-applications (:hint nil)
  "
  ^Applications
  ^^^^^^---------------------------------------------
  _r_: Ranger     _d_: Dired    _t_: Tetris

"
  ("r" ranger   :exit t)
  ("d" dired    :exit t)
  ("t" tetris   :exit t)
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

(defhydra hydra-outline (:hint nil)
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

;; ***** Move Text *****

(defhydra hydra-move-text ()
  "Move text"
  ("u" move-text-up "up")
  ("d" move-text-down "down")
  ("SPC" nil "Exit Hydra"))

;; ***** Helm *****

(defhydra hydra-helm (:hint nil)
  "
^Navigation^      ^Other^         ^Sources^        ^Mark^           ^Do^                ^Help
^--------------------------------------------------------------------------------------------------------
_h_: Beggining    _K_: Up         _p_: Previous    _m_: Mark        _v_: View           _H_: Helm help
_j_: Next         _c_: Recenter   _n_: Next        _t_: Toggle all  _d_: Delete         _s_: Source help
_k_: Previous     _J_: Down       ^ ^              _u_: Unmark all  _f_: Follow: %(helm-attr 'follow)
_l_: End          ^ ^             ^ ^              ^ ^              _y_: Yank selection
^ ^               ^ ^             ^ ^              ^ ^              _w_: Toggle windows
"
  ("<tab>" helm-keyboard-quit "back" :exit t)
  ("<escape>" nil "quit")
  ("\\" (insert "\\") "\\" :color blue)
  ("h" helm-beginning-of-buffer)
  ("j" helm-next-line)
  ("k" helm-previous-line)
  ("l" helm-end-of-buffer)
  ("g" helm-beginning-of-buffer)
  ("G" helm-end-of-buffer)
  ("n" helm-next-source)
  ("p" helm-previous-source)
  ("K" helm-scroll-other-window-down)
  ("J" helm-scroll-other-window)
  ("c" helm-recenter-top-bottom-other-window)
  ("m" helm-toggle-visible-mark)
  ("t" helm-toggle-all-marks)
  ("u" helm-unmark-all)
  ("H" helm-help)
  ("s" helm-buffer-help)
  ("v" helm-execute-persistent-action)
  ("d" helm-persistent-delete-marked)
  ("y" helm-yank-selection)
  ("w" helm-toggle-resplit-and-swap-windows)
  ("f" helm-follow-mode)
  ("SPC" nil "Exit Hydra"))


;; Hydra for org agenda (graciously taken from Spacemacs)

(defhydra hydra-org-agenda (:pre (setq which-key-inhibit t)
                                 :post (setq which-key-inhibit nil)
                                 :hint none)
  "
Org agenda (_q_uit)

^Clock^      ^Visit entry^              ^Date^             ^Other^
^-----^----  ^-----------^------------  ^----^-----------  ^-----^---------
_ci_ in      _SPC_ in other window      _ds_ schedule      _gr_ reload
_co_ out     _TAB_ & go to location     _dd_ set deadline  _._  go to today
_cq_ cancel  _RET_ & del other windows  _dt_ timestamp     _gd_ go to date
_cj_ jump    _o_   link                 _+_  do later      ^^
^^           ^^                         _-_  do earlier    ^^
^^           ^^                         ^^                 ^^
^View^          ^Filter^                 ^Headline^         ^Toggle mode^
^----^--------  ^------^---------------  ^--------^-------  ^-----------^----
_vd_ day        _ft_ by tag              _ht_ set status    _tf_ follow
_vw_ week       _fr_ refine by tag       _hk_ kill          _tl_ log
_vt_ fortnight  _fc_ by category         _hr_ refile        _ta_ archive trees
_vm_ month      _fh_ by top headline     _hA_ archive       _tA_ archive files
_vy_ year       _fx_ by regexp           _h:_ set tags      _tr_ clock report
_vn_ next span  _fd_ delete all filters  _hp_ set priority  _td_ diaries
_vp_ prev span  ^^                       ^^                 ^^
_vr_ reset      ^^                       ^^                 ^^
^^              ^^                       ^^                 ^^
"
  ;; Entry
  ("hA" org-agenda-archive-default)
  ("hk" org-agenda-kill)
  ("hp" org-agenda-priority)
  ("hr" org-agenda-refile)
  ("h:" org-agenda-set-tags)
  ("ht" org-agenda-todo)
  ;; Visit entry
  ("o"   link-hint-open-link :exit t)
  ("<tab>" org-agenda-goto :exit t)
  ("TAB" org-agenda-goto :exit t)
  ("SPC" org-agenda-show-and-scroll-up)
  ("RET" org-agenda-switch-to :exit t)
  ;; Date
  ("dt" org-agenda-date-prompt)
  ("dd" org-agenda-deadline)
  ("+" org-agenda-do-date-later)
  ("-" org-agenda-do-date-earlier)
  ("ds" org-agenda-schedule)
  ;; View
  ("vd" org-agenda-day-view)
  ("vw" org-agenda-week-view)
  ("vt" org-agenda-fortnight-view)
  ("vm" org-agenda-month-view)
  ("vy" org-agenda-year-view)
  ("vn" org-agenda-later)
  ("vp" org-agenda-earlier)
  ("vr" org-agenda-reset-view)
  ;; Toggle mode
  ("ta" org-agenda-archives-mode)
  ("tA" (org-agenda-archives-mode 'files))
  ("tr" org-agenda-clockreport-mode)
  ("tf" org-agenda-follow-mode)
  ("tl" org-agenda-log-mode)
  ("td" org-agenda-toggle-diary)
  ;; Filter
  ("fc" org-agenda-filter-by-category)
  ("fx" org-agenda-filter-by-regexp)
  ("ft" org-agenda-filter-by-tag)
  ("fr" org-agenda-filter-by-tag-refine)
  ("fh" org-agenda-filter-by-top-headline)
  ("fd" org-agenda-filter-remove-all)
  ;; Clock
  ("cq" org-agenda-clock-cancel)
  ("cj" org-agenda-clock-goto :exit t)
  ("ci" org-agenda-clock-in :exit t)
  ("co" org-agenda-clock-out)
  ;; Other
  ("q" nil :exit t)
  ("gd" org-agenda-goto-date)
  ("." org-agenda-goto-today)
  ("gr" org-agenda-redo)
  ("SPC" nil "Exit Hydra"))

;; ***** Org mode clock and timers

(defhydra hydra-org-clock (:hint nil)
  "
^Clock:^ ^In/out^     ^Edit^   ^Summary^    | ^Timers:^ ^Run^           ^Insert
-^-^-----^-^----------^-^------^-^----------|--^-^------^-^-------------^------
(_?_)    _i_n         _e_dit   _g_oto entry | (_z_)     _r_elative      ti_m_e
^ ^      _c_ontinue   _q_uit   _d_isplay    |  ^ ^      cou_n_tdown     i_t_em
^ ^      _o_ut        ^ ^      _r_eport     |  ^ ^      _p_ause toggle
^ ^      ^ ^          ^ ^      ^ ^          |  ^ ^      _s_top
"
   ("i" org-clock-in)
   ("c" org-clock-in-last)
   ("o" org-clock-out)

   ("e" org-clock-modify-effort-estimate)
   ("q" org-clock-cancel)

   ("g" org-clock-goto)
   ("d" org-clock-display)
   ("r" org-clock-report)
   ("?" (org-info "Clocking commands"))

  ("r" org-timer-start)
  ("n" org-timer-set-timer)
  ("p" org-timer-pause-or-continue)
  ("s" org-timer-stop)

  ("m" org-timer)
  ("t" org-timer-item)
  ("z" (org-info "Timers"))
  ("SPC" nil "Exit Hydra"))


;; ***** Insert Unicode Characters *****

(defun my/insert-unicode (unicode-name)
  "Same as C-x 8 enter UNICODE-NAME."
  (insert-char (cdr (assoc-string unicode-name (ucs-names)))))

(defhydra hydra-unicode (:hint nil)
  "
Unicode  _e_ €  _s_ ZERO WIDTH SPACE
_f_ ♀  _o_ °   _m_ µ
_r_ ♂  _a_ →
"
  ("e" (my/insert-unicode "EURO SIGN"))
  ("r" (my/insert-unicode "MALE SIGN"))
  ("f" (my/insert-unicode "FEMALE SIGN"))
  ("s" (my/insert-unicode "ZERO WIDTH SPACE"))
  ("o" (my/insert-unicode "DEGREE SIGN"))
  ("a" (my/insert-unicode "RIGHTWARDS ARROW"))
  ("m" (my/insert-unicode "MICRO SIGN"))
  ("SPC" nil "Exit Hydra"))

;; Org-Mode fast refiling https://gist.github.com/mm--/60e0790bcbf8447160cc87a66dc949ab
;; https://mollermara.com/blog/Fast-refiling-in-org-mode-with-hydras/
(defun my/refile (file headline &optional arg)
  "Refile to a specific location.

With a 'C-u' ARG argument, we jump to that location (see
`org-refile').

Use `org-agenda-refile' in `org-agenda' mode."
  (let* ((pos (with-current-buffer (or (get-buffer file)	;Is the file open in a buffer already?
				       (find-file-noselect file)) ;Otherwise, try to find the file by name (Note, default-directory matters here if it isn't absolute)
		(or (org-find-exact-headline-in-buffer headline)
		    (error "Can't find headline `%s'" headline))))
	 (filepath (buffer-file-name (marker-buffer pos)));If we're given a relative name, find absolute path
	 (rfloc (list headline filepath nil pos)))
    (if (and (eq major-mode 'org-agenda-mode) (not (and arg (listp arg)))) ;Don't use org-agenda-refile if we're just jumping
	(org-agenda-refile nil rfloc)
      (org-refile arg nil rfloc))))

(defun josh/refile (file headline &optional arg)
  "Refile to HEADLINE in FILE. Clean up org-capture if it's activated.

With a `C-u` ARG, just jump to the headline."
  (interactive "P")
  (let ((is-capturing (and (boundp 'org-capture-mode) org-capture-mode)))
    (cond
     ((and arg (listp arg))	    ;Are we jumping?
      (my/refile file headline arg))
     ;; Are we in org-capture-mode?
     (is-capturing      	;Minor mode variable that's defined when capturing
      (josh/org-capture-refile-but-with-args file headline arg))
     (t
      (my/refile file headline arg)))
    (when (or arg is-capturing)
      (setq hydra-deactivate t))))

(defun josh/org-capture-refile-but-with-args (file headline &optional arg)
  "Copied from `org-capture-refile' since it doesn't allow passing arguments. This does."
  (unless (eq (org-capture-get :type 'local) 'entry)
    (error
     "Refiling from a capture buffer makes only sense for `entry'-type templates"))
  (let ((pos (point))
	(base (buffer-base-buffer (current-buffer)))
	(org-capture-is-refiling t)
	(kill-buffer (org-capture-get :kill-buffer 'local)))
    (org-capture-put :kill-buffer nil)
    (org-capture-finalize)
    (save-window-excursion
      (with-current-buffer (or base (current-buffer))
	(org-with-wide-buffer
	 (goto-char pos)
	 (my/refile file headline arg))))
    (when kill-buffer (kill-buffer base))))

(defmacro josh/make-org-refile-hydra (hydraname file keyandheadline)
  "Make a hydra named HYDRANAME with refile targets to FILE.
KEYANDHEADLINE should be a list of cons cells of the form (\"key\" . \"headline\")"
  `(defhydra ,hydraname (:color blue :after-exit (unless (or hydra-deactivate
							     current-prefix-arg) ;If we're just jumping to a location, quit the hydra
						   (josh/org-refile-hydra/body)))
     ,file
     ,@(cl-loop for kv in keyandheadline
		collect (list (car kv) (list 'josh/refile file (cdr kv) 'current-prefix-arg) (cdr kv)))
     ("q" nil "cancel")))

;;;;;;;;;;
;; Here we'll define our refile headlines
;;;;;;;;;;

(josh/make-org-refile-hydra josh/org-refile-hydra-file-a
			    "file-a.org"
			    (("1" . "Headline 1")
			     ("2" . "Headline 2")))

(josh/make-org-refile-hydra josh/org-refile-hydra-file-b
			    "file-b.org"
			    (("1" . "One")
			     ("2" . "Two")))

(josh/make-org-refile-hydra josh/org-refile-hydra-file-c
			    "file-c.org"
			    (("1" . "1")
			     ("2" . "2")))

(defhydra josh/org-refile-hydra (:foreign-keys run)
  "Refile"
  ("a" josh/org-refile-hydra-file-a/body "File A" :exit t)
  ("b" josh/org-refile-hydra-file-b/body "File B" :exit t)
  ("c" josh/org-refile-hydra-file-c/body "File C" :exit t)
  ("j" org-refile-goto-last-stored "Jump to last refile" :exit t)
  ("SPC" nil "Exit Hydra"))


(provide 'hydras)
