;;; Code


;; Emacs client for the Language Server Protocol
(use-package lsp-mode
  :ensure t
  :commands
  (lsp lsp-deferred)
  :hook
  ((typescript-mode go-mode web-mode) . lsp-deferred)
  :custom
  (lsp-clients-angular-language-server-command
   '("node"
     "/Users/kumotyou/.config/yarn/global/node_modules/@angular/language-server"
     "--ngProbeLocations"
     "/Users/kumotyou/.config/yarn/global/node_module/node_modules"
     "--tsProbeLocations"
     "/Users/kumotyou/.config/yarn/global/node_modules"
     "--stdio"))
  (lsp-auto-guess-root t)        ; Detect project root
  (lsp-prefer-flymake nil)       ; Use lsp-ui and flycheck
  (lsp-enable-snippet t)
  :config
  (use-package lsp-ui
    :commands lsp-ui
    :after lsp-mode
    :custom
    ;; lsp-ui-doc
    (lsp-ui-doc-enable nil)
    (lsp-ui-doc-header nil)
    (lsp-ui-doc-position 'bottom) ;; top, bottom, or at-point
    (lsp-ui-doc-max-width 120)
    (lsp-ui-doc-max-height 30)
    (lsp-ui-doc-use-childframe t)
    (lsp-ui-doc-use-webkit nil)
    (lsp-ui-doc-delay 0.2)
    ;; lsp-ui-flycheck
    (lsp-ui-flycheck-enable t)
    ;; lsp-ui-sideline
    (lsp-ui-sideline-enable t)
    (lsp-ui-sideline-ignore-duplicate t)
    (lsp-ui-sideline-show-symbol t)
    (lsp-ui-sideline-show-hover nil)
    (lsp-ui-sideline-show-diagnostics nil)
    (lsp-ui-sideline-show-code-actions t)
    (lsp-ui-sideline-code-actions-prefix " ")
    ;; lsp-ui-imenu
    (lsp-ui-imenu-enable t)
    (lsp-ui-imenu-kind-position 'top)
    ;; lsp-ui-peek
    (lsp-ui-peek-enable nil)
    (lsp-ui-peek-peek-height 20)
    (lsp-ui-peek-list-width 50)
    (lsp-ui-peek-fontify 'on-demand)
    (lsp-use-native-json nil)
   )

  (use-package lsp-ivy
    :after lsp-mode
    :bind (:map lsp-mode-map
                ([remap xref-find-apropos] . lsp-ivy-workspace-symbol)
                ("C-s-." . lsp-ivy-global-workspace-symbol)))

  (use-package company-lsp
    :custom
    (company-lsp-cache-candidates 'auto))

  ;; dap
  (use-package dap-mode
    :bind (:map lsp-mode-map
                ("<f5>" . dap-debug)
                ("M-<f5>" . dap-hydra))
    :hook
    (go-mode . (require 'dap-go))
    :init
    (require 'dap-hydra)
    :config
    (use-package dap-ui
      :ensure nil
      :config
      (dap-ui-mode t)))


  (use-package lsp-treemacs
    :bind (:map lsp-mode-map
                ("C-<f8>" . lsp-treemacs-errors-list)
                ("M-<f8>" . lsp-treemacs-symbols))
    :config
    (with-eval-after-load 'ace-window
      (when (boundp 'aw-ignored-buffers)
        (push 'lsp-treemacs-symbols-mode aw-ignored-buffers))))
)



(provide 'init-lsp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lsp.el ends here
