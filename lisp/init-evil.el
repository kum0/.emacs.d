
;;; Code:

(setq evil-want-C-u-scroll t)

(use-package evil
  :init
  (evil-mode t))


(use-package general)
(define-key evil-normal-state-map (kbd "SPC") (general-simulate-key "C-c"))

(general-define-key
 :states '(normal visual)
 :prefix ","
 "," 'counsel-M-x
 "q" 'save-buffers-kill-terminal
 "Q" 'kumo-kill-emacs
 "k" 'symbol-overlay-put
 "K" 'symbol-overlay-remove-all
 "cc" 'comment-dwim-2
 "u" 'undo-tree-visualize
 "f" 'counsel-find-file
 "F" 'counsel-fzf
 "im" 'counsel-imenu
 "ag" 'kumo-ag
 "bb" 'counsel-switch-buffer
 "w" 'avy-goto-char-timer
;; "gb"  'magit-blame-echo
;; "gs"  'magit-status
;; "gm"  'magit-dispatch-popup
)

(general-define-key
 :prefix "C-c"
 "j" 'avy-goto-line-below
 "k" 'avy-goto-line-above
 "R" 'kumo-rename-current-buffer-file
 "K" 'kumo-delete-current-buffer-file
 "t" 'treemacs-select-window
 "T" 'treemacs
 "S" 'counsel-rg
 "s" 'swiper
 "f" 'counsel-find-file
 "F" 'counsel-fzf
 "bb" 'counsel-switch-buffer
 "bt" 'kumo-kill-this-buffer
 "bo" 'kumo-kill-other-buffers
 "ba" 'kumo-kill-all-buffers
 "dr" 'dired
 "ww" 'save-buffer
 "cc" 'comment-dwim-2
)

(general-define-key
 :states '(normal visual)
 "j" 'evil-next-visual-line
 "k" 'evil-previous-visual-line
 "H" 'mwim-beginning-of-code-or-line
 "L" 'mwim-end-of-code-or-line
 "f" 'avy-goto-char-in-line
 "gb" 'pop-tag-mark
 "<f1>" 'start-eshell
)


;; esc quits
(provide 'init-evil)
