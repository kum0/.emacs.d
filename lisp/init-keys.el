;;; Code:


;; global keys
(global-set-key (kbd "<f2>") 'kumo-open-init-file)
(global-set-key (kbd "<C-tab>") 'kumo-indent-all)

(global-set-key (kbd "C-c w w") 'hydra-frame-window/body)
(global-set-key (kbd "C-c w v") 'split-window-vertically)
(global-set-key (kbd "C-c w V") 'kumo-window-vertically-selected)
(global-set-key (kbd "C-c w h") 'split-window-horizontally)
(global-set-key (kbd "C-c w H") 'kumo-window-horizontally-selected)
(global-set-key (kbd "C-c w t") 'delete-window)
(global-set-key (kbd "C-c w q") 'quit-window)
(global-set-key (kbd "C-c w o") 'delete-other-windows)
(global-set-key (kbd "C-c w b") 'kumo-current-buffer-bottom-window)
(global-set-key (kbd "C-c w m") 'kumo-select-minibuffer-window)

(global-set-key (kbd "C-c n d") 'kumo-number-division)

(global-set-key (kbd "M-p") 'beginning-of-buffer)
(global-set-key (kbd "M-n") 'end-of-buffer)

(global-set-key (kbd "C-c f n") 'kumo-put-file-name-on-clipboard)
(global-set-key (kbd "C-c f d") 'kumo-open-current-file-in-finder)

(global-set-key (kbd "C-c b t") 'kumo-kill-this-buffer)
(global-set-key (kbd "C-c b o") 'kumo-kill-other-buffers)
(global-set-key (kbd "C-c b a") 'kumo-kill-all-buffers)
(global-set-key (kbd "C-c b p") 'kumo-switch-to-previous-buffer)
(global-set-key (kbd "C-c b R") 'kumo-rename-current-buffer-file)
(global-set-key (kbd "C-c b D") 'kumo-delete-current-buffer-file)

(global-set-key (kbd "C-c c c") 'kumo-flycheck-list-errors-toggle)
(global-set-key (kbd "C-c c s") 'kumo-flycheck-list-errors-select-window)

(global-set-key (kbd "C-c T 0") 'kumo-current-theme)
(global-set-key (kbd "C-c F 0") 'kumo-current-font)

(global-set-key (kbd "C-c z") 'kumo-wrap-with-input)

;; like vim
(global-set-key (kbd "C-c d i w") 'kumo-delete-word-at-point)
(global-set-key (kbd "C-c y i w") 'kumo-save-word-at-point)
(global-set-key (kbd "C-o") 'kumo-newline-next-current)
(global-set-key (kbd "C-S-o") 'kumo-newline-above-current)

;; replace key
(global-set-key (kbd "C-<backspace>") 'kumo-backward-delete-word) ;; replace C-<backspace>
(global-set-key (kbd "M-d") 'kumo-delete-word) ;; replace M-d
(global-set-key (kbd "C-k") 'kumo-kill-line) ;; replace C-k
(global-set-key (kbd "C-S-<backspace>") 'kumo-kill-whole-line) ;; replace C-S-<backspace>

;; replace func
(global-set-key (kbd "C-x s") 'kumo-save-some-buffers) ;; replace 'save-some-buffer


(provide 'init-keys)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-keys.el ends here
